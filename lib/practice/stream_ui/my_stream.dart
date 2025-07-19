import 'package:flutter/material.dart';
import 'package:flutter_stream/practice/stream_ui/sample_provider.dart';
import 'package:provider/provider.dart';

class MyStream extends StatelessWidget {
  const MyStream({super.key});

  @override
  Widget build(BuildContext context) {
    final ageProvider = context.watch<MySampleProvider>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ageProvider.message.toString(),
              style: TextStyle(
                color: ageProvider.eligible == true ? Colors.green : Colors.red,
              ),
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Enter your age'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                ageProvider.checkEligible(int.tryParse(value) ?? 0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
