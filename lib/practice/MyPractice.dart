import 'package:flutter/material.dart';
import 'package:flutter_stream/practice/page_provider.dart';
import 'package:flutter_stream/practice/second_page.dart';
import 'package:provider/provider.dart';

class Mypractice extends StatefulWidget {
  const Mypractice({super.key});

  @override
  State<Mypractice> createState() => _MypracticeState();
}

class _MypracticeState extends State<Mypractice> {

  @override
  Widget build(BuildContext context) {
    return Consumer<MyPageProvider>(
      builder: (context, provider, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Center(
                child: Text(
                  provider.count.toString(),
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MySecondPage()));
                  },
                  child: const Text('Click for Next Page'))
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
