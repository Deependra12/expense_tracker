import 'package:expense/models/transcation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TranscationList extends StatelessWidget {
  final List<Transcation> transcations;
  final Function deleteTx;
  TranscationList(this.transcations, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transcations.isEmpty
          ? const Text('no transcations')
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${transcations[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transcations[index].title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transcations[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: ()=>deleteTx(transcations[index].id),
                    ),
                  ),
                );
              },
              itemCount: transcations.length,
            ),
    );
  }
}
