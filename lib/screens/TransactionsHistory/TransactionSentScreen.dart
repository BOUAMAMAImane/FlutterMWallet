import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testingg/cubit/app_cubit.dart';
import 'package:testingg/cubit/app_states.dart';
import 'package:testingg/models/TransactionModel.dart';
import 'package:testingg/screens/Transfer/TransactionDetails.dart';
import 'package:testingg/shared/component.dart';

class TransactionSentScreen extends StatelessWidget {
  const TransactionSentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) => AppCubit.get(context)
        .showHistoryEmetteur(
            AppCubit.get(context).userModel?.data.phoneNumber));
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => historyWidgetsent(
                  AppCubit.get(context).transactionsEmetteur[index], context,"sent"),
              itemCount: AppCubit.get(context).transactionsEmetteur.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
            ),
          );
        });
  }
}


Widget historyWidgetsent(TransactionModel transaction,context,String type) {
  return Container(
//      height: 100.0,
    margin: const EdgeInsets.only(bottom: 7, left: 16.0, right: 16.0),
    child: Card(

      child: TextButton(


        onPressed: (){
          navigateTo(context,const TransactionDetails());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              const  Padding(
                  padding:  EdgeInsets.only(right: 16.0),
                  //     child: Image.asset("images/ico_receive_money.png",width: 40,height: 40,),
                  child: Icon(Icons.arrow_circle_up_sharp,size: 30,color: Colors.red,)
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      transaction.emetteur.contains("bank") ?    const Text(
                        "Dépôt de",
                        style:TextStyle(
                            color: Colors.black
                            ,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ) :    const Text(
                        "Envoyé à",
                        style:TextStyle(
                            color: Colors.black
                            ,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      Text(transaction.destinataire,style: const TextStyle( color: Colors.black),)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "${transaction.montant} MAD",
                        style:const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              transaction.dateTransaction,
                              textAlign: TextAlign.right,
                              style:const TextStyle( color: Colors.black),
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

