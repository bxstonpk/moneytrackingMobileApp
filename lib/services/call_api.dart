import 'dart:convert';

import 'package:money_tracking_project/environment.dart';
import 'package:money_tracking_project/models/user.dart';
import 'package:http/http.dart' as http;

class CallApi {
  static Future<List<User>> checkLoginAPI(User user) async {
    final responseData = await http.post(
      Uri.parse('${Environment.apiURL}/login_api.php'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user.toJson()),
    );

    if (responseData.statusCode == 200) {
      final responseDataDecoded = jsonDecode(responseData.body);
      List<User> data = await responseDataDecoded
          .map<User>((json) => User.fromJson(json))
          .toList();
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
