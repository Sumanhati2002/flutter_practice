import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stream/bloc/internate_bloc/internate_bloc.dart';
import 'package:flutter_stream/brodcast.dart';
import 'package:flutter_stream/practice/MyPractice.dart';
import 'package:flutter_stream/practice/page_provider.dart';
import 'package:flutter_stream/provider/ui/home_provider.dart';
import 'package:provider/provider.dart';

import 'bloc/bloc_home_screen.dart';
import 'single.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
      create: (context) => MyPageProvider(),
          child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Mypractice(),
    );
  }
}
