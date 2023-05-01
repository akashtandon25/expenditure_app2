import 'dart:js';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'transaction_widget.dart';
import '../../Models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "No transactions added yet!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                  height: 300,
                ),
              ],
            ),
          )
        : Container(
            width: double.infinity,
            height: 400,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return TransactionWidget(
                  id: transactions[index].id,
                  itemName: transactions[index].itemName,
                  cost: transactions[index].amount,
                  date: transactions[index].date,
                );
              },
              itemCount: transactions.length,
            ));
  }
}
