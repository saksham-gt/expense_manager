import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(2),
            //padding: EdgeInsets.all(10),
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
                child: Text(
              '\u{20B9}${spendingAmount.toStringAsFixed(0)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                spendingPctOfTotal == 0
                    ? Text('')
                    : FractionallySizedBox(
                        heightFactor: spendingPctOfTotal,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(child: Text(label))),
        ],
      );
    });
  }
}
