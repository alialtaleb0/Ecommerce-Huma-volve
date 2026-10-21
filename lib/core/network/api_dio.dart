import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiDio {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.escuelajs.co/api/v1',
      sendTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      connectTimeout: Duration(seconds: 30),
    ),
  );
  Future<void> login({required String email, required String password}) async {
    final response = await _dio.post(
      '/auth/login',
      data: {'email': email, 'password': password},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final String access_token = response.data['access_token'];
    } else {
      throw Exception('Failed to login: ${response.statusCode}');
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response =await _dio.post(
      '/users',
      data: {
        'email' : email,
        'password' : password,
        'name': name,
      }
    );
    if (response.statusCode==200 || response.statusCode == 201){
      final name =response.data['name'];
    }
    else{
      throw Exception('Failed to register: ${response.statusCode}');
    }
  }
}
