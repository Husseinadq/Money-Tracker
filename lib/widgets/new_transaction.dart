import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInput = TextEditingController();

  final amountInput = TextEditingController();
  DateTime ?_selectDate;

  void _submitDatd() {
    final enteredTitle = titleInput.text;
    final enteredAmount = double.parse(amountInput.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 ||_selectDate== null) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount,_selectDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
         _selectDate = value;
      });
     
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: MediaQuery.of(context).viewInsets.bottom+10),
          child: Column(children: [
            TextField(
              controller: titleInput,
              decoration: InputDecoration(label: Text('Title')),
              onSubmitted: (_) => _submitDatd,
            ),
            TextField(
              controller: amountInput,
              decoration: InputDecoration(label: Text('Amount')),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitDatd,
            ),
            Row(
              children: [
                Expanded(child: Text(_selectDate==null?'No Date Chosen!':'Chosen Date ${DateFormat.yMd().format(_selectDate!)}')),
                ElevatedButton(
                    onPressed: _presentDatePicker, child: Text('Choose Date'))
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _submitDatd();
                print(titleInput.text);
                print(amountInput.text);
              },
              child: Text(
                'Add ',
              ),
            )
          ]),
        ),
      ),
    );
  }
}
