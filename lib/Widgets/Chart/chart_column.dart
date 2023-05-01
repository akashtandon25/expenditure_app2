import 'package:flutter/material.dart';
import '../../Models/transaction.dart';
import 'package:intl/intl.dart';

class ChartColumn extends StatelessWidget {
  final List groupedTransactionValues;
  final int index;
  final double totalTransaction;
  ChartColumn(this.groupedTransactionValues, this.index, this.totalTransaction);

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionValues);
    return Container(
      width: 50,
      height: 170,
      child: Column(
        children: <Widget>[
          Container(
            height: 15,
            child: FittedBox(
              child: Text(
                "₹ " +
                    (groupedTransactionValues[index]["amount"])
                        .toStringAsFixed(0),
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            width: 30,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: Color.fromRGBO(220, 220, 220, 1),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: totalTransaction == 0
                      ? 0
                      : groupedTransactionValues[index]["amount"] /
                          totalTransaction,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            groupedTransactionValues[index]["day"],
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
