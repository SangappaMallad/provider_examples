import 'dart:convert';

import 'package:api_integration_demo/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // mutiple [{},{}]
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

// Direct data bind in model single {}
  // Future<UserModel> fetchPost() async {
  //   final response = await http
  //       .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

  //   if (response.statusCode == 200) {
  //     // If the server returns an OK response, then parse the JSON.
  //     return UserModel.fromJson(
  //         jsonDecode(response.body) as Map<String, dynamic>);
  //   } else {
  //     // If the response was umexpected, throw an error.
  //     throw Exception('Failed to load post');
  //   }
  // }

  //  // Live api 'data' : [{},{}]
  // Future<List<UserModel>> getAllData() async {
  //   final response = await http
  //       .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

  //   if (response.statusCode == 200) {
  //   final parsed = json.decode(response.body).cast<Map<String, dynamic>>(); 
  //   return parsed.map<UserModel>((json) =>UserModel.fromJson(json)).toList();
  //   }
  //   return [];
  // }

}
