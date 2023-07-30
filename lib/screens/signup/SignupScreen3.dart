import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testingg/cubit/app_cubit.dart';
import 'package:testingg/cubit/app_states.dart';
import 'package:testingg/screens/signup/ConfirmationEmailScreen.dart';
import 'package:testingg/shared/component.dart';

import '../../generated/l10n.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
// l'utilisateur est invité à saisir son mot de passe deux fois

class SignupScreen3 extends StatelessWidget {
  static String id = "SignupScreen";
  const SignupScreen3({Key? key}) : super(key: key);

  Future<String?> _getDeviceId(BuildContext context) async {
    String? deviceId;
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      if (Theme.of(context).platform == TargetPlatform.android) {
        final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
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
    final jobRoleCtrl = TextEditingController();

    final formkey = GlobalKey<FormState>();

    bool _isObscure = true;
    var passwordRegController = TextEditingController();
    var passwordConfRegController = TextEditingController();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSigninSuccessStates) {
          showToast(message: "registered");
          navigateTo(context, const ConfirmationScreen());
        } else if (state is AppLoginErrorStates) {
          showToast(message: state.error);
        }
      },
      builder: (context, state) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.blueGrey,
              title: Row(children: <Widget>[
                Text(
                  "  Activation",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  ),
                )
              ])),
          backgroundColor: Colors.blueGrey,
          body: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 22),
            child: Form(
              key: formkey,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: MediaQuery.of(context).size.height / 1.2,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 55, right: 55, top: 70, bottom: 30),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).Security,
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            S.of(context).Enter_new_password,
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 22),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return S.of(context).passwordcontrollermg;
                                }
                                return null;
                              },
                              controller: passwordRegController,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.password,
                                  color: Colors.green,
                                ),
                                hintText: S.of(context).password,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color:
                                    _isObscure ? Colors.green : Colors.grey,
                                  ),
                                  onPressed: () {
                                    _isObscure = !_isObscure;
                                  },
                                ),
                                fillColor: Color(0xff243656),
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
                            margin: EdgeInsets.only(top: 22),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return S.of(context).Enter_new_password;
                                }
                                return null;
                              },
                              controller: passwordConfRegController,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.password,
                                  color: Colors.green,
                                ),
                                hintText: S.of(context).confirm_password,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color:
                                    _isObscure ? Colors.green : Colors.grey,
                                  ),
                                  onPressed: () {
                                    _isObscure = !_isObscure;
                                  },
                                ),
                                fillColor: Color(0xff243656),
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
                          const SizedBox(
                            height: 210,
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
                              onPressed: () async {
                                if (formkey.currentState!.validate()) {
                                  String? deviceId = await _getDeviceId(context); // Get the device ID
                                  AppCubit.get(context).userSignUp(
                                    gender: AppCubit.get(context).gender,
                                    email: AppCubit.get(context).email,
                                    phoneNumber:
                                    AppCubit.get(context).phone_number,
                                    password: passwordRegController.text,
                                    firstName: AppCubit.get(context).firstName,
                                    lastName: AppCubit.get(context).lastName,
                                    cin: AppCubit.get(context).cin,
                                    deviceId: deviceId,
                                    // Récupérer l'ID du smartphone
                                   // String? deviceId = await _getDeviceId();
                                    // deviceId: AppCubit.get(context).deviceId,

                                );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                shape: const StadiumBorder(),
                                padding: const EdgeInsets.all(0),
                              ),
                              child: Ink(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.green, Color(0xff1546A0)],
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Container(
                                  width: 275,
                                  height: 65,
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        S.of(context).NEXT,
                                        style: GoogleFonts.manrope(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                      const Icon(Icons.navigate_next)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
