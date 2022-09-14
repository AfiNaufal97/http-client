import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../model/auth/login_response.dart';
import '../../model/auth/register_response.dart';

class AuthService {
  String baseurl = "https://reqres.in/api";

  Future<RegisterResponse> registerEmployee(
      String email, String passeord) async {
    try {
      var res = await Dio().post(baseurl + "/register", data: {"email": email, "password": passeord});
      if (res.statusCode == 200) {
        print(res.data);
        Map<String, dynamic> authResponse = res.data;
        addToScureStorage(authResponse['token']);
        return RegisterResponse.fromJson(authResponse);
      } else {
        return jsonDecode(res.data)['error'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginResponse> loginEmployee(String email, String passeord) async {
    try {
      var res = await Dio().post(baseurl + "/login",
          data: {"email": email, "password": passeord});
      if (res.statusCode == 200) {
        Map<String, dynamic> authResponse = res.data;
        addToScureStorage(authResponse['token']);
        return LoginResponse.fromJson(authResponse);
      } else {
        return jsonDecode(res.data)['error'];
      }
    } catch (e) {
      rethrow;
    }
  }

  void addToScureStorage(String token) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: token);
  }

  Future<String?> getToken()async{
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    return token;
  }

  Future<void> deleteAllScureStorage() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }



}
