import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testingg/cubit/app_cubit.dart';
import 'package:testingg/shared/component.dart';
import 'package:testingg/screens/signup/SignupScreen3.dart';
import 'package:testingg/screens/signup/ConfirmationEmailScreen.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:testingg/cubit/app_states.dart';

class QuestionSecreteP extends StatelessWidget {
  static String id = "QuestionSecrete";

  final TextEditingController _question1Controller = TextEditingController();
  final TextEditingController _question2Controller = TextEditingController();
  final TextEditingController _question3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // Listener code...
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
                            "Etape 5 : Questions secrètes",
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Enter your security questions",
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Column(
                            children: [
                              // Question 1
                              Container(
                                margin: const EdgeInsets.only(top: 22),
                                child: Text(
                                  "Question 1 : Votre lieu de naissance ? ",
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Focus(
                                canRequestFocus: false,
                                child: TextFormField(
                                  onEditingComplete: () {
                                    FocusScope.of(context).nextFocus();
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _question1Controller,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Question 1 is required";
                                    }
                                    return null;
                                  },
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.question_answer_outlined,
                                      color: Colors.green,
                                    ),
                                    hintText: "Reponse 1",
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
                              // Question 2
                              Container(
                                margin: const EdgeInsets.only(top: 30),
                                child: Text(
                                  "Question 2 : Votre couleur preferee ?",
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              TextFormField(
                                onEditingComplete: () {
                                  FocusScope.of(context).nextFocus();
                                },
                                controller: _question2Controller,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Question 2 is required";
                                  }
                                  return null;
                                },
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.question_answer_outlined,
                                    color: Colors.green,
                                  ),
                                  hintText: "Reponse 2",
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
                              // Question 3
                              Container(
                                margin: const EdgeInsets.only(top: 22),
                                child: Text(
                                  "Question 3 : Votre pseudonyme ?",
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: _question3Controller,
                                onEditingComplete: () {
                                  FocusScope.of(context).unfocus();
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Question 3 is required";
                                  }
                                  return null;
                                },
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.question_answer,                                    color: Colors.green,
                                  ),
                                  hintText: "Reponse 3",
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
                            ],
                          ),
                          const SizedBox(
                            height: 190,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xff1546A0).withOpacity(0.5),
                                  offset: const Offset(0, 24),
                                  blurRadius: 50,
                                  spreadRadius: -18,
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  AppCubit.get(context).userSignUp(
                                    gender: AppCubit.get(context).gender,
                                    email: AppCubit.get(context).email,
                                    phoneNumber: AppCubit.get(context).phone_number,
                                    password: AppCubit.get(context).password,
                                    firstName: AppCubit.get(context).firstName,
                                    lastName: AppCubit.get(context).lastName,
                                    cin: AppCubit.get(context).cin,
                                    question1: _question1Controller.text,
                                    question2: _question2Controller.text,
                                    question3: _question3Controller.text,
                                    deviceId: AppCubit.get(context).deviceId,
                                  );
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ConfirmationScreen(),
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
                                        "NEXT",
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


                          // Next button and its logic...
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
