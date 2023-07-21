import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testingg/screens/Routes/CustomPageRouteRight.dart';
import 'package:testingg/screens/SettingsScreen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ResetPasswordScreenState();
  }
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  var oldPassword = TextEditingController();
  var newPassword = TextEditingController();
  var confirmPassword = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              CustomPageRouteRight(child: const SettingsScreen()),
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
                        'Ancien mot de passe',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueGrey,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: oldPassword,
                        cursorColor: Colors.green,
                        cursorHeight: 19,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "le mot de passe ne doit pas être vide";
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
                      const SizedBox(
                        height: 5,
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
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "le mot de passe ne doit pas être vide";
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
                      const SizedBox(
                        height: 5,
                      ),
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
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "le mot de passe ne doit pas être vide";
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
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
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
    );
  }
}
