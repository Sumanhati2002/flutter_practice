/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stream/bloc/internate_bloc/internate_bloc.dart';
import 'package:flutter_stream/bloc/internate_bloc/internate_state.dart';

class HomeScreenBloc extends StatelessWidget {
  const HomeScreenBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Center(child: BlocBuilder<InternetBloc, InternetState>(
        builder: (context, state) {
          if (state is InternetGainedState) {
            return Text('connected...');
          } else if (state is InternetLostState) {
            return Text('not connected..');
          } else {
            return Text('loading......');
          }
        },
      )),
    ));
  }
}
*/
