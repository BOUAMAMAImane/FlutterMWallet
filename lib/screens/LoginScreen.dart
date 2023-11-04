import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testingg/cubit/app_cubit.dart';
import 'package:testingg/cubit/app_states.dart';
import 'package:testingg/network/local/cache_helper.dart';
import 'package:testingg/screens/HomeScreen.dart';
import 'package:testingg/screens/Passwordforgotten.dart';
import 'package:testingg/screens/signup/SignupScreen1.dart';
import 'package:testingg/shared/component.dart';
// import 'package:flutter/cupertino.dart';
import 'package:device_info/device_info.dart';
import 'package:location/location.dart';
import 'package:testingg/generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  static String id = "LoginScreen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var phoneNumberController = TextEditingController();
  var passwordLogController = TextEditingController();
  bool _isObscure = true;
  String? deviceId;
  double? latitude;
  double? longitude;

/*  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );


      print(
          "Latitude : ${position.latitude}, Longitude : ${position.longitude}");
    }

  }*/
  Future<void> _getUserLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionStatus;
    LocationData? locationData;

    // Vérifier si le service de localisation est activé
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      // Demander à l'utilisateur d'activer les services de localisation
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        // Le service de localisation n'est toujours pas activé
        // Handle this case (e.g., show a message to the user) or simply return
        print('Les services de localisation sont désactivés.');
        return;
      }
    }

    // Vérifier la permission de localisation
    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      // Demander à l'utilisateur la permission de localisation
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        // La permission de localisation n'est pas accordée
        // Handle this case (e.g., show a message to the user) or simply return
        print('La permission de localisation n\'est pas accordée.');
        return;
      }
    }

    // Obtenir les données de localisation
    try {
      locationData = await location.getLocation();
      latitude = locationData?.latitude; // Retirez le type de données ici
      longitude = locationData?.longitude;
      // double? latitude = locationData?.latitude;
      // double? longitude = locationData?.longitude;
      print("Latitude: $latitude, Longitude: $longitude"); // Imprimer les valeurs obtenues
    } catch (e) {
      // Gérer les erreurs lors de la récupération de la localisation ici
      print("Erreur lors de la récupération de la localisation: $e");
    }
  }


  Future<String?> _getDeviceId(BuildContext context) async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      if (Theme.of(context).platform == TargetPlatform.android) {
        final AndroidDeviceInfo

        androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.androidId;
      } else if (Theme.of(context).platform == TargetPlatform.iOS) {
        final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor;
      }
    } catch (e) {
      print("Erreur lors de la récupération de l'ID du smartphone: $e");
      deviceId = null;
    }

    return deviceId;
  }
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) async {
        if (state is AppLoginSuccessStates) {
          String? token = await FirebaseMessaging.instance.getToken();

          AppCubit.get(context).addTokenToUser(
              AppCubit.get(context).userModel?.data.email, token);
          CacheHelper.saveData(key: 'token', value: state.userModel.token);
          CacheHelper.saveData(key: 'email', value: state.userModel.data.email);
          CacheHelper.saveData(
              key: 'phoneNumber', value: state.userModel.data.phoneNumber);
          showToast(message: state.userModel.message);
          navigateAndFinish(context, const HomeScreen());
        } else if (state is AppLoginErrorStates) {
          showToast(message: state.error);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, right: 40),
                      child: InkWell(
                        child: Ink(
                          width: 60,
                          height: 60,
                          child: Column(
                            children: const [
                              Icon(
                                Icons.language,
                                size: 40,
                                color: Colors.blueGrey,
                              ),
                              Text(
                                'Langue',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      S.of(context).choose_language_title,
                                      style: const TextStyle(
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
                                        AppCubit.get(context)
                                            .changeLocale("ar", context);
                                      },
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
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
                                        AppCubit.get(context)
                                            .changeLocale("fr", context);
                                      },
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
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
                                        AppCubit.get(context)
                                            .changeLocale("en", context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 55, right: 55, top: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 200,
                            margin: const EdgeInsets.only(top: 40),
                            child: const Image(
                                image: AssetImage("images/payit_login.png")),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 70),
                            child: TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return S.of(context)
                                      .the_phone_number_must_not_be_empty;
                                }
                                return null;
                              },
                              controller: phoneNumberController,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.all(0.0),
                                  child: Icon(
                                    Icons.phone,
                                    color: Colors.green,
                                  ),
                                ),
                                hintText:
                                S.of(context).enter_your_phone_number,
                                fillColor: const Color(0xff243656),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.green, width: 2.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.green, width: 2.0),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 30),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return S.of(context)
                                      .the_Password_must_not_be_empty;
                                }
                                return null;
                              },
                              controller: passwordLogController,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.all(0.0),
                                  child: Icon(
                                    Icons.lock,
                                    color: Colors.green,
                                  ),
                                ),
                                hintText: S.of(context).password,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: _isObscure
                                        ? Colors.green
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                ),
                                fillColor: const Color(0xff243656),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.green, width: 2.0),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                  const Color(0xff1546A0).withOpacity(0.5),
                                  offset: const Offset(0, 24),
                                  blurRadius: 50,
                                  spreadRadius: -18,
                                ),
                              ],
                            ),
                              child: ElevatedButton(
                                onPressed: () async  {
                              if (_formKey.currentState!.validate()) {
                                String? deviceId = await _getDeviceId(context);
                                print("Device ID: $deviceId");
                                await _getUserLocation();
                                AppCubit.get(context).userLogin(
                                phone_number: phoneNumberController.text,
                                password: passwordLogController.text,
                                deviceId: deviceId,
                                  latitude: latitude,
                                  longitude: longitude,
                              );
                              }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(0),
                              shape: const StadiumBorder(),
                              ),


                              child: Container(
                                width: 275,
                                height: 65,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.green,
                                      Color(0xff1546A0),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  S.of(context).log_in,
                                  style: GoogleFonts.manrope(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: TextButton(
                              onPressed: () {
                                // Naviguer vers l'écran de réinitialisation du mot de passe
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PasswordforgottenScreen(), // À implémenter
                                  ),
                                );
                              },
                              child: Text(
                                S.of(context).forgot_password,
                                style: TextStyle(
                                  color: const Color(0xff1546A0).withOpacity(0.5), // Même couleur que le texte "Not a member?"
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 65),
                            child: Text(
                              S.of(context).not_member,
                              style: GoogleFonts.manrope(
                                color:
                                const Color(0xff1546A0).withOpacity(0.5),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 28),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xffF5F7FA),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const SizedBox(
                              height: 0,
                              width: 65,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 22, bottom: 22),
                            child: TextButton(
                              onPressed: () {
                                navigateTo(context, const SignupScreen1());
                              },
                              child: Text(
                                S.of(context).register,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
