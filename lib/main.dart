import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testingg/cubit/app_cubit.dart';
import 'package:testingg/cubit/app_states.dart';
import 'package:testingg/cubit/bloc_observer.dart';
import 'package:testingg/network/remote/dio_helper.dart';

import 'package:testingg/screens/AccueilScreen.dart';
import 'package:testingg/screens/HomeScreen.dart';
import 'package:testingg/screens/LoginScreen.dart';
import 'package:testingg/screens/signup/SignupScreen1.dart';
import 'package:testingg/shared/component.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'network/local/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
DioHelper.init();
  await CacheHelper.init();
  DioHelper.init();

  String? token;

  try {
    token = CacheHelper.getData(key: 'token');
  } catch (e) {
    print(e);
  }



  if (token == null) {
    AppCubit.widget = const LoginScreen();
  } else if (jwtVerification(token) == false) {

    AppCubit.widget = const HomeScreen();

  } else {
    AppCubit.widget = const LoginScreen();
  }

  BlocOverrides.runZoned(
        () {
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  _MyAppState();

  @override
  initState() {
    super.initState();
    initLang();
    initDynamicLinks();
  }

  Future<void> initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      showToast(message: "Email Verified");
      Get.to(() => const LoginScreen());
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
  }

  Future<void> initLang() async {
    String? lang = CacheHelper.getData(key: "lang");
    if (lang != null) {
      AppCubit.currentLocale = Locale(lang);
    }
  }

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AppCubit()..getSessionid()
                ..loadLoggedInUserNative(CacheHelper.getData(key: 'phoneNumber'))),
        ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {
            if (state is LoadLoggedInUserErrorStates) {
              Get.off(() => const LoginScreen());
            }
          },
          builder: (context, state) => GetMaterialApp(
            locale: AppCubit.currentLocale,
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            home: AnimatedSplashScreen(
              splashIconSize: 500,
              // nextScreen: ,
              nextScreen: AppCubit.widget,
              backgroundColor: Colors.white,
              splashTransition: SplashTransition.fadeTransition,
              duration: 3000,
              splash: Center(
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/Payit.png'),
                        ),
                      ),
                    ),
                    TyperAnimatedTextKit(
                      text: const ["Discover The Future \n With US..."],
                      textStyle: GoogleFonts.manrope(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.center,
                      speed: const Duration(milliseconds: 100),
                    ),
                    const Spacer(),
                    const CircularProgressIndicator(
                        backgroundColor: Colors.blueGrey,
                        color:  Color(0xff4c91bc)),
                  ],
                ),
              ),
            ),
            routes: {
              SignupScreen1.id: (context) => const SignupScreen1(),
              LoginScreen.id: (context) => const LoginScreen(),
              // HomePage.id: (context) => const HomePage(),

              AccueilScreen.id: (context) => AccueilScreen(),
            },
          ),
        ));
  }

}
