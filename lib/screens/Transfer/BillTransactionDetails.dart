import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:testingg/cubit/app_cubit.dart';
import 'package:testingg/cubit/app_states.dart';
import 'package:testingg/models/TransactionInfos.dart';

import 'package:testingg/screens/AccountScreen.dart';

import 'package:testingg/shared/Colors.dart';
import 'package:testingg/shared/component.dart';
import '../HomeScreen.dart';
import '../Routes/custom_page_route.dart';


class BillTransactionDetails extends StatelessWidget {
  TransactionInfos? transactionInfos;
  BillTransactionDetails(this.transactionInfos, {Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var dateTime = DateTime.parse(DateTime.now().toString());

    var formate1 = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
    return BlocConsumer<AppCubit,AppStates>( listener: (context,state){
      if (state is AppVersementSuccessStates) {
        Navigator.pushAndRemoveUntil(
            context,
            CustomPageRouteLeft(child: const HomeScreen()),
                (route) => false);
      }
    },builder: (context,state){
      return Scaffold(
        appBar: AppBar(

          backgroundColor:const Color(0xff4c91bc),
          elevation: 2,

          title: const Center(
            child: Text(
              'Reçu du Transfert',
            ),
          ),
        ),
        body: Column(
          children: [
            const  SizedBox(height: 20,),
            Container(
              color:const Color(0xff4c91bc),
              child: Padding(
                padding:const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white)),
                  child:const     Icon(Icons.receipt_long_outlined,color: Colors.white60,size: 120,),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  rowBuilder(
                      att: "Date ",
                      text: formate1),
                  const SizedBox(
                    height: 20,
                  ),
                  rowBuilder(
                      att: "Compte",
                      text: "${transactionInfos?.merchandPhoneNumber}"),
                  const SizedBox(
                    height: 20,
                  ),
                  rowBuilder(
                      att: "Type",
                      text: "${transactionInfos?.transactionType}"),

                  const  SizedBox(
                    height: 20,
                  ),
                  rowBuilder(
                      att: "Montant",
                      text: "${transactionInfos?.transactionAmount} ${transactionInfos?.transactionCurrency} "),

                  const  SizedBox(
                    height: 20,
                  ),
                  rowBuilder(att: "Type du Transfert", text:"${transactionInfos?.paiementType}"),
                  const  SizedBox(
                    height: 40,
                  ),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.5,
                        child: Material(
                          borderRadius: BorderRadius.circular(30),
                          color: blueGreyColor,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(30),
                            onTap: () {
                              String? destinataire = AppCubit.get(context).userModel?.data.phoneNumber;
                              String? emetteur = transactionInfos?.merchandPhoneNumber;

                              AppCubit.get(context).Makevirement(montant: transactionInfos?.transactionAmount,destinataire:  destinataire!, message: "hi",emetteur: emetteur!);

                            },
                            child: Ink(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(40)),
                                child: const Text(
                                  "Accepter",
                                  style: TextStyle(color: Colors.white,fontSize: 15),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.5,
                        child: Material(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.redAccent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(30),
                            onTap: () {
                              AppCubit.get(context).currentIndex = 0;
                             navigateAndFinish(context,const HomeScreen());
                             showToast(message: "Transaction  annulée");

                            },
                            child: Ink(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(40)),
                                child: const Text(
                                  "Annuler",
                                  style: TextStyle(color: Colors.white,fontSize: 15),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
