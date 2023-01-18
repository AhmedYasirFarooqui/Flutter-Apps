import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier{
  int _count = 50;
  int get count => _count;

  void increment(){
    _count++;
    notifyListeners();
  }
}