import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionWidget extends StatelessWidget {
  final String id;
  final String itemName;
  final double cost;
  final DateTime date;

  TransactionWidget({this.id, this.itemName, this.cost, this.date});
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: Text(
              "₹" + cost.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            )),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Text(
            itemName,
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            DateFormat().format(date),
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ])
      ],
    ));
  }
}
