import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider_sample/models/business_model.dart';
import 'package:provider_sample/repositories/business_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ViewState { idle, loading, success, error }

class BusinessProvider with ChangeNotifier {

  late BusinessRepository _repository;
  late SharedPreferences _prefs;
  ViewState _state = ViewState.idle;
  List<BusinessModel> _businesses = [];

  ViewState get state => _state;
  String _errorMessage = '';

  List<BusinessModel> get businesses => _businesses;

  String get errorMessage => _errorMessage;


  BusinessProvider([BusinessRepository? repository, SharedPreferences? prefs]){
    _prefs =  prefs ?? _prefs ;
    _repository = repository ?? BusinessRepository(dio: Dio(), prefs: _prefs);

  }

  Future<void> fetchBusinesses() async {
    _state = ViewState.loading;
    notifyListeners();
    try {
      final businessList = await _repository.fetchBusinesses();
      _businesses = businessList;
      _state = ViewState.success;
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      _state = ViewState.error;
    }
    notifyListeners();
  }


}
