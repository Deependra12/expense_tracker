import 'package:flutter/material.dart';

class NewTranscation extends StatefulWidget {
  final Function addTx;
  NewTranscation(this.addTx);

  @override
  State<NewTranscation> createState() => _NewTranscationState();
}

class _NewTranscationState extends State<NewTranscation> {
  final titlecontrolller = TextEditingController();

  final amountcontroller = TextEditingController();

  void submitted() {
    final titleEntered = titlecontrolller.text;
    final amountEnterd = double.parse(amountcontroller.text);
    if (titleEntered.isEmpty || amountEnterd < 0) {
      return;
    }
    widget.addTx(titleEntered, amountEnterd);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'title'),
              controller: titlecontrolller,
              onSubmitted: (_) => submitted,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'amount'),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitted,
            ),
            FlatButton(
              onPressed: submitted,
              child: const Text("Add Transcation"),
              color: Colors.cyanAccent,
            )
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
