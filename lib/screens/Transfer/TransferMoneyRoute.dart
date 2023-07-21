import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:testingg/screens/Transfer/FormulaireUserTransfer.dart';

import 'FormulaireTransfert.dart';
import '../HomeScreen.dart';
import '../Routes/CustomPageRouteRight.dart';
import '../Routes/custom_page_route.dart';

class TransferMoneyRoute extends StatelessWidget {
  const TransferMoneyRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(.94),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(
                CustomPageRouteRight(child: const HomeScreen()),
              );
            },
          ),
          title:const  Padding(
            padding:  EdgeInsets.only(left: 48.0),
            child:  Text(
              'Transfert d\'argent',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor:const Color(0xff4c91bc),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              // user cards
              const     SizedBox(
                height: 120,
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            CustomPageRouteLeft(child: const FormulaireUserTransfer()),
                                (route) => false);
                      },
                      icons: CupertinoIcons.up_arrow,
                      iconStyle: IconStyle(
                        backgroundColor: const Color(0xff4c91bc),
                      ),
                      title: 'Mode User',

                  ),
                  SettingsItem(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            CustomPageRouteLeft(child:const  FormulaireTransfert()),
                                (route) => false);
                      },
                      icons: CupertinoIcons.up_arrow,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: const Color(0xff4c91bc),
                      ),
                      title:'Mode Developper',
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
