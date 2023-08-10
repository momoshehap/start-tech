import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startech/core/strings.dart';
import '../../core/dio_helper.dart';
import '../../model/user.dart';

class LoginController extends GetxController {
   User? userData ;

  Future login(String email,String password) async {
    final dio.FormData formData = dio.FormData.fromMap({
      'email': email,
      'password': password,
    });
   try{
    final dio.Response  response = await Helper.post(
      url: "login",
      query: formData,
      );
    if (response.statusCode == 200) {
      // Successfully fetched data
      userData =User.fromJson( response.data);
      final SharedPreferences userPrefs = await SharedPreferences.getInstance();
        userPrefs.setString('userData', jsonEncode(userData!.toJson()));
        update();
         Get.snackbar("sucsses",
                  response.data['message'],
                  
                  colorText: AppColors.primary,
                  backgroundColor: Colors.green,
                  icon: const Icon(Icons.add_alert),
                );
  return false;
    } else {
      
                Get.snackbar("faild",
                  'Invalid email or password',
                 colorText: AppColors.white,
                  backgroundColor: Colors.red,
                  icon: const Icon(Icons.add_alert),
                );
  return true;
    }
      }catch(e){
        Get.snackbar("faild",
                  'Invalid email or password',
                 colorText: AppColors.white,
                  backgroundColor: Colors.red,
                  icon: const Icon(Icons.add_alert),
                );
      return true;
      }

}
  

}