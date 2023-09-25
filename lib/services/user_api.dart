import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:results_api/model/user.dart';

class UserApi
{
  static Future<List<User>> getUsers() async
  {
    const baseUrl = "https://randomuser.me/";
    const subUrl = "api/?results=10";
    final response = await http.get(Uri.parse("$baseUrl$subUrl"));
    final json = jsonDecode(response.body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      return User.fromJson(e);
    }).toList();
    return users;
  }
}