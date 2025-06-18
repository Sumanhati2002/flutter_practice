import 'dart:async';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamController<int> streamController = StreamController();
  int increament = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: StreamBuilder(
          stream: streamController.stream,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return
               Text(
                snapshot.data.toString(),
                style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              );
            }
            else{
             return
               const Text(
                '0',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            increament++;
            streamController.sink.add(increament);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
