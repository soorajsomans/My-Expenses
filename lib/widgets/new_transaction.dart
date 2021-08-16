import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTxHandler;

  NewTransaction(this.addTxHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTxHandler(
        titleController.text, double.parse(amountController.text));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      focusColor: Theme.of(context).primaryColor,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor))),
                  cursorColor: Theme.of(context).primaryColor,
                  controller: titleController,
                  onSubmitted: (_) => submitData()
                  // onChanged: (value) {
                  //   titleInput = value;
                  // },
                  ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Amount',
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                    focusColor: Theme.of(context).primaryColor,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor))),
                cursorColor: Theme.of(context).primaryColor,
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
                // onChanged: (value) {
                //   amountInput = value;
                // },
              ),
            ),
            TextButton(
              onPressed: submitData,
              child: Text(
                'Add',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
