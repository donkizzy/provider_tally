import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider_sample/models/business_model.dart';
import 'package:provider_sample/repositories/business_repository.dart';
import 'package:provider_sample/repositories/storage_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ViewState { idle, loading, success, error, empty }

class BusinessProvider with ChangeNotifier {
  late BusinessRepository _repository;
  late StorageManager _storageManager;
  ViewState _state = ViewState.idle;
  List<BusinessModel> _businesses = [];

  ViewState get state => _state;
  String _errorMessage = '';

  List<BusinessModel> get businesses => _businesses;

  String get errorMessage => _errorMessage;

  BusinessProvider([BusinessRepository? repository, StorageManager? storageManager]) {
    _storageManager = storageManager ?? StorageManager();
    _repository = repository ?? BusinessRepository(dio: Dio(), storageManager: _storageManager);
  }

  Future<void> fetchBusinesses() async {
    _state = ViewState.loading;
    notifyListeners();
    try {
      final businessList = await _repository.fetchBusinesses();
      _businesses = businessList;
      if (_businesses.isEmpty) {
        _state = ViewState.empty;
      } else {
        _state = ViewState.success;
      }
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      _state = ViewState.error;
    }
    notifyListeners();
  }
}
