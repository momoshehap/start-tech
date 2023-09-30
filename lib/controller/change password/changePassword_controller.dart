import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/dio_helper.dart';
import '../../core/strings.dart';
import '../../model/user.dart';

class ChangePasswordController extends GetxController {
  Future<void> changePassword({
    required String password,
    required String passwordConfirm,
    required String currentPassword,
    required String token}) async {
    final dio.FormData formData = dio.FormData.fromMap({
      'password': password,
      'password_confirm': passwordConfirm,
      'current_password': currentPassword,
    });
   try{
    final dio.Response  response = await Helper.post(
      url: "user/changepassword",
      query: formData,
      token: token,
      );

    if (response.statusCode == 200) {
      // Successfully fetched data
        
print(response.data.toString());
       
        update();
        Get.snackbar("sucsses",
                  response.data['message'],
                  
                  colorText: AppColors.primary,
                  backgroundColor: Colors.green,
                  icon: const Icon(Icons.add_alert),
                );
    } else {
      print(response.data);
      Get.snackbar(response.data['message'],
                  response.data['data'][0]['password'],
                 colorText: AppColors.white,
                  backgroundColor: Colors.red,
                  icon: const Icon(Icons.add_alert),
                );
                        update();

                
      // Failed to fetch data
    }
   }on dio.DioException catch (e){
    if(e.response!.statusCode == 401){
    print(e.response!.statusCode);
  }else{
    print(e.message);
  }
        print(e.response!.statusCode);
     Get.snackbar("faild",
                     e.message
.toString(),
                 colorText: AppColors.white,
                  backgroundColor: Colors.red,
                  icon: const Icon(Icons.add_alert),
                );
                        update();

                
      // Failed to fetch data
    }
   }
  }
