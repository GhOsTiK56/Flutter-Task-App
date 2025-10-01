import 'dart:convert';

import 'package:frontend/core/constants/constants.dart';
import 'package:frontend/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteRepository {
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final res = await http.post(
        Uri.parse('${Constants.backendUri}/auth/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );

      if (res.statusCode != 201) {
        throw jsonDecode(res.body)['msg'];
      }

      return UserModel.fromJson(res.body);
    } catch (e) {
      throw e.toString();
    }
  }

  // Future<void> login()
}
