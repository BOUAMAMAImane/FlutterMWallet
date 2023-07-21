import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testingg/cubit/app_cubit.dart';
import 'package:testingg/cubit/app_states.dart';
import 'package:testingg/shared/Colors.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: blueGreyColor,
          appBar: AppBar(
            elevation: 0,
            title: const Text('Transaction Details'),
            backgroundColor: blueGreyColor,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 100,
                          color: blueGreyColor,
                        ),
                        Container(

                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:const BorderRadius.only(topRight: Radius.circular(45),topLeft: Radius.circular(45)),
                          ),
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 40),
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Fonds received from 0626708078",
                                      style: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25,
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("To",
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 20),),
                                ),

                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                color: Colors.white,
                                child: Row(
                                  children:const [
                                    Text("Wallet balance",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20),),
                                    Spacer(),
                                    Text("+300 MAD")
                                  ],
                                ),

                              ),

                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                        bottom: 5,
                                      ),
                                      child: Text(
                                        "Transaction type",
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 20),
                                      ),
                                      color: Colors.white,
                                    ),
                                    const Text(
                                      "Money received",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 35,
                                      child: Container(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        "Details",
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 20),
                                      ),
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          "Purpose",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                        Spacer(),
                                        Flexible(
                                          child: Text(
                                            "transfer credit reda 300DH",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            const        SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          "Date",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                        Spacer(),
                                        Text(
                                          "22-07-2022 \n 14:01:45",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                             const       SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          "Transaction id",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                        Spacer(),
                                        Text(
                                          "rmToY3pHKo",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  const  SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          "Amount",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                        Spacer(),
                                        Text(
                                          "300 MAD",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                              const      SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          "Total",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Text(
                                          "300 MAD",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                 const   SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      top: 60,
                      left: 10,
                      child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(180),
                              border:
                                  Border.all(color: Colors.white, width: 3)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Iconify(
                              Bx.transfer_alt,
                              size: 20,
                              color: Colors.blue.shade900,
                            ),
                          ) // widget

                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
