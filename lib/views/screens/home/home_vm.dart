import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:martfy/helper/localDB.dart';
import 'package:martfy/helper/noetwork_repo.dart';
import 'package:martfy/models/user_model.dart';

class HomeVM extends ChangeNotifier {
  final ApiProvider apiProvider = ApiProvider();

  LocalDatabaseService db = LocalDatabaseService();
  final Logger _logger = Logger();
  User? _user;
  User? get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  HomeVM() {
    getProfile();
  }

  Future<void> getProfile() async {
    try {
      _isLoading = true;
      final response = await apiProvider.get('profile');
      _user = User.fromJson(response);
      _logger.d('Profile: $_user');
    } catch (error, stackTrace) {
      _logger.e("Error getting profile: $error",
          error: error, stackTrace: stackTrace);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
