import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testingg/cubit/app_cubit.dart';
import 'package:testingg/cubit/app_states.dart';
import 'package:testingg/screens/signup/ConfirmationEmailScreen.dart';
import 'package:testingg/screens/signup/SignupScreen3.dart';
import 'package:testingg/shared/Colors.dart';
import 'package:testingg/shared/component.dart';

import '../../generated/l10n.dart';
import '../Routes/custom_page_route.dart';

class SignupScreen2 extends StatelessWidget {
  static String id = "SignupScreen2";

  const SignupScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jobRoleCtrl = TextEditingController();

    final formkey = GlobalKey<FormState>();

    var lasttnameController = TextEditingController();

    var firstnameController = TextEditingController();
    var emailController = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSigninSuccessStates) {
          showToast(message: "registrated");

          navigateAndFinish(context, const ConfirmationScreen());
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
                        left: 55, right: 55, top: 50, bottom: 30),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).step_3,
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            S.of(context).Enter_your_first_last_name,
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomRadioButton(
                            enableShape: true,
                            selectedBorderColor: Colors.grey,
                            unSelectedBorderColor: Colors.grey,
                            absoluteZeroSpacing: false,
                            elevation: 0,
                            unSelectedColor: Colors.white,
                            buttonLables: const [
                              'Monsieur',
                              'Madame',
                            ],
                            buttonValues: const [
                              "Homme",
                              "Femme",
                            ],
                            buttonTextStyle: const ButtonTextStyle(
                                selectedColor: Colors.white,
                                unSelectedColor: Colors.black,
                                textStyle: TextStyle(fontSize: 16)),
                            radioButtonValue: (value) {
                              print(value);
                              AppCubit.get(context).gender = value.toString();
                            },
                            selectedColor: Colors.blueGrey,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 22),
                            child: Focus(
                              canRequestFocus: false,
                              onFocusChange: (hasfocus) {
                                if (!hasfocus) {
                                  AppCubit.get(context)
                                      .verifyEmail(emailController.text);
                                }
                              },
                              child: TextFormField(
                                onEditingComplete: () {
                                  FocusScope.of(context).nextFocus();
                                },
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return S.of(context).emailcontrollermsg;
                                  } else if (AppCubit.get(context)
                                      .verifiedEmail ==
                                      true) {
                                    return S.of(context).email_existe;
                                  } else
                                    return null;
                                },
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.alternate_email,
                                    color: Colors.green,
                                  ),
                                  hintText: S.of(context).HintEmail,
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
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            child: TextFormField(
                              onEditingComplete: () {
                                FocusScope.of(context).nextFocus();
                              },
                              controller: firstnameController,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return S.of(context).firstnamecontrollermsg;
                                }
                                return null;
                              },
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.green,
                                ),
                                hintText: S.of(context).HintFirstname,
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
                            margin: const EdgeInsets.only(top: 22),
                            child: TextFormField(
                              controller: lasttnameController,
                              onEditingComplete: () {
                                FocusScope.of(context).nextFocus();
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return S.of(context).lastnameecontrollermsg;
                                }
                                return null;
                              },
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.green,
                                ),
                                hintText: S.of(context).HintLastname,
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
                          const SizedBox(
                            height: 190,
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
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  AppCubit.get(context).email =
                                      emailController.text;
                                  AppCubit.get(context).firstName =
                                      firstnameController.text;
                                  AppCubit.get(context).lastName =
                                      lasttnameController.text;
                                  Navigator.of(context).push(
                                    CustomPageRouteLeft(
                                      child: SignupScreen3(),
                                    ),
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
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
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
