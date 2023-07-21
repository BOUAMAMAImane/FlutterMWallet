import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:testingg/models/userModel.dart';
import 'package:testingg/screens/Payment/FormulairePayment.dart';
import 'package:testingg/screens/Payment/QrCodeScannerPayment.dart';

import '../../cubit/app_cubit.dart';

import '../HomeScreen.dart';

import '../Routes/CustomPageRouteRight.dart';
import '../Routes/custom_page_route.dart';


class PaymentRoute extends StatelessWidget {
  const PaymentRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel? userModel = AppCubit.get(context).userModel;
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(.94),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(
                CustomPageRouteRight(child: HomeScreen()),
              );
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 45.0),
            child: const Text(
              'Payer un commerçant ',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Color(0xff4c91bc),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              // user cards
              SizedBox(
                height: 120,
              ),

              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          CustomPageRouteLeft(child: QrCodeScannerPayment()),
                              (route) => false);
                    },
                    icons: CupertinoIcons.person ,
                    iconStyle: IconStyle(
                      backgroundColor: Color(0xff4c91bc),
                    ),
                    title: 'Payer un commerçant ',

                  ),
                  SettingsItem(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          CustomPageRouteLeft(child: FormulairePayment()),
                              (route) => false);
                    },
                    icons: Icons.admin_panel_settings,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Color(0xff4c91bc),
                    ),
                    title: 'mode commerçant ',
                  ),
                ],
              ),

              // You can add a settings title
            ],
          ),
        ),
      ),
    );
  }
}
