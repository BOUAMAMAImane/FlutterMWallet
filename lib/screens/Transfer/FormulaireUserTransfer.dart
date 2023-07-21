import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testingg/cubit/app_cubit.dart';
import 'package:testingg/cubit/app_states.dart';

import 'package:testingg/screens/HomeScreen.dart';
import 'package:testingg/shared/component.dart';
import '../Routes/CustomPageRouteRight.dart';

import 'TransferQrCodeResult.dart';


class FormulaireUserTransfer extends StatelessWidget {
  const FormulaireUserTransfer({Key? key}) : super(key: key);
  static String id = "Versement";
  @override
  Widget build(BuildContext context) {
    var purposeoftransactionontroller = TextEditingController();
    var transactionAmount = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
      if (state is AppGeneratedQrCodeSuccessStates) {
        navigateTo(context, TransferQrCodeResult());
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(

          title: const Center(
            child:  Text(
              'Envoi de l\'argent',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor:const Color(0xff4c91bc),
          elevation: 0,
        ),


        backgroundColor: Colors.white,
        bottomSheet: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextFormField(
                    controller: purposeoftransactionontroller,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 10.0),

                      fillColor: Colors.white,
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(width: 3, color: Colors.white),
                        borderRadius: BorderRadius.circular(30),
                      ),

                      //add prefix icon

                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.w400,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(width: 3, color: Colors.white),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      //create lable
                      labelText: '  Motif',
                      //lable style
                      labelStyle:const  TextStyle(
                        fontSize: 16,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Material(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xff4c91bc),
                  child: AnimatedButton(

                    text: 'VALIDER',
                    color: const Color(0xff4c91bc),
                    pressEvent: () {
                       {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.WARNING,
                          headerAnimationLoop: false,
                          animType: AnimType.TOPSLIDE,
                          showCloseIcon: true,
                          title: 'INFOS',
                          desc:
                          'Vous venez d\'envoyer un montant d ${transactionAmount.text} DH ',
                          btnCancelOnPress: () {Navigator.of(context).push(
                            CustomPageRouteRight(child: const HomeScreen()),
                          ); },
                          btnOkOnPress: ()  {
                            {


                              AppCubit.get(context).transferp2p(
                                "static",
                                 AppCubit.get(context).userModel!.data.phoneNumber,
                                 "504",
                                 transactionAmount.text,
                                  purposeoftransactionontroller.text,
                                "0"
                                  );
                              /*
                              "transaction_type": "transfer p2p",
      "point_of_initiation_method": pointofinitiationmethode,
      "paid_entity_reference": paidEntityRef,
      "transaction_currency": trans_curr,
      "transaction_amount": tran_amount,
      "purpose_of_transaction": tran_purpose,
      "financial_institution_code": "999",
      "operation_type": oper_type
                               */
                            }
                            },
                        ).show();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: TextFormField(
                        controller: transactionAmount,
                        keyboardType: TextInputType.number,
                        style:const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "0,00 MAD",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
