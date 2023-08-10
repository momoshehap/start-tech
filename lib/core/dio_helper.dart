import 'dart:convert';

import 'package:dio/dio.dart';

class Helper {
  static late Dio dio;
  static String baseUrl = "http://testapi.alifouad91.com/api/";

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );
  }

  static Future<Response> get({
    required String url,
    required Map<String, dynamic> query,
    String? token,
  }) async {
    return await dio
        .get(
      url,
      queryParameters: query,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    )
        .catchError((value) {
      if (value == null) {}
    });
  }

  static Future<Response> post({
    required String url,
    required  dynamic query,
        String? token,

  }) async {
    return await dio
        .post(
      url,
      data: query,
      options: Options(
         validateStatus: (status) {
              return status! < 500;
            },
      headers: {

          'Authorization': 'Bearer $token',
        },        
        contentType: 'application/json',
      ),
    )
        .catchError((value) {
      print(value);
    });
  }
   static Future<Response> delete({
    required String url,
        String? token,

  }) async {
    return await dio
        .delete(
      url,
      options: Options(
      headers: {
          'Authorization': 'Bearer $token',
        },        
        contentType: 'application/json',
      ),
    )
        .catchError((value) {
      print(value);
    });
  }

}
