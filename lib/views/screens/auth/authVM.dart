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

  LocalDatabaseService db = LocalDatabaseService();
  final Logger _logger = Logger();

  User user = User();

  updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Future<void> login(void Function(bool success) callback) async {
    bool success = false;
    try {
      user = user.copyWith(email: user.email, password: user.password);
      printx(".........................", user);
      final response = await apiProvider.post('signin', user.toJson());
      final token = response['token'];
       final userId = response['_id'];
      final userType = response['userType'];
      printx("this is user is..............user is user is ...........",
          "${userId} use idddddddddddddddddddddd");
      printx('dddddddddddddddddddddd this my token dddddddddddddddddddddddd',
          token);
      _logger.d("Token: $token");
      db.toDb(await db.openBox('token'), "key", token);
      db.toDb(await db.openBox('userId'), "key", userId);
      db.toDb(await db.openBox('userType'), "key", userType);
        _logger.d("userTypessssssssssssssssssssssssssssssssssssss: $userType");
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
    final a = await db.openBox("token");
    db.deleteDb(a, 'key');
    _logger.d("User logged out successfully");
    notifyListeners();
  }
}
