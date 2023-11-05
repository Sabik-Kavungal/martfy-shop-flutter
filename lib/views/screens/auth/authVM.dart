import 'package:flutter/cupertino.dart';

class AuthVM extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
