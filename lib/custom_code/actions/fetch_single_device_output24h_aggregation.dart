// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../backend/api_requests/api_calls.dart';
import '../../app_state.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
Future<dynamic> fetchSingleDeviceOutput24hAggregation(String deviceId) async {
  // Add your function code here!
  DateTime now = DateTime.now();
  DateTime endHour =
      new DateTime(now.year, now.month, now.day, now.hour, 59, 59, 999, 0);
  DateTime startHour = endHour.subtract(
      Duration(hours: 23, minutes: 59, seconds: 59, milliseconds: 999));

  var res = await SingleDeviceOutputAggregationCall.call(
      deviceId: deviceId,
      startTs: startHour.toUtc().millisecondsSinceEpoch,
      endTs: endHour.toUtc().millisecondsSinceEpoch,
      interval: 3600000);

  return getJsonField(res.jsonBody, r'''$.data[*]''');
}
