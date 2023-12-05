import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:martfy/constants/commen_variable.dart';
import 'package:martfy/helper/localDB.dart';
import 'package:martfy/helper/noetwork_repo.dart';
import 'package:martfy/models/user_model.dart';

class HomeVM extends ChangeNotifier {
  final ApiProvider apiProvider = ApiProvider();

  LocalDatabaseService db = LocalDatabaseService();
  final Logger _logger = Logger();
  User user = User();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  HomeVM() {
    getProfile();
  }

  Future<void> getProfile() async {
    try {
      _isLoading = true;
      final response = await apiProvider.get('profile');
      user = User.fromJson(response);
      _logger.d('Profile: $user');
    } catch (error, stackTrace) {
      _logger.e("Error getting profile: $error",
          error: error, stackTrace: stackTrace);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  String _currentPassword = '';
  String _newPassword = '';
  String get currentPassword => _currentPassword;

  set currentPassword(String value) {
    _currentPassword = value;
    notifyListeners();
  }

  // Getter and setter for newPassword
  String get newPassword => _newPassword;

  set newPassword(String value) {
    _newPassword = value;
    notifyListeners();
  }

  Future<void> changePassword(void Function(bool success) callback) async {
    bool success = false;
    try {
      final Map<String, dynamic> passwordData = {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      };
      printx("this current password", currentPassword);
      printx("this new password", newPassword);
      await apiProvider.put('change-password', passwordData);
      printx("password", passwordData);
      success = true;
      notifyListeners();
    } catch (error, stackTrace) {
      _logger.e("Error: $error", error: error, stackTrace: stackTrace);
    } finally {
      callback(success);
      _logger.d("Response: $success");
    }
  }
}
