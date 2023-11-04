import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testingg/screens/LoginScreen.dart';
import 'package:testingg/screens/Routes/CustomPageRouteRight.dart';
import 'package:testingg/screens/signup/QuestionSecrete2.dart';
import 'package:testingg/cubit/app_cubit.dart';

const double verticalSpacing = 10.0; // Espace vertical souhaité
class PasswordforgottenScreen extends StatefulWidget {
  const PasswordforgottenScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PasswordforgottenScreenScreenState();
  }
}

class _PasswordforgottenScreenScreenState extends State<PasswordforgottenScreen> {
  var email = TextEditingController();
  var newPassword = TextEditingController();
  var confirmPassword = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              CustomPageRouteRight(child: const LoginScreen()),
            );
          },
        ),
        title: const Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(right: 68.0),
            child: Text(
              'Réinitialiser mot de passe',
            ),
          ),
        ),
        backgroundColor: const Color(0xff4c91bc),
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Container(
            height: 550,
            padding: const EdgeInsets.only(left: 5, right: 5),
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
                        'Créer un nouveau mot de passe',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Votre nouveau mot de passe doit être différent des mots de passe utilisés précédemment.',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Adresse e-mail',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueGrey,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      // TextFormField(
                      //   controller: email,
                      //   cursorColor: Colors.green,
                      //   cursorHeight: 19,
                      //   keyboardType: TextInputType.emailAddress,
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return "L'adresse e-mail ne doit pas être vide";
                      //     } else if (!value.contains('@')) {
                      //       return "L'adresse e-mail doit contenir le symbole @";
                      //     }
                      //     return null;
                      //   },
                      //   style: GoogleFonts.manrope(
                      //     height: 0.7,
                      //     fontWeight: FontWeight.w400,
                      //     fontSize: 14,
                      //   ),
                      //   decoration: InputDecoration(
                      //     prefixIcon: const Icon(
                      //       Icons.email,
                      //       color: Color(0xff4c91bc),
                      //     ),
                      //
                      //     fillColor: const Color(0xff243656),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(20),
                      //       borderSide: const BorderSide(
                      //         color: Colors.green,
                      //         width: 2.0,
                      //       ),
                      //     ),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(20),
                      //       borderSide: const BorderSide(
                      //         color: Colors.green,
                      //         width: 2.0,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      TextFormField(
                        controller: email,
                        cursorColor: Colors.green,
                        cursorHeight: 19,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "L'adresse e-mail ne doit pas être vide";
                          } else if (!value.contains('@')) {
                            return "L'adresse e-mail doit contenir le symbole @";
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
                            Icons.email,
                            color: Color(0xff4c91bc),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // Ajoutez cette ligne
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

                      const Divider(
                        thickness: 0.3,
                        color: Colors.grey,
                      ),
                      const Text(
                        'Nouveau mot de passe',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueGrey,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: newPassword,
                        cursorColor: Colors.green,
                        cursorHeight: 19,
                        keyboardType: TextInputType.visiblePassword,
                        // obscureText: true,c
                        obscureText: _isObscure,

                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Le mot de passe ne doit pas être vide";
                          }
                          if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d).+$').hasMatch(value)) {
                            return "Le mot de passe doit contenir une lettre et au moins un chiffre";
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
                            Icons.password,
                            color: Color(0xff4c91bc),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure ? Icons.visibility : Icons.visibility_off,
                              color: _isObscure ? Colors.green : Colors.grey,
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
                      SizedBox(height: verticalSpacing), // Ajouter de l'espace
                      const Divider(
                        thickness: 0.3,
                        color: Colors.grey,
                      ),
                      const Text(
                        'Confirmation',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueGrey,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: confirmPassword,
                        cursorColor: Colors.green,
                        cursorHeight: 19,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _isObscure,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "le mot de passe ne doit pas être vide";
                          }
                          else if (newPassword.text != confirmPassword.text){
                            return "Merci de taper le meme mot de passe";
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
                            Icons.password,
                            color: Color(0xff4c91bc),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure ? Icons.visibility : Icons.visibility_off,
                              color: _isObscure ? Colors.green : Colors.grey,
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
                      SizedBox(height: verticalSpacing),
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              AppCubit.get(context).email = email.text;
                              AppCubit.get(context).password = newPassword.text;
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => QuestionSecrete2Screen()),
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
    );
  }
}

void main() {
  runApp(MaterialApp(home: PasswordforgottenScreen()));
}
