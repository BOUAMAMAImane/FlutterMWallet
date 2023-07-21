
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testingg/cubit/app_states.dart';
import 'package:testingg/generated/l10n.dart';
import 'package:testingg/network/local/cache_helper.dart';
import 'package:testingg/screens/AccountScreen.dart';

import 'package:testingg/screens/LoginScreen.dart';

import 'package:testingg/screens/Routes/custom_page_route.dart';
import 'package:testingg/screens/SettingsScreen.dart';
import 'package:testingg/screens/TransactionsHistory.dart';
import '../cubit/app_cubit.dart';
import '../models/userModel.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel? userModel = AppCubit.get(context).userModel;

    return BlocConsumer<AppCubit,AppStates>( listener: (context, state) {},builder: (context,state){
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
                  UserAccountsDrawerHeader(
                    arrowColor: Colors.white60,
                    accountName: IntrinsicHeight(
                      child: SizedBox(
                        height: 50,
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 80,
                              width: 80,
                              child: FittedBox(fit: BoxFit.cover,
                                child: Icon(Icons.person_outline,color: Colors.white60),
                              ),
                            ),
                            const  SizedBox(width: 5,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).hello,
                                  style:const TextStyle(fontSize: 18,color: Colors.white60),
                                ),
                                Text(
                                  "${userModel?.data.lastName.toUpperCase()}!",
                                  style:const TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    accountEmail: const Text(""),


                    decoration:const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.grey,
                          Colors.blueGrey,
                        ],
                      ),
                    ),
                  ),
            const       SizedBox(
              height: 10,
            ),
            Padding(
              padding:const EdgeInsets.only(left: 30),
              child: ListTile(
                leading:const Icon(
                  Icons.home,
                  color: Color(0xff4c91bc),
                  size: 32,
                ),
                title: Text(
                  S.of(context).home,
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                onTap: () {},
              ),
            ),
            const   SizedBox(
              height: 10,
            ),

            Padding(
              padding:const EdgeInsets.only(left: 30),
              child: ListTile(
                leading:const Icon(
                  Icons.history,
                  color: Color(0xff4c91bc),
                  size: 32,
                ),
                title: Text(
                  S.of(context).my_history,
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                onTap: () =>     Navigator.of(context).push(
                  CustomPageRouteLeft(child: const TransactionsHistory()),
                ),
              ),
            ),
            const  SizedBox(
              height: 10,
            ),
            Padding(
              padding:const EdgeInsets.only(left: 37),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              const    Icon(Icons.developer_mode_rounded,color: Color(0xff4c91bc),size: 32,),
                  Text("Mode Développeur", style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),),

                  Switch(
                    activeColor: Colors.green,
                      inactiveThumbColor:const Color(0xff4c91bc),


                      value: AppCubit.get(context).isSwitched, onChanged: (value){
                    AppCubit.get(context).changeIsSwitched();

                  }),
                ],
              ),
            ),

         const   Padding(
              padding: EdgeInsets.only(left: 50),
              child: Divider(),
            ),

            Padding(
              padding:const EdgeInsets.only(left: 30),
              child: ListTile(
                leading:const Icon(
                  Icons.settings,
                  color: Color(0xff4c91bc),
                  size: 32,
                ),
                title: Text(
                  S.of(context).settings,
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    CustomPageRouteLeft(child:const SettingsScreen()),
                  );
                },
              ),
            ),
            const  Padding(
              padding: EdgeInsets.only(left: 50),
              child: Divider(),
            ),
            Padding(
              padding:const  EdgeInsets.only(left: 30),
              child: ListTile(
                title: Text(
                  S.of(context).logout,
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                leading:const Icon(
                  Icons.exit_to_app,
                  color: Colors.redAccent,
                  size: 32,
                ),
                onTap: (){
                  AppCubit.get(context).removeFcmToken(AppCubit.get(context).userModel?.data.email);
                  CacheHelper.removeData(key: 'token');
                  CacheHelper.removeData(key: 'email');

                  Navigator.pushAndRemoveUntil(
                      context, CustomPageRouteLeft(child: const LoginScreen()),(route)=>false
                  );

                  AppCubit.get(context).currentIndex=0;
                  AppCubit.get(context).userModel=null;

                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
