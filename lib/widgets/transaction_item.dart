import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//import './transaction_list.dart';
import '../models/transaction.dart';

class transactionItem extends StatefulWidget {
  const transactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  _transactionItemState createState() => _transactionItemState();
}

class _transactionItemState extends State<transactionItem> {
  Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.blue,
      Colors.red,
      Colors.purple,
      Colors.pinkAccent
    ];

    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      elevation: 5.0,
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
                child: Text(
              '\u{20B9} ${widget.transaction.amount}',
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            )),
          ),
        ),
        title: Text('${widget.transaction.title}',
            style: Theme.of(context).textTheme.title),
        subtitle:
            Text('${DateFormat.yMMMMd().format(widget.transaction.date)}'),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                onPressed: () => widget.deleteTx(widget.transaction.id),
                icon: Icon(
                  Icons.delete,
                  //color: Theme.of(context).accentColor,
                ),
                label: const Text(
                  'Delete',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                textColor: Theme.of(context).primaryColor,
                //color: Colors.limeAccent,
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTx(widget.transaction.id)),
      ),
    );
  }
}


/*
Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      elevation: 5.0,
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepOrangeAccent,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child: FittedBox(
                child: Text(
              '\u{20B9} ${transaction.amount}',
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            )),
          ),
        ),
        title: Text('${transaction.title}',
            style: Theme.of(context).textTheme.title),
        subtitle: Text('${DateFormat.yMMMMd().format(transaction.date)}'),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                onPressed: () => deleteTx(transaction.id),
                icon: Icon(
                  Icons.delete,
                  //color: Theme.of(context).accentColor,
                ),
                label: Text(
                  'Delete',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                textColor: Theme.of(context).primaryColor,
                //color: Colors.limeAccent,
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transaction.id)),
      ),
    );
    */