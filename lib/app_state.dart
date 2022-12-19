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
    _overview = prefs.getStringList('ff_overview')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _overview;
  }

  late SharedPreferences prefs;

  List<dynamic> _overview = [
    jsonDecode('{\"title\":\"总产量\",\"subtitle\":\"\",\"digital\":\"20.63千万\"}'),
    jsonDecode('{\"title\":\"平均稼动率\",\"subtitle\":\"\",\"digital\":\"98.72%\"}')
  ];
  List<dynamic> get overview => _overview;
  set overview(List<dynamic> _value) {
    notifyListeners();

    _overview = _value;
    prefs.setStringList(
        'ff_overview', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToOverview(dynamic _value) {
    notifyListeners();
    _overview.add(_value);
    prefs.setStringList(
        'ff_overview', _overview.map((x) => jsonEncode(x)).toList());
  }

  void removeFromOverview(dynamic _value) {
    notifyListeners();
    _overview.remove(_value);
    prefs.setStringList(
        'ff_overview', _overview.map((x) => jsonEncode(x)).toList());
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
