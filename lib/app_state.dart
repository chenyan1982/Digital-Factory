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
    _tbToken = prefs.getString('ff_tbToken') ?? _tbToken;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
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

  String _tbToken = '';
  String get tbToken => _tbToken;
  set tbToken(String _value) {
    notifyListeners();

    _tbToken = _value;
    prefs.setString('ff_tbToken', _value);
  }

  double _utilRate = 0.0;
  double get utilRate => _utilRate;
  set utilRate(double _value) {
    notifyListeners();

    _utilRate = _value;
  }

  int _speed = 0;
  int get speed => _speed;
  set speed(int _value) {
    notifyListeners();

    _speed = _value;
  }

  int _status = 0;
  int get status => _status;
  set status(int _value) {
    notifyListeners();

    _status = _value;
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
