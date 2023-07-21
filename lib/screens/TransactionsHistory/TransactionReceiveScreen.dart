import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testingg/cubit/app_cubit.dart';
import 'package:testingg/cubit/app_states.dart';

import 'package:testingg/shared/component.dart';

class TransactionReceiveScreen extends StatelessWidget {
  const TransactionReceiveScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => historyWidget(
                  AppCubit.get(context).transactionsDestinataire[index],
                  context,"Reçu"),
              itemCount: AppCubit.get(context).transactionsDestinataire.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
            ),
          );
        });
  }
}
