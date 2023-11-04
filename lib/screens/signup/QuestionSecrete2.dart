import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testingg/screens/PageMotSecret2.dart';
import 'package:testingg/screens/Passwordforgotten.dart';
import 'package:testingg/screens/Routes/CustomPageRouteRight.dart';
import 'package:testingg/cubit/app_cubit.dart';

class QuestionSecrete2Screen extends StatefulWidget {
  const QuestionSecrete2Screen({Key? key}) : super(key: key);

  @override
  _QuestionSecrete2ScreenState createState() => _QuestionSecrete2ScreenState();
}

class _QuestionSecrete2ScreenState extends State<QuestionSecrete2Screen> {
  var question1 = TextEditingController();
  var question2 = TextEditingController();
  var question3 = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final double spacing = 20.0; // Espacement constant entre les widgets

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              CustomPageRouteRight(child: const PasswordforgottenScreen()),
            );
          },
        ),
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 68.0),
            child: Text(
              'Réinitialiser mot de passe',
            ),
          ),
        ),
        backgroundColor: const Color(0xff4c91bc),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Container(
            height: 550,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.grey,
                width: 0.4,
              ),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                width: 280,
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Questions secretes ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: spacing),
                      const Text(
                        'Merci de repondre a ces questions ',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: spacing),
                      buildEmailTextField(),
                      buildDivider(),
                      buildNewPasswordTextField(),
                      buildDivider(),
                      buildConfirmPasswordTextField(),
                      SizedBox(height: spacing),
                      buildSubmitButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEmailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quel est votre lieu de naissance ? ",
          style: TextStyle(
            fontSize: 18,
            color: Colors.blueGrey,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: question1,
          cursorColor: Colors.green,
          cursorHeight: 19,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return "Ce champs ne doit pas être vide";
            }
            // Add email validation if necessary
            return null;
          },
          style: GoogleFonts.manrope(
            height: 0.7,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.question_answer,
              color: Color(0xff4c91bc),
            ),
            fillColor: const Color(0xff243656),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.green,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.green,
                width: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNewPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quelle est votre couleur preferee ?",
          style: TextStyle(
            fontSize: 18,
            color: Colors.blueGrey,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: question2,
          cursorColor: Colors.green,
          cursorHeight: 19,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value!.isEmpty) {
              return "Ce champs ne doit pas être vide";
            }
            return null;
          },
          style: GoogleFonts.manrope(
            height: 0.7,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.question_answer,
              color: Color(0xff4c91bc),
            ),
            fillColor: const Color(0xff243656),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.green,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.green,
                width: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildConfirmPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quel est votre pseudonyme ?",
          style: TextStyle(
            fontSize: 18,
            color: Colors.blueGrey,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: question3,
          cursorColor: Colors.green,
          cursorHeight: 19,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value!.isEmpty) {
              return "Ce champs ne doit pas être vide";
            }
            return null;
          },
          style: GoogleFonts.manrope(
            height: 0.7,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.question_answer,
              color: Color(0xff4c91bc),
            ),
            fillColor: const Color(0xff243656),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.green,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.green,
                width: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDivider() {
    return const Divider(
      thickness: 0.3,
      color: Colors.grey,
    );
  }

  Widget buildSubmitButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          if (formkey.currentState!.validate()) {
            AppCubit.get(context).question1 = question1.text;
            AppCubit.get(context).question2 = question2.text;
            AppCubit.get(context).question3 = question3.text;
            AppCubit cubit = AppCubit.get(context);

            String userEmail = cubit.email ?? '';

            cubit.sendMotsecret(
              email: userEmail,
            );

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PageMotSecret2()),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          onPrimary: Colors.white,
          padding: const EdgeInsets.all(0),
          shape: const StadiumBorder(),
          minimumSize: const Size(225, 55),
        ),
        child: Text(
          'VALIDER',
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}
