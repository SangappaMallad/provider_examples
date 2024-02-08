import 'package:api_integration_demo/api_services/api_service.dart';
import 'package:api_integration_demo/model/user_model.dart';
import 'package:flutter/material.dart';

class UserProviders extends ChangeNotifier {
  final _service = ApiService();
  bool isLoading = false;

  List<UserModel> _todos = [];
  List<UserModel> get todos => _todos;

  Future<void> getAllComments() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAllComments();

    _todos = response;
    isLoading = false;
    notifyListeners();
  }
}
