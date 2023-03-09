import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(
      {required this.label,
      required this.spendingAmount,
      required this.spendingPctOfTotal});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrant) {
      return Column(
        children: [
          Container(height: constrant.maxHeight * 0.15, child: FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
          SizedBox(
            height: constrant.maxHeight * 0.05,
          ),
          Container(
            height: constrant.maxHeight * 0.6,
            width: 10,
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 200, 220, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ]),
          ),
          SizedBox(
            height:constrant.maxHeight * 0.05,
          ),
          Container( height:constrant.maxHeight * 0.15,child: Text(label))
        ],
      );
    });
  }
}
