import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testingg/cubit/app_cubit.dart';
import 'package:testingg/cubit/app_states.dart';
import 'package:testingg/generated/l10n.dart';
import 'package:testingg/screens/signup/SignupScreen1.dart';
import 'package:testingg/screens/signup/SignupScreen2.dart';
import 'package:testingg/shared/component.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../Routes/custom_page_route.dart';

class OTP extends StatelessWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    snackBar(String? message) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message!),
          duration: const Duration(seconds: 2),
        ),
      );
    }

    final formkey = GlobalKey<FormState>();
    var otpController = OtpFieldController();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppVerifyOtpSuccessState) {
          showToast(message: state.message);
        } else if (state is AppVerifyOtpErrorState) {
          showToast(message: "otp incorrect");
          otpController.clear();
        }
      },
      builder: (context, state) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.blueGrey,
            title: Row(
              children: <Widget>[
                Text(
                  "  Activation",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  ),
                )
              ],
            ),
          ),
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
                      left: 55,
                      right: 55,
                      top: 25,
                      bottom: 30,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).step_2,
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            S.of(context).Enter_the_code_sent_to,
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${AppCubit.get(context).phone_number}",
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              TextButton(
                                onPressed: () => navigateAndFinish(
                                  context,
                                  const SignupScreen1(),
                                ),
                                child: Text(
                                  S.of(context).MODIFY,
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Container(
                            height: 190,
                            width: 190,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/OTPP.png'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          OTPTextField(
                            controller: otpController,
                            length: 5,
                            width: MediaQuery.of(context).size.width,
                            fieldWidth: 40,
                            style: const TextStyle(fontSize: 17),
                            textFieldAlignment:
                            MainAxisAlignment.spaceAround,
                            fieldStyle: FieldStyle.underline,
                            onCompleted: (pin) {
                              AppCubit.get(context).verifyOtp(pin);
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context).Didnt_receive_the_code,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                              ),
                              TextButton(
                                onPressed: () => snackBar("OTP resend!!"),
                                child: Text(
                                  S.of(context).RESEND,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 110,
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
                              onPressed: AppCubit.get(context).verified
                                  ? () {
                                Navigator.of(context).push(
                                  CustomPageRouteLeft(
                                    child: const SignupScreen2(),
                                  ),
                                );
                              }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                onPrimary: Colors.white,
                                padding: const EdgeInsets.all(0),
                                shape: const StadiumBorder(),
                                minimumSize: const Size(275, 65),
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
                                    const Icon(Icons.navigate_next),
                                  ],
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
