import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/dio_helper.dart';
import '../../core/strings.dart';
import '../../model/user.dart';

class UpdateController extends GetxController {
String countryCode="+39";
  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String token}) async {
    final dio.FormData formData = dio.FormData.fromMap({
      'name': name,
      'email': email,
      'phone': phone,
      'country_code': countryCode,
    });
   try{
    final dio.Response  response = await Helper.post(
      url: "user/update",
      query: formData,
      token: token,
      );

    if (response.statusCode == 200) {
      // Successfully fetched data
       final SharedPreferences userPrefs = await SharedPreferences.getInstance();
        ;
    Map<String, dynamic> jsonString = json.decode(userPrefs.getString('userData')!);
        update();

       User  userData= User.fromJson(jsonString);
        userData.data!.name=response.data['data']['name'];
        userData.data!.email=response.data['data']['email'];
        userData.data!.phone=response.data['data']['phone'];
        userData.data!.countryCode=response.data['data']['country_code'];
        userPrefs.setString('userData', jsonEncode(userData!.toJson()));

        update();
        Get.snackbar("sucsses",
                  response.data['message'],
                  
                  colorText: AppColors.primary,
                  backgroundColor: Colors.green,
                  icon: const Icon(Icons.add_alert),
                );
    } else {
      
      Get.snackbar("faild",
                  response.data['message'],
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
