import 'package:flutter/material.dart';

class NewTranscation extends StatelessWidget {
  String titleInput;
  String amountInpput;
  final Function addTx;
  NewTranscation(this.addTx);

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
              onChanged: (value) {
                titleInput = value;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'amount'),
              onChanged: (value) {
                amountInpput = value;
              },
            ),
            FlatButton(
              onPressed: () {
                addTx(titleInput, double.parse(amountInpput));
              },
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
