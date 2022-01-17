
import 'package:flutter/material.dart';
import './widgets/new_transcation.dart';
import './widgets/transcationlist.dart';
import '../models/transcation.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
   final List<Transcation> _transcations = [
      
  ];

  void _addNewTranscation(String title,double amount)
  {
    final newTx=Transcation(title:title,amount:amount,date:DateTime.now(),id:DateTime.now().toString() );
    setState(() {
      _transcations.add(newTx);
    });
  }

  void _startNewTranscation(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: (){},
            child: NewTranscation(_addNewTranscation),
            behavior: HitTestBehavior.opaque,
            );

        });
  }

List<Transcation> get _recentTransactions {
    return _transcations.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Personal Expenses'),
        actions: [IconButton(onPressed: ()=>_startNewTranscation(context), icon: Icon(Icons.add))],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           Chart(_recentTransactions),
            TranscationList(_transcations)
            
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>_startNewTranscation(context),
      ),
    );
  }
}
