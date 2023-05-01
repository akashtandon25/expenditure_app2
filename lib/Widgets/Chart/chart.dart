import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './chart_column.dart';

class Chart extends StatelessWidget {
  final List recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));

      var dayTransaction = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          dayTransaction += recentTransactions[i].amount;
        }
      }
      return {
        "day": DateFormat.E().format(weekday),
        "amount": dayTransaction,
      };
    }).reversed.toList();
  }

  double get totalTransaction {
    var total = 0.0;
    for (int i = 0; i < groupedTransactionValues.length; i++) {
      total += (groupedTransactionValues[i]["amount"]) as double;
    }
    return total;
  }

  List<Widget> get widgetList {
    return List.generate(7, (index) {
      return Flexible(
          fit: FlexFit.tight,
          child:
              ChartColumn(groupedTransactionValues, index, totalTransaction));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 220,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widgetList,
        ),
      ),
    );
  }
}
