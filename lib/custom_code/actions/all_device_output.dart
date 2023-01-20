// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../backend/api_requests/api_calls.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
Future<dynamic> allDeviceOutput() async {
  // Add your function code here!
  var res = await AllDeviceOutputCall.call();

  return getJsonField(res.jsonBody, r'''$.data''');
}
