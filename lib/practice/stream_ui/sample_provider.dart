import 'package:flutter/cupertino.dart';

class MySampleProvider with ChangeNotifier{
  String? message="";
  bool? eligible;

  void checkEligible(int age){
    if(age>=20){
      eligible= true;
      message= "you are now eligible";
      notifyListeners();
    }
    else{
      eligible= false;
      message= "you are not eligible";
      notifyListeners();
    }
  }
}