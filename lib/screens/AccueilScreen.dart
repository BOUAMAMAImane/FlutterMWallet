import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:testingg/cubit/app_cubit.dart';
import 'package:testingg/cubit/app_states.dart';
import 'package:testingg/models/userModel.dart';
import 'package:testingg/network/local/cache_helper.dart';
import 'package:testingg/screens/Payment/PaymentRoute.dart';

import 'package:testingg/screens/Routes/custom_page_route.dart';
import 'package:testingg/screens/SettingsScreen.dart';
import 'package:testingg/screens/Transfer/TransferMoney.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

import '../generated/l10n.dart';
import '../shared/component.dart';
import 'AlimentationScreen.dart';



class AccueilScreen extends StatelessWidget {
  static String id = "Accueil";
  final _controller = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _controller.stream;

  AccueilScreen({Key? key}) : super(key: key);

  Future<void> _refresh(context) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    // when all needed is done change state
    AppCubit.get(context).loadLoggedInUserNative(AppCubit.get(context).userModel?.data.phoneNumber);
    _controller.sink.add(SwipeRefreshState.hidden);
  }

  @override
  Widget build(BuildContext context) {
    UserModel? userModel = AppCubit.get(context).userModel;
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppVersementSuccessStates) {

            AppCubit.get(context).loadLoggedInUserNative(CacheHelper.getData(key: 'phone'));
          }
        },
        builder: (context, state) => Conditional.single(
            context: context,
            conditionBuilder: (context) =>
                AppCubit.get(context).userModel! != null,
            fallbackBuilder: (context) => Container(
                  color: Colors.white,
                  child: const Center(
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.green, color: Colors.red),
                  ),
                ),
            widgetBuilder: (context) =>
                widgetBuilder(context: context, userModel: userModel)));
  }

  Column serviceWidget(String img, String name, context, widget) {
    return Column(
      children: [
        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              Navigator.of(context).push(CustomPageRouteLeft(child: widget));
            },
            child: Container(
              margin: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xfff1f3f6),
              ),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(23),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/$img.png'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: const TextStyle(
            fontFamily: 'avenir',
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget avatarWidget(String img, String name) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 130,
      width: 120,
      decoration: const BoxDecoration(
          borderRadius:  BorderRadius.all(Radius.circular(15)),
          color: Color(0xfff1f3f6)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image:const  DecorationImage(
                    image: AssetImage('images/user.png'), fit: BoxFit.cover),
                border: Border.all(color: Colors.black, width: 2)),
          ),
          Text(
            name,
            style: const TextStyle(
                fontSize: 16,
                fontFamily: 'avenir',
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }

  Widget widgetBuilder(
          {required UserModel? userModel, required BuildContext context}) =>
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: SwipeRefresh.material(
            indicatorColor: Colors.blue,
            stateStream: _stream,
            onRefresh: () {
              _refresh(context);
            },
            shrinkWrap: true,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  /*    gradient: LinearGradient(
                colors: [
                  Colors.green,
                  Color(0xff1546A0),
                ],
              ),
*/
                  color: Color(0xff4c91bc),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${userModel?.data.firstName.toUpperCase()}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              " ${userModel?.data.lastName.toUpperCase()}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Text(
                          "${userModel?.data.solde} DH ",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${userModel?.data.phoneNumber}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(30),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          navigateTo(context, const AlimentationScreen());
                        },
                        child: Ink(
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                  S.of(context).transfer_to,
                    style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'avenir'),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/scaner.png'))),
                  )
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      margin: const EdgeInsets.only(right: 20),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff4c91bc),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    avatarWidget("avatar1", "user1"),
                    avatarWidget("avatar2", "user2"),
                    avatarWidget("avatar3", "user3"),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Services',
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'avenir'),
                  ),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Icon(Icons.dialpad),
                  )
                ],
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                children: [
                  serviceWidget("transfert-de-donnees1",S.of(context).Money_transfer,
                      context, const TransferRoute()),
                  serviceWidget("top-up", S.of(context).Top_up_your_wallet, context,
                      const  AlimentationScreen()),
                  serviceWidget(
                      "store",S.of(context).Pay_your_merchand, context,const PaymentRoute()),
                  serviceWidget(
                      "phone",S.of(context).Phone_charging, context,const  SettingsScreen()),
                  serviceWidget("invoice", S.of(context).Invoice_payment, context,
                      const    SettingsScreen()),
                  serviceWidget(
                      "flight",S.of(context).Ticket_plan, context, const SettingsScreen()),
                  serviceWidget("more", S.of(context).more, context, const SettingsScreen()),
                ],
              )
            ],
          ),
        ),
      );
}
