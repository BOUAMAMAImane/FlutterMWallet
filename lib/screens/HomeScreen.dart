import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:testingg/cubit/app_cubit.dart';
import 'package:testingg/cubit/app_states.dart';
import 'package:testingg/generated/l10n.dart';
import 'package:testingg/screens/LoginScreen.dart';
import 'package:testingg/shared/component.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../shared/SideMenu.dart';

class HomeScreen extends StatelessWidget {
  static String id = "HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(listener: ((context, state) {
      if (state is LoadLoggedInUserErrorStates) {
        navigateAndFinish(context,const LoginScreen());
        showToast(message: "error");
      }
    }), builder: ((context, state) {
      return Conditional.single(
          context: context,
          conditionBuilder: (context) =>
              AppCubit.get(context).userModel != null,
          widgetBuilder: (context) =>
              builderWidget(context, AppCubit.get(context).currentIndex),
          fallbackBuilder: (context) => Container(
                color: Colors.white,
                child: const Center(
                  child: CircularProgressIndicator(
                      backgroundColor: Colors.green, color: Colors.red),
                ),
              ));
    }));
  }
  Widget builderWidget(context, index) {
    return Scaffold(
      drawer:const  SideMenu(),
      appBar: AppBar(
          title: index == 0
              ? Padding(
                  padding: const EdgeInsets.only(left: 78.0),
                  child: Text(
                    S.of(context).acceuil,
                  ),
                )
              : index == 1
                  ? Padding(
                      padding: const EdgeInsets.only(left: 78.0),
                      child: Text(
                        S.of(context).payment,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 78.0),
                      child: Text(
                        S.of(context).my_account,
                      ),
                    ),
          backgroundColor:const  Color(0xff4c91bc)),
      backgroundColor: Colors.white,
      body: AppCubit.get(context)
          .bottomScreens[AppCubit.get(context).currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SalomonBottomBar(
          currentIndex: AppCubit.get(context).currentIndex,
          onTap: (index) {
            AppCubit.get(context).changeBottom(index);
          },
          items: [
            SalomonBottomBarItem(
              icon:const Icon(Icons.home),
              title:const Text("Accueil"),
              selectedColor: const Color(0xff4c91bc),
            ),

            /// transfert
            SalomonBottomBarItem(
              icon:const Icon(Icons.currency_exchange_sharp),
              title:const Text("Transfert"),
              selectedColor:const Color(0xff4c91bc),
            ),

            /// Profile
            SalomonBottomBarItem(
              icon:const Icon( Icons.account_balance_wallet_rounded,),
              title:const Text("Mon compte"),
              selectedColor: const Color(0xff4c91bc),
            ),
          ],
        ),
      ),
    );
  }
}
