import 'dart:convert';

import 'package:dio/dio.dart';

import '../../model/users/employee.dart';

class UsersService {
  String baseurl = "https://reqres.in/api";

  Future<List<Employee>> getListUser() async {
    try {
      var res = await Dio().get(baseurl + "/users?page=2");
      if (res.statusCode == 200) {
        List<dynamic> body =res.data['data'];
        var data = body.map((e) => Employee(
            email: e['email'],
            id: e['id'],
            avatar: e['avatar'],
            first_name: e['first_name'],
            last_name: e['last_name']));
        List<Employee> employees = data.toList();
        return employees;
      } else {
        return res.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Employee> getSingleUser(int id) async {
    try {
      var res = await Dio().get(baseurl + "/users/$id");
      if (res.statusCode == 200) {
        Map<String, dynamic> singleUser =
            Map<String, dynamic>.from(res.data['data']);
        return Employee(
            email: singleUser['email'],
            id: singleUser['id'],
            avatar: singleUser['avatar'],
            first_name: singleUser['first_name'],
            last_name: singleUser['last_name']);
      } else {
        print('404');
        return res.data;
      }
    } catch (e) {
      rethrow;
    }
  }
}
