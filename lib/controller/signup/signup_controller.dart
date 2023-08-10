import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:startech/core/strings.dart';
import '../../core/dio_helper.dart';
import '../../model/user.dart';

class SignupController extends GetxController {
   User? userData ;
String countryCode="+39";
  Future signup({
    required String name,
    required String email,
    required String phone,
    required String password}) async {
    final dio.FormData formData = dio.FormData.fromMap({
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'password_confirm': password,
      'country_code': countryCode,
    });
  try{
    final dio.Response  response = await Helper.post(
      url: "user/register",
      query: formData,
      );
    if (response.statusCode == 201) {
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
      // Failed to fetch data
        return true;

    }}catch (e){
Get.snackbar("faild",
                  'Email already found',
                 colorText: AppColors.white,
                  backgroundColor: Colors.red,
                  icon: const Icon(Icons.add_alert),
                );
      return true;
    }
  }
}