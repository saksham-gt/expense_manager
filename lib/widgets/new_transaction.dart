import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx) {
    print('Constructor newTransaction Widget!!');
  }

  @override
  _NewTransactionState createState() {
    print('createState NewTransaction State!!');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  _NewTransactionState() {
    print('Constructor NewTransaction State!!');
  }
  @override
  void initState() {
    print('initState()');
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    print('didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose()');
    super.dispose();
  }

  void _submitData() {
    if (_amountController.text.isEmpty == null) return;
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredAmount <= 0 || enteredTitle.isEmpty || _selectedDate == null)
      return;

    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDate() {
    showDatePicker(
            context: context,
            builder: (BuildContext context, Widget child) {
              return Theme(
                data: ThemeData.dark().copyWith(),
                child: child,
              );
            },
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5.0,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 6.0,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
                // onChanged: (val)=> titleInput = val,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                //_ is assigned by flutter that contains fields entered by user
                // tho it shows that i don't want to use that value as i didn't give any meaningful name to it
                // the need to use it is cuz onSubmitted needs an argument
                onSubmitted: (_) => _submitData(),
                // onChanged: (val)=> amountInput = val,
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(_selectedDate == null
                            ? 'No date chosen!!'
                            : ('Picked Date: ${DateFormat.yMMMMd().format(_selectedDate)}'))),
                    FlatButton(
                        textColor: Theme.of(context).accentColor,
                        onPressed: _presentDate,
                        child: Text(
                          'Choose Date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              FlatButton(
                onPressed:
                    _submitData, // here no need to use (_) as onPressed can take a void function
                child: Text(
                  'Add Transaction',
                ),
                textColor: Theme.of(context).textTheme.button.color,
                color: Theme.of(context).accentColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
