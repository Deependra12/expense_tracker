import 'package:flutter/material.dart';
import './new_transcation.dart';
import './transcationlist.dart';
import '../models/transcation.dart';


class UserTranscation extends StatefulWidget {
  

  @override
  _UserTranscationState createState() => _UserTranscationState();
}

class _UserTranscationState extends State<UserTranscation> {
   final List<Transcation> _transcations = [
    Transcation(
      id: 't1',
      title: 'shoes',
      amount: 1000,
      date: DateTime.now(),
    ),
    Transcation(
      id: 't2',
      title: 'bag',
      amount: 500,
      date: DateTime.now(),
    ),
    
  ];

  void _addNewTranscation(String title,double amount)
  {
    final newTx=Transcation(title:title,amount:amount,date:DateTime.now(),id:DateTime.now().toString() );
    setState(() {
      _transcations.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTranscation(_addNewTranscation),
        TranscationList(_transcations),
      ],
    );
  }
}
