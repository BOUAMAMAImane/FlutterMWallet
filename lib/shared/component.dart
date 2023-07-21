import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:testingg/cubit/app_cubit.dart';
import 'package:testingg/models/TransactionModel.dart';

import '../screens/Transfer/TransactionDetails.dart';

void showToast({required message}) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 5,
    fontSize: 16.0);

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );

Future<String?> getToken() async {
  String? token = await FirebaseMessaging.instance.getToken();
  return token;
}

Future<void> showMyDialog({
  required BuildContext context,
  required String emetteur,
  required String messageController,
  required String montantController,
  required String destinataireController,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Container(
        child: AlertDialog(
          title: Center(
              child: Text('DETAILS ',
                  style: TextStyle(
                      background: Paint()..color = Colors.green,
                      color: Colors.white))),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: const [
                    Icon(Icons.monetization_on_rounded),
                    Text('MONTANT :',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Text(montantController + "MAD"),
                const SizedBox(
                  height: 7,
                ),
                const Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 2,
                  indent: 2,
                  endIndent: 2,
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: const [
                    Icon(Icons.person_remove_sharp),
                    Text('LIBELLE :',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('')
                  ],
                ),
                Text(' VIREMENT MOBILE EMIS A\n ${destinataireController}\n '),
                const Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 2,
                  indent: 2,
                  endIndent: 2,
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Icon(Icons.date_range),
                    Text('DATE :',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('')
                  ],
                ),
                Text(DateFormat("yyyy-MM-dd \n").format(DateTime.now())),
                const Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 2,
                  indent: 2,
                  endIndent: 2,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Confirm',
                style: TextStyle(color: Colors.green),
              ),
              onPressed: () {
                print('Confirmed');
                AppCubit.get(context).Makevirement(montant: montantController,
                  destinataire:   destinataireController, message: messageController,emetteur:  emetteur);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}

void showNoMailAppsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Open Mail App"),
        content: Text("No mail apps installed"),
        actions: <Widget>[
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}

Future<void> showMyDialogLogout({
  required BuildContext context,
  required String emetteur,
  required String messageController,
  required String montantController,
  required String destinataireController,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Container(
        child: AlertDialog(
          title: Center(
            child: Text("Are you sure \n you want to logout?"),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: const [
                    Icon(Icons.monetization_on_rounded),
                    Text('MONTANT :',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Text(montantController + "MAD"),
                const SizedBox(
                  height: 7,
                ),
                const Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 2,
                  indent: 2,
                  endIndent: 2,
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: const [
                    Icon(Icons.person_remove_sharp),
                    Text('LIBELLE :',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('')
                  ],
                ),
                Text(' VIREMENT MOBILE EMIS A\n ${destinataireController}\n '),
                const Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 2,
                  indent: 2,
                  endIndent: 2,
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Icon(Icons.date_range),
                    Text('DATE :',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('')
                  ],
                ),
                Text(DateFormat("yyyy-MM-dd \n").format(DateTime.now())),
                const Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 2,
                  indent: 2,
                  endIndent: 2,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Confirm',
                style: TextStyle(color: Colors.green),
              ),
              onPressed: () {
                print('Confirmed');
                AppCubit.get(context).Makevirement(montant: montantController,
               destinataire:      destinataireController,message:  messageController,emetteur:  emetteur);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}




Widget historyWidget(TransactionModel transaction,context,String type) {
  return Container(
//      height: 100.0,
    margin: EdgeInsets.only(bottom: 7, left: 16.0, right: 16.0),
    child: Card(

      child: TextButton(


        onPressed: (){
          navigateTo(context,TransactionDetails());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  //     child: Image.asset("images/ico_receive_money.png",width: 40,height: 40,),
                  child: Icon(Icons.arrow_circle_down_sharp,size: 30,color: Colors.green,)
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      transaction.emetteur.contains("bank") ?    Text(
                        "Dépôt de",
                        style: TextStyle(
                            color: Colors.black
                            ,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ) :    Text(
                        "Reçu de",
                        style: TextStyle(
                            color: Colors.black
                            ,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      Text(transaction.emetteur,style: TextStyle( color: Colors.black),)
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
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "${transaction.dateTransaction}",
                              textAlign: TextAlign.right,
                              style: TextStyle( color: Colors.black),
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
