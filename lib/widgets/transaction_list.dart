import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: transactions.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/nodata.png'),
                Text(
                  'No data available !..',
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                    color: Theme.of(context).primaryColorLight,
                    elevation: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          // decoration: BoxDecoration(
                          //     border: Border.all(color: Colors.purple, width: 1),
                          //     color: Colors.purple[100]),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '\u{20B9} ${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transactions[index].title,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              DateFormat.yMMMMd()
                                  .format(transactions[index].date),
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontFamily: 'Quicksand',
                              ),
                            )
                          ],
                        )
                      ],
                    ));
              },
            ),
    );
  }
}
