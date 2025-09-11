import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:dio/dio.dart';
import 'package:provider_sample/models/business_model.dart';
import 'package:provider_sample/repositories/storage_manager.dart';

class BusinessRepository {
  late Dio _dio;
  late StorageManager _storageManager ;


  BusinessRepository({required Dio dio, required StorageManager storageManager}) {
    _storageManager = storageManager;
    _dio = dio;
    _storageManager.init();
  }

  Future<List<BusinessModel>> fetchBusinesses() async {
    await Future.delayed(Duration(seconds: 2));
    final jsonString = await rootBundle.loadString('assets/business.json');
    List<BusinessModel> businessModelFromJson = List<BusinessModel>.from(
      jsonDecode(jsonString).map((x) => BusinessModel.fromJson(x)),
    );

    await _storageManager.setString(_storageManager.businessCacheKey, jsonString);
    return businessModelFromJson;
  }
}
