import 'package:flutter/cupertino.dart';

class CounterProvider with ChangeNotifier {
  int _count = 0;

  get count => _count;

  void increaseCount() {
    _count++;
    notifyListeners();
  }

  void reduceCount() {
    _count--;
    notifyListeners();
  }
}
