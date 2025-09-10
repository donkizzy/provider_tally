import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:dio/dio.dart';
import 'package:provider_sample/models/business_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusinessRepository {
  late Dio _dio;
  late SharedPreferences _preferences ;
  static const String _businessCacheKey = 'business_data_cache';

  BusinessRepository({required Dio dio, required SharedPreferences prefs}){
    _preferences = prefs;
    _dio = dio;
  }

  Future<List<BusinessModel>> fetchBusinesses() async {
    await Future.delayed(Duration(seconds: 2));
    final jsonString = await rootBundle.loadString('assets/business.json');
    List<BusinessModel> businessModelFromJson = List<BusinessModel>.from(
      jsonDecode(jsonString).map((x) => BusinessModel.fromJson(x)),
    );
    await _preferences.setString(_businessCacheKey, jsonString);
    return businessModelFromJson;
  }
}
