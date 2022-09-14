import 'package:contact/bloc/auth/bloc_auth.dart';
import 'package:contact/bloc/auth/event_auth.dart';
import 'package:contact/bloc/crud/bloc_crud.dart';
import 'package:contact/bloc/users/bloc_user.dart';
import 'package:contact/routes/getx_routes.dart';
import 'package:contact/utils/colors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'navigation/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BlocAuth()..add(EventGetToken())),
        BlocProvider(create: (context) => BlocCrud()),
        BlocProvider(create: (context) => BlocUser())
      ],
      child: GetMaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              color: MyColors.navy,
            ),
            iconTheme: const IconThemeData(color: MyColors.white)),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.register,
        getPages: GetxRoutes.pages,
      ),
    );
  }
}
