import 'package:flutter/material.dart';
import 'package:flutter_stream/bloc/bloc_counter/counter_state.dart';

import '../bloc_counter/counter_bloc.dart';
import '../bloc_counter/counter_event.dart';

class MyCounterPage extends StatefulWidget {
  const MyCounterPage({super.key});

  @override
  State<MyCounterPage> createState() => _MyCounterPageState();
}

class _MyCounterPageState extends State<MyCounterPage> {

  final CounterBloc _counterBloc = CounterBloc();

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter Value:',
              style: TextStyle(fontSize: 50),
            ),
            const SizedBox(height: 20),
            // StreamBuilder listens to state changes
            StreamBuilder<CounterState>(
              stream: _counterBloc.state,
              initialData: CounterState(count: 0),
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data!.count}',
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                );
              }
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    _counterBloc.event.add(Decrement());
                  },
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    _counterBloc.event.add(Increment());
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

