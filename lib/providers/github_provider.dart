import 'package:flutter/material.dart';
import '../models/repository.dart';
import '../models/user.dart';
import '../services/github_service.dart';

class GithubProvider with ChangeNotifier {
  List<Repository> _repositories = [];
  User? _user;
  bool _isLoading = false;

  List<Repository> get repositories => _repositories;
  User? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> fetchUserData(String token) async {
    _isLoading = true;
    notifyListeners();

    try {
      _user = await GithubService.getUser(token);
      _repositories = await GithubService.getRepositories(token);
    } catch (e) {
      print('Error fetching data: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
