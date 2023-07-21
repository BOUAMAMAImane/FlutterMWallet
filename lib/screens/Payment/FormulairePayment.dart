import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:testingg/cubit/app_cubit.dart';
import 'package:testingg/screens/Payment/PaiementQrCodeResult.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:testingg/screens/Payment/PaymentRoute.dart';

import '../../cubit/app_states.dart';
import '../../shared/PopUp.dart';
import '../Routes/CustomPageRouteRight.dart';

class FormulairePayment extends StatefulWidget {
  FormulairePayment({Key? key}) : super(key: key);

  @override
  State<FormulairePayment> createState() => _FormulairePaymentState();
}

enum PointOfInitiationMethod { dynamic, static }

class _FormulairePaymentState extends State<FormulairePayment> {
  var pointOfInitiationMethod = TextEditingController();
  var phoneNumber = TextEditingController();
  var transactionAmount = TextEditingController();
  var purposeOfTransaction = TextEditingController();
  var financialInstitutionCode = TextEditingController();
  var operationType = TextEditingController();
  var merchantCategory = TextEditingController();
  var merchantName = TextEditingController();
  var merchantCity = TextEditingController();

  List<DropdownMenuItem<String>> get operationTypePayment {
    List<DropdownMenuItem<String>> operationType = [
      DropdownMenuItem(child: Text("Transfer P2P"), value: "0"),
      DropdownMenuItem(
          child: Text("Paiement commercant a face 2 face"), value: "1"),
      DropdownMenuItem(
          child: Text("Paiement commercant a distance"), value: "2"),
      DropdownMenuItem(child: Text("Paiement FMCG"), value: "3"),
    ];
    return operationType;
  }

  String selectedOperationTypePayment = "0";

  List<DropdownMenuItem<String>> get transactionCurrencyItems {
    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(child: Text("MAD"), value: "504"),
      DropdownMenuItem(child: Text("EURO"), value: "978"),
      DropdownMenuItem(child: Text("USD"), value: "840"),
    ];
    return items;
  }

  String selectedTransactionCurrency = "504";

  List<DropdownMenuItem<String>> get countrycodeItems {
    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(child: Text("MAROC"), value: "MA"),
      DropdownMenuItem(child: Text("USA"), value: "US"),
      DropdownMenuItem(child: Text("Royaume-Uni"), value: "GB"),
    ];
    return items;
  }

  String selectedCountryCode = "MA";

  PointOfInitiationMethod? selectedPointOfInitiationMethod =
      PointOfInitiationMethod.dynamic;

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppGeneratedQrCodeSuccessStates) {
          navigateTo(context, PaimentQrCodeResult());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context)
                    .push(CustomPageRouteRight(child: PaymentRoute()));
              },
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: const Text(
                'mode commerçant',
                style: TextStyle(color: Colors.white),
              ),
            ),
            backgroundColor: Color(0xff4c91bc),
            elevation: 0,
          ),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Container(
                    width: 350,
                    constraints: const BoxConstraints(maxWidth: 600),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          'Point of Initiation method',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey,
                          ),
                        ),
                        SizedBox(height: 8),
                        RadioListTile<PointOfInitiationMethod>(
                          title: const Text('dynamic'),
                          value: PointOfInitiationMethod.dynamic,
                          groupValue: selectedPointOfInitiationMethod,
                          onChanged: (PointOfInitiationMethod? value) {
                            setState(() {
                              selectedPointOfInitiationMethod = value;
                            });
                          },
                        ),
                        RadioListTile<PointOfInitiationMethod>(
                          title: const Text('static'),
                          value: PointOfInitiationMethod.static,
                          groupValue: selectedPointOfInitiationMethod,
                          onChanged: (PointOfInitiationMethod? value) {
                            setState(() {
                              selectedPointOfInitiationMethod = value;
                            });
                          },
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Transaction Amount',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blueGrey,
                              ),
                            ),
                            Text(
                              'Transaction Currency',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 150,
                              child: TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(4),
                                ],
                                controller: transactionAmount,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Transaction Amount must not be empty";
                                  }
                                },
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xff4c91bc), width: 2.0),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0)),
                                ),
                              ),
                            ),
                            Container(
                              width: 150,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                ),
                                value: selectedTransactionCurrency,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedTransactionCurrency = newValue!;
                                  });
                                },
                                items: transactionCurrencyItems,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Purpose Of Transaction',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey,
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: purposeOfTransaction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Purpose Of Transaction must not be empty";
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 6),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xff4c91bc), width: 2.0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Operation type',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 55,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                  color: Colors.grey),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                          margin: EdgeInsets.only(),
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(border: InputBorder.none),
                              items: operationTypePayment,
                              value: selectedOperationTypePayment,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedOperationTypePayment = value!;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              'merchant category\ncode',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueGrey,
                              ),
                            ),
                            SizedBox(width: 14),
                            Text(
                              'country code\n',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 150,
                              child: TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(4),
                                ],
                                keyboardType: TextInputType.phone,
                                controller: merchantCategory,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Merchant Category Code must not be empty";
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xff4c91bc), width: 2.0),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0)),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              width: 150,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                ),
                                value: selectedCountryCode,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCountryCode = newValue!;
                                  });
                                },
                                items: countrycodeItems,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          'merchant name',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey,
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: merchantName,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Merchant name must not be empty";
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 6),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xff4c91bc), width: 2.0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'merchant city',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey,
                          ),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: merchantCity,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Merchant city must not be empty";
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 6),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xff4c91bc), width: 2.0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 210.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                AppCubit.get(context).PaimnentCommercant(
                                  '${selectedPointOfInitiationMethod?.toString().split('.').last}',
                                  AppCubit.get(context)
                                      .userModel!
                                      .data
                                      .phoneNumber,
                                  selectedTransactionCurrency,
                                  transactionAmount.text,
                                  purposeOfTransaction.text,
                                  selectedOperationTypePayment,
                                  merchantCategory.text,
                                  selectedCountryCode,
                                  merchantName.text,
                                  merchantCity.text,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff4c91bc),
                              shape: StadiumBorder(),
                            ),
                            child: Container(
                              width: 155,
                              height: 55,
                              alignment: Alignment.center,
                              child: Text(
                                'VALIDER',
                                style: GoogleFonts.manrope(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
