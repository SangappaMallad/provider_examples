import 'dart:convert';

import 'package:api_integration_demo/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  
  Future<List<UserModel>> getAllComments() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return UserModel(
            id: e['id'], name: e['name'], email: e['email'], body: e['body']);
      }).toList();
      return todos;
    }
    return [];
  }


}
