import 'dart:convert';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../core/dio_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user.dart';
class HomeController extends GetxController {
User? user;

   Future<bool> deleteProfile() async {
    
    final dio.Response  response = await Helper.delete(
      url: "user/delete",
      token: user!.data.token,
      );

    if (response.statusCode == 200) {
      // Successfully fetched data
     await removeUserFromCache();
        update();
     return true;
    } else {
      // Failed to fetch data
    return false;

    }
  }
  removeUserFromCache()async{
      final SharedPreferences userPrefs = await SharedPreferences.getInstance();
        userPrefs.remove('userData');
        user=null;
  }
  RxString name=''.obs;
  RxString phone=''.obs;
  RxString email=''.obs;
  RxString countryCode=''.obs;
      getUserFromCache()async{
      final SharedPreferences userPrefs = await SharedPreferences.getInstance();
    String? userData = userPrefs.getString('userData');
   if( userData!=null){
    Map<String, dynamic> jsonString = json.decode(userData);
        user= User.fromJson(jsonString);
                  name=user!.data.name.obs;     
                  phone=user!.data.phone.obs;     
                  email=user!.data.email.obs;     
                  countryCode=user!.data.countryCode.obs;     
                        update();
        }
                update();

  }
  
}