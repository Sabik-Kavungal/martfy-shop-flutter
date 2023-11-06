import 'package:flutter/material.dart';
import 'package:martfy/helper/localDB.dart';
import 'package:martfy/helper/noetwork_repo.dart';
import 'package:martfy/models/user_model.dart';

class HomeVM extends ChangeNotifier {
  final ApiProvider apiProvider = ApiProvider();

  LocalDB localDB = LocalDB();

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
      notifyListeners();
      final response = await apiProvider.get('profile');
      _user = User.fromJson(response);
      print('Posts: $_user');
      notifyListeners();
    } catch (error, stackTrace) {
      print('Error getting posts: $error');
      print('Stack trace: $stackTrace');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
