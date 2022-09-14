import 'package:contact/navigation/routes.dart';
import 'package:contact/screen/home/home_screen.dart';
import 'package:contact/screen/login/login_Screen.dart';
import 'package:contact/screen/register/register_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class GetxRoutes{
  static var pages = [
 GetPage(
      name: Routes.home,
      page: ()=>const HomeScreen()
    ),

     GetPage(
      name: Routes.register,
      page: ()=>const RegisterScreen()
    ),

     GetPage(
      name: Routes.login,
      page: ()=>const LoginScreen()
    ),

  ];
}