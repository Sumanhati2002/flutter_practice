import 'dart:async';

import 'package:flutter/material.dart';

class MySample extends StatefulWidget {
  const MySample({super.key});

  @override
  State<MySample> createState() => _MySampleState();
}

class _MySampleState extends State<MySample> {

  StreamController<int> countController = StreamController();
  int count =0;
  late Stream myStream;

  @override
  void initState() {
    super.initState();
    myStream = countController.stream.asBroadcastStream();
  }

  @override
  void dispose() {
    countController.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: myStream,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return Text(
                    snapshot.data.toString(),
                    style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                  );
                }
                else{
                  return const Text(
                    '0',
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                  );
                }
              }
            ),
            StreamBuilder(
                stream: myStream,
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return Text(
                      snapshot.data.toString(),
                      style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    );
                  }
                  else{
                    return const Text(
                      '0',
                      style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    );
                  }
                }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
          countController.sink.add(count);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
