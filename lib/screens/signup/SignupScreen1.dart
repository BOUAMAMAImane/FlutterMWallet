
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:testingg/cubit/app_cubit.dart';
import 'package:testingg/cubit/app_states.dart';
import 'package:testingg/generated/l10n.dart';
import 'package:testingg/screens/signup/OtpScreen.dart';
import 'package:testingg/shared/component.dart';

import 'package:iconify_flutter/iconify_flutter.dart';
class SignupScreen1 extends StatelessWidget {
  static String id = "SignupScreen1";

  const SignupScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    var phonenumberController = TextEditingController();

    var cinController = TextEditingController();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSendOtpSuccessState) {
          showToast(message: state.message);
        }
      },
      builder: (context, state) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.blueGrey,
              title: Row(children: <Widget>[
                Text(
                  S.of(context).activation,
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
                height: MediaQuery.of(context).size.height / 1.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
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
                            S.of(context).step_1,
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            S.of(context).enter_your_phone_number_and_your_cin,
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            child: Focus(
                              canRequestFocus: false,
                              onFocusChange: (hasfocus){
                                if(!hasfocus){
                                  AppCubit.get(context).verifyphone(phonenumberController.text);

                                }
                              },
                              child: TextFormField(

                                keyboardType: TextInputType.phone,
                                controller: phonenumberController,

                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return S.of(context).the_phone_number_must_not_be_empty;
                                  }else  if(AppCubit.get(context).verifiedphone == true){
                                    return S.of(context).phone_number_already_exist;
                                  }else
                                    return null;
                                },
                                onEditingComplete: (){
                                  FocusScope.of(context).nextFocus();
                                },
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.phone,
                                    color: Colors.green,
                                  ),
                                  hintText: S.of(context).enter_your_phone_number,
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
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 22),
                            child: Focus(
                              canRequestFocus: false,
                              onFocusChange:(hasfocus){
                                if(!hasfocus){

                                  AppCubit.get(context).verifycin(cinController.text) ;

                                }
                              },
                              child: TextFormField(
                                textCapitalization: TextCapitalization.characters,
                                controller: cinController,
                                onFieldSubmitted: (value){
                                  AppCubit.get(context).verifycin(value);
                                },
                                onEditingComplete: (){
                                  FocusScope.of(context).nextFocus();
                                },
                                validator: (value)  {
                                  if (value!.isEmpty) {

                                    return S.of(context).the_cin_must_not_be_empty;
                                  } else if(AppCubit.get(context).verifiedcin == true)
                                  {
                                    return S.of(context).cin_already_exist;
                                  }
                                  else {
                                    return null;
                                  }
                                },
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child:Iconify(Mdi.smart_card_outline,color: Colors.green) ,
                                  ),
                                  hintText: S.of(context).cin,
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
                            child: Text(
                              S.of(context).terms_of_use,
                              style: GoogleFonts.manrope(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 170,
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
                                  print(phonenumberController.text);
                                  print(cinController.text);
                                  AppCubit.get(context).sendOtp(phonenumberController.text);
                                  navigateAndFinish(context, OTP());
                                  AppCubit.get(context).phone_number = phonenumberController.text;
                                  AppCubit.get(context).cin = cinController.text;
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
                                        S.of(context).next,
                                        style: GoogleFonts.manrope(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                      const Icon(Icons.navigate_next),
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
