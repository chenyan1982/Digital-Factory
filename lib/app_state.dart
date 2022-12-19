import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('ff_token') ?? _token;
  }

  late SharedPreferences prefs;

  dynamic _avgEfficency = jsonDecode('{\"value\":0,\"trendUp\":false}');
  dynamic get avgEfficency => _avgEfficency;
  set avgEfficency(dynamic _value) {
    notifyListeners();

    _avgEfficency = _value;
  }

  String _token = '';
  String get token => _token;
  set token(String _value) {
    notifyListeners();

    _token = _value;
    prefs.setString('ff_token', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
