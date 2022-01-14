import 'package:expense/models/transcation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TranscationList extends StatelessWidget {
  final List<Transcation> transcations;
  TranscationList(this.transcations);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:300,
      child: ListView(
        children: transcations.map(
          (trancation) {
            return Card(
                child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2)),
                  child: Text(
                    trancation.amount.toString(),
                    style: const TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trancation.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat.yMMMEd().format(trancation.date),
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    )
                  ],
                )
              ],
            ));
          },
        ).toList(),
      ),
    );
  }
}
