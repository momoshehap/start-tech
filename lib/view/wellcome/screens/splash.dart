import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startech/model/user.dart';
import '../../../controller/home/home_controller.dart';
import '../../../routes/app_routes.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      final HomeController homeController = Get.put(HomeController());
    Timer(const Duration(seconds: 4), () {
      Get.offNamed(homeController.user != null?AppRoutes.home:AppRoutes.wellcom,);
    });

    return Scaffold(
      body: Center(
        child: Container(width: 200,height: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logo/logo.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
