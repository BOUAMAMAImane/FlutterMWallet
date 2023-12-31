import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testingg/models/userModel.dart';
import 'package:testingg/cubit/app_cubit.dart';


class PageMotSecret extends StatefulWidget {
  // final String oldPassword;
  // final String newPassword;
  // PageMotSecret({
  //   required this.oldPassword,
  //   required this.newPassword,
  // AppCubit.get(context).makenewPassword(
  // email: AppCubit
  //     .get(context)
  //     .email!,
  // });
  @override
  _PageMotSecretState createState() => _PageMotSecretState();
}

class _PageMotSecretState extends State<PageMotSecret> {
  final TextEditingController _secretTextController = TextEditingController();
  String _logMessage = '';

  @override
  void dispose() {
    _secretTextController.dispose();
    super.dispose();
  }


  void _validerMotSecret() async {
    String enteredSecret = _secretTextController.text;
    print("Mot secret entré : $enteredSecret");
    setState(() {
      _logMessage = "Mot secret entré : $enteredSecret";
    });
    final appCubit = BlocProvider.of<AppCubit>(context);
    UserModel? userModel = appCubit.userModel;
    String userEmail = userModel?.data.email ?? '';

    AppCubit cubit = AppCubit.get(context);
    appCubit.changePassword(

      password: cubit.password!,
      newPassword: cubit.newPassword!,
      email: userEmail,
      secret: enteredSecret,
      context: context,
    );
    // String enteredSecret = _secretTextController.text;
    // setState(() {
    //   _logMessage = "Mot secret entré : $enteredSecret";
    // });
    //
    // AppCubit.get(context).makenewPassword(
    //   email: AppCubit
    //       .get(context)
    //       .email,
    //   question3: AppCubit
    //       .get(context)
    //       .question3,
    //   question2: AppCubit
    //       .get(context)
    //       .question2!,
    //   question1: AppCubit
    //       .get(context)
    //       .question1!,
    //   password: AppCubit
    //       .get(context)
    //       .password!,
    //   secret: enteredSecret,
    //   context: context,
    // );

  }


  // void _validerMotSecret() async {
  //   String enteredSecret = _secretTextController.text;
  //   setState(() {
  //     _logMessage = "Mot secret entré : $enteredSecret";
  //   });
  //
  //   AppCubit cubit = AppCubit.get(context);
  //
  //   String userEmail = cubit.email ?? '';
  //   String question1 = cubit.question1 ?? '';
  //   String question2 = cubit.question2 ?? '';
  //   String question3 = cubit.question3 ?? '';
  //   String password = cubit.password ?? '';
  //
  //   cubit.makenewPassword(
  //     email: userEmail,
  //     question3: question3,
  //     question2: question2,
  //     question1: question1,
  //     password: password,
  //     secret: enteredSecret,
  //     context: context,
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Mot Secret'),
        backgroundColor: const Color(0xff4c91bc),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Veuillez entrer le mot secret',
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
                onPressed: _validerMotSecret,
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  padding: const EdgeInsets.all(0),
                  shape: StadiumBorder(),
                  minimumSize: const Size(225, 55),
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
