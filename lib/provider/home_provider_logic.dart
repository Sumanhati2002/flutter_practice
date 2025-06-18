import 'package:flutter/cupertino.dart';

class MyHomeProvider with ChangeNotifier{
  bool? eligible;
  String? message = "";

  void checkEligibility(int age){
    if(age>=20){
      eligible = true;
      message = "you are eligible";
      notifyListeners();
    }
    else{
      eligible = false;
      message = "you are not eligible";
      notifyListeners();
    }
  }
}