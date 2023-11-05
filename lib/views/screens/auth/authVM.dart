import 'package:flutter/cupertino.dart';
import 'package:martfy/constants/commen_variable.dart';
import 'package:martfy/helper/localDB.dart';
import 'package:martfy/helper/noetwork_repo.dart';
import 'package:martfy/models/user_model.dart';

class AuthVM extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  final ApiProvider apiProvider = ApiProvider();
  LocalDB localDB = LocalDB();
  User? _user;
  User? get user => _user;
  updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Future<void> login(User user, void Function(bool success) callback) async {
    bool success = false;
    try {
      _user = user.copyWith(email: user.email, password: user.password);
      final response = await apiProvider.post('signin', _user!.toJson());
      final token = response['token'];
      printx("this is my token", token);
      final userBox = await localDB.openBox('token');
      localDB.saveData(userBox, "key", token);
      printx("this userBox", userBox);
      success = true;
      notifyListeners();
    } catch (error, stackTrace) {
      printx("error", error);
      printx("error", stackTrace);
    } finally {
      callback(success);
      printx("response", success);
    }
  }
}
