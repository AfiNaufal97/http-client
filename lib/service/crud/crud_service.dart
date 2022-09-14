import 'package:dio/dio.dart';
import '../../model/crud/create_employee.dart';
import '../../model/crud/update_employee.dart';

class CrudService {
  String baseurl = "https://reqres.in/api";

  Future<CreateEmployee> createEmployee(String name, String job) async {
    try {
      var res = await Dio().post(baseurl+ "/users",
          data: {"name": name, "job": job});
      print(res.statusCode);
      if (res.statusCode == 201) {
        Map<String, dynamic> body = res.data;
        print(body);
        return CreateEmployee.fromJson(body);
      } else {
        return res.data['error'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UpdateEmployee> updateEmployee(int id, String name, String job) async {
    try {
      var res = await Dio().put(baseurl+ "/users/$id",
          data: {"name": name, "job": job});
        print(res.statusCode);
      if (res.statusCode == 200) {
        Map<String, dynamic> body = res.data;
        print(body);
        return UpdateEmployee.fromJson(body);
      } else {
        return res.data['error'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteEmployee(int id) async {
    try {
      await Dio().delete((baseurl+'/users/$id'));
    } catch (e) {
      rethrow;
    }
  }
}
