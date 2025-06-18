/*
import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stream/bloc/internate_bloc/internate_event.dart';
import 'package:flutter_stream/bloc/internate_bloc/internate_state.dart';

class InternetBloc extends Bloc<InternetEvent,InternetState>{

   Connectivity connectivity = Connectivity();
   StreamSubscription? connectivitySubcription;

  InternetBloc():super(InternetInitialState()){
    on<InternetLostEvent>((event,emit)=>emit(InternetLostState()));
    on<InternetGainEvent>((event,emit)=>emit(InternetGainedState()));

    connectivitySubcription = connectivity.onConnectivityChanged.listen((result){
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        add(InternetGainEvent());
      }
      else{
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySubcription?.cancel();
    return super.close();
  }
}*/
