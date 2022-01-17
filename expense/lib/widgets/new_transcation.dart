import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTranscation extends StatefulWidget {
  final Function addTx;

  NewTranscation(this.addTx);

  @override
  State<NewTranscation> createState() => _NewTranscationState();
}

class _NewTranscationState extends State<NewTranscation> {
  final titlecontrolller = TextEditingController();

  final amountcontroller = TextEditingController();
  DateTime selectedDate;

  void submitted() {
    final titleEntered = titlecontrolller.text;
    final amountEnterd = double.parse(amountcontroller.text);
    if (titleEntered.isEmpty || amountEnterd < 0 || selectedDate == null) {
      return;
    }
    widget.addTx(titleEntered, amountEnterd, selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
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
            Row(
              children: [
                Expanded(
                  child: Text(
                    selectedDate == null
                        ? 'No date chosen !'
                        : DateFormat.yMd().format(selectedDate),
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(10),
                    child: FlatButton(
                      onPressed: _presentDatePicker,
                      child: Text('Choose Date'),
                      color: Colors.purple,
                    ))
              ],
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
