import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testingg/cubit/app_cubit.dart';
import 'package:testingg/cubit/app_states.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import 'package:testingg/screens/Payment/PaymentRoute.dart';

import '../Routes/CustomPageRouteRight.dart';

class PaimentQrCodeResult extends StatelessWidget {
  PaimentQrCodeResult({Key? key}) : super(key: key);
  String data = "";
  @override
  Widget build(BuildContext context) {


    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
      if (state is AppGeneratedQrCodeSuccessStates) {
        data = state.url;
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context)
                  .push(CustomPageRouteRight(child: PaymentRoute()));
            },
          ),
          title: const Text(
            'Paiement d\'argent par Code QR',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xff4c91bc),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              const    SizedBox(
                height: 30,
              ),

              const   SizedBox(
                height: 50,
              ),
              PrettyQr(
                elementColor: Colors.black,
                size: 250,
                data: "${AppCubit.get(context).qrString}",
                errorCorrectLevel: QrErrorCorrectLevel.M,
              ),
              const      SizedBox(
                height: 200,
              ),
              const     Text("Ce Code QR respecte les spécificatoin MarocPay"),
            ],
          ),
        ),
      );
    });
  }
}
