import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startech/routes/app_pages.dart';
import 'package:startech/view/home/screens/home.dart';
import 'package:startech/view/wellcome/screens/splash.dart';

import 'binding/home/home_binding.dart';
import 'core/dio_helper.dart';
bool iscached=false;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Helper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Start Tech',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialBinding: HomeBinding(),
      home: SplashPage(),
      getPages: AppPages.pages,
    );
  }
}
