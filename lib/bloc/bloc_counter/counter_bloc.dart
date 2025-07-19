import 'dart:async';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc{
  int _count = 0;

  final _eventController = StreamController<CounterEvent>();
  final _stateController = StreamController<CounterState>();

  Sink<CounterEvent> get event => _eventController.sink;
  Stream<CounterState> get state => _stateController.stream;

  void _mapEventToState(CounterEvent event){
    if(event is Increment){
      _count++;
      _stateController.add(CounterState(count: _count));
    }else if(event is Decrement){
      _count--;
      _stateController.add(CounterState(count: _count));
    }
  }

  CounterBloc(){
    _eventController.stream.listen(_mapEventToState);
  }

  dispose(){
    _eventController.close();
    _stateController.close();
  }
}