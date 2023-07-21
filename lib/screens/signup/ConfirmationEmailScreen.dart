import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testingg/cubit/app_cubit.dart';
import 'package:testingg/cubit/app_states.dart';
import 'package:testingg/shared/component.dart';
import 'package:open_mail_app/open_mail_app.dart';

import '../../shared/buttons.dart';

class ConfirmationScreen extends StatefulWidget {
  static String id = "SignupScreen";

  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final jobRoleCtrl = TextEditingController();

  final formkey = GlobalKey<FormState>();
  var swiftController = DropdownEditingController<String>();

  var phonenumberController = TextEditingController();

  var cinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Form(
              key: formkey,
              child: Center(
                child: Container(
                  width: 420,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 135,
                        ),
                        Container(
                          height: 90,
                          width: 90,
                          decoration:const BoxDecoration(
                              image:DecorationImage(
                            image: AssetImage('images/emailsend.png'),
                          )),
                        ),
                        const    SizedBox(
                          height: 35,
                        ),
                        Text(
                          'Confirmez votre adresse email',
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
                          'Nous avons envoyé un e-mail de confirmation à  ',
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
                        const   SizedBox(
                          height: 13,
                        ),
                        Text(
                          'vérifiez votre e-mail et cliquez sur le \n lien de confirmation pour continuer',
                          style: GoogleFonts.manrope(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              color: Colors.blueGrey),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ButtonTest(
                          text: "Ouvrir la boîte mail",
                          function: () async {
                            var result = await OpenMailApp.openMailApp(
                              nativePickerTitle: 'Sélectionnez l\'application de messagerie à ouvrir',
                            );

                            // If no mail apps found, show error
                            if (!result.didOpen && !result.canOpen) {
                              showNoMailAppsDialog(context);

                              // iOS: if multiple mail apps found, show dialog to select.
                              // There is no native intent/default app system in iOS so
                              // you have to do it yourself.
                            } else if (!result.didOpen && result.canOpen) {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return MailAppPickerDialog(
                                    mailApps: result.options,
                                  );
                                },
                              );
                            }
                          },
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
