
import 'package:flutter/material.dart';
import 'package:flutter_stream/practice/page_provider.dart';
import 'package:provider/provider.dart';

class MySecondPage extends StatefulWidget {
  const MySecondPage({super.key});

  @override
  State<MySecondPage> createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {

  @override
  Widget build(BuildContext context) {
     return Consumer<MyPageProvider>(
       builder: (context, provider, child) =>
        Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Center(
                child: Text(
                  provider.count.toString(),
                  style:
                  const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(onPressed: () {
                  Navigator.pop(context);
              },
                  child: const Text('Click for previous Page'))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
           setState(() {
             provider.increment();
           });
          },
          child: const Icon(Icons.add),
        ),
           ),
     );
  }
}
