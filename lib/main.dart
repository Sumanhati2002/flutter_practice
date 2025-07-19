import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stream/brodcast.dart';
import 'package:flutter_stream/practice/stream_ui/my_stream.dart';
import 'package:flutter_stream/practice/stream_ui/sample_provider.dart';
import 'package:flutter_stream/provider/ui/home_provider.dart';
import 'package:provider/provider.dart';

import 'api_intigrate/home_page.dart';
import 'api_intigrate/home_page2.dart';
import 'bloc/ui/counter_page.dart';
import 'single.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MySampleProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}
