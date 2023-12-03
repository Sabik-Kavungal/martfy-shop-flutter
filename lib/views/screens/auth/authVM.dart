import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:martfy/constants/commen_variable.dart';
import 'package:martfy/helper/localDB.dart';
import 'package:martfy/helper/noetwork_repo.dart';
import 'package:martfy/models/user_model.dart';

class AuthVM extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  final ApiProvider apiProvider = ApiProvider();

  LocalDB localDB = LocalDB();
  final Logger _logger = Logger();

  User user = User();

  updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Future<void> login(void Function(bool success) callback) async {
    bool success = false;
    try {
      final userN = user.copyWith(
        email: user.email,
        password: user.password,
      );
      printx(".........................", userN);
      final response = await apiProvider.post('signin', userN.toJson());
      final token = response['token'];
      _logger.d("Token: $token");
      localDB.saveData(await localDB.openBox('token'), "key", token);
      success = true;
      notifyListeners();
    } catch (error, stackTrace) {
      _logger.e("Error: $error", error: error, stackTrace: stackTrace);
    } finally {
      callback(success);
      _logger.d("Response: $success");
    }
  }

  Future<void> register(void Function(bool success) callback) async {
    bool success = false;
    try {
      user = user.copyWith(
          name: user.name, email: user.email, password: user.password);
      await apiProvider.post('signup', user.toJson());
      success = true;
      notifyListeners();
    } catch (error, stackTrace) {
      _logger.e("Error: $error", error: error, stackTrace: stackTrace);
    } finally {
      callback(success);
      _logger.d("Response: $success");
    }
  }

  logoutUser() async {
    final a = await localDB.openBox("token");
    localDB.deleteData(a, 'key');
    _logger.d("User logged out successfully");
    notifyListeners();
  }
}
