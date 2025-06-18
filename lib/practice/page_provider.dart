import 'package:flutter/cupertino.dart';

class MyPageProvider with ChangeNotifier{

  int count = 0;

  void increment(){
    count++;
    notifyListeners();
  }
}