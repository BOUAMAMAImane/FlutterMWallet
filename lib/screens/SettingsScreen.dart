import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:testingg/screens/ResetPasswordScreen.dart';
import '../cubit/app_cubit.dart';
import '../generated/l10n.dart';
import '../network/local/cache_helper.dart';

import 'HomeScreen.dart';
import 'LoginScreen.dart';

import 'Routes/CustomPageRouteRight.dart';
import 'Routes/custom_page_route.dart';


class SettingsScreen extends StatelessWidget {

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(.94),
        appBar: AppBar(
          leading: IconButton(
            icon:const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(
                CustomPageRouteRight(child:const HomeScreen()),
              );
            },
          ),
          title:const Padding(
            padding:  EdgeInsets.only(left: 78.0),
            child:  Text(
              'Paramètres',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor:const Color(0xff4c91bc),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              // user cards
              const    SizedBox(height: 120,),

              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () { Navigator.pushAndRemoveUntil(
                        context, CustomPageRouteLeft(child: const ResetPasswordScreen()),(route)=>false
                    );},
                    icons: CupertinoIcons.lock,
                    iconStyle: IconStyle(
                      backgroundColor: const Color(0xff4c91bc),),
                    title: 'réinitialiser mot de passe',
                    subtitle: "**********",
                  ),

                  SettingsItem(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  S.of(context).choose_language_title,
                                  style:const TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20),

                                ),
                                ListTile(
                                  leading: Text(
                                    'العربية',
                                    style: GoogleFonts.manrope(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),


                                  onTap: () {
                                    AppCubit.get(context).changeLocale("ar",context);




                                  },
                                ),
                                const    SizedBox(height: 5,),
                                ListTile(
                                  leading: Text(
                                    'Français',
                                    style: GoogleFonts.manrope(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),

                                  onTap: () {

                                      AppCubit.get(context).changeLocale("fr",context);
                                      },
                                ),
                                const    SizedBox(height: 5,),
                                ListTile(
                                  leading: Text(
                                    'english',
                                    style: GoogleFonts.manrope(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),

                                  onTap: () {

                                      AppCubit.get(context).changeLocale("en",context);

                                  },
                                ),
                              ],
                            ),
                          ));
                    },
                    icons: Icons.language,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor:const Color(0xff4c91bc),
                    ),
                    title: 'Changer la langue ',
                    subtitle: "Francais",

                  ),
                ],
              ),

              // You can add a settings title
              SettingsItem(


                    iconStyle: IconStyle(iconsColor: Colors.red,backgroundColor: Colors.transparent),
                    titleStyle:const TextStyle(fontWeight: FontWeight.bold,color: Colors.red),

                    onTap: () {


                      AppCubit.get(context).removeFcmToken(AppCubit.get(context).userModel?.data.email);

                    CacheHelper.removeData(key: 'token');
                    CacheHelper.removeData(key: 'email');

                    Navigator.pushAndRemoveUntil(
                        context, CustomPageRouteLeft(child:const LoginScreen()),(route)=>false
                    );

                    AppCubit.get(context).currentIndex=0;
                      AppCubit.get(context).userModel=null;},
                    icons: Icons.exit_to_app_rounded,
                subtitle: "Êtes vous sûr?",
                    title: S.of(context).logout,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}