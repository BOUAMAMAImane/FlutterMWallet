import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:testingg/cubit/app_cubit.dart';

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

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
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
                 destinataire:    destinataireController,message:  messageController,emetteur:  emetteur);
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
                destinataire:     destinataireController,message:  messageController,emetteur:  emetteur);
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
