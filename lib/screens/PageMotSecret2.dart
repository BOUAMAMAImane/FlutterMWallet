import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testingg/models/userModel.dart';
import 'package:testingg/cubit/app_cubit.dart';
import 'package:testingg/screens/LoginScreen.dart';


class PageMotSecret2 extends StatefulWidget {

  @override
  _PageMotSecretState2 createState() => _PageMotSecretState2();
}

class _PageMotSecretState2 extends State<PageMotSecret2> {
  final TextEditingController _secretTextController = TextEditingController();
  String _logMessage = '';

  @override
  void dispose() {
    _secretTextController.dispose();
    super.dispose();
  }

  void _validerMotSecret() async {
    String enteredSecret = _secretTextController.text;
    setState(() {
      _logMessage = "Mot secret entré : $enteredSecret";
    });

    AppCubit.get(context).makenewPassword(
      email: AppCubit
          .get(context)
          .email!,
      question3: AppCubit
          .get(context)
          .question3!,
      question2: AppCubit
          .get(context)
          .question2!,
      question1: AppCubit
          .get(context)
          .question1!,
      password: AppCubit
          .get(context)
          .password!,
      secret: enteredSecret,
      context: context,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Mot Secret'),
        backgroundColor: const Color(0xff4c91bc),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                height: 75,
                width: 75,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/email.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                'Confirmez votre identité  ',
                style: GoogleFonts.manrope(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                'Nous avons envoyé un e-mail contenant un Mot secret à ',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    color: Colors.blueGrey),
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                "${AppCubit.get(context).email}",
                style: GoogleFonts.manrope(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                "Merci d'entrer le mot",

                style: GoogleFonts.manrope(
                  fontSize: 18,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(height: 10),
              Text(
                _logMessage,
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  color: Colors.green,
                ),
              ),
              TextFormField(
                controller: _secretTextController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.security,
                    color: Color(0xff4c91bc),
                  ),
                  labelText: 'Mot secret',
                  labelStyle: GoogleFonts.manrope(
                    fontSize: 18,
                    color: Colors.blueGrey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                style: GoogleFonts.manrope(
                  height: 0.7,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _validerMotSecret();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  onPrimary: Colors.white,
                  padding: const EdgeInsets.all(0),
                  shape: StadiumBorder(),
                  minimumSize: const Size(180, 45),  // Ajustez la taille minimale selon vos besoins
                ),
                child: Text(
                  'Valider',
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
