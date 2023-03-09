import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tracker/models/transaction.dart';

class TransactionList extends StatelessWidget {
  late final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constrant) {
            return Column(
              children: [Text('No Transactio yet'), Icon(Icons.no_accounts,size: constrant.maxHeight*0.6,)],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child: Text('\$${transactions[index].amount}')),
                        ),
                      ),
                      title: Text(
                        transactions[index].title.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date!)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: (() => deleteTx(transactions[index].id)),
                      )));
            },
          );
  }
}
