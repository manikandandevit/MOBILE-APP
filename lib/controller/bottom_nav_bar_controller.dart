
import 'package:flutter/material.dart';

import 'auth_controller.dart';
import 'home_controller.dart';

class BottomNavBarController extends ChangeNotifier {
  int selectedIndex = 0;

  void changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}