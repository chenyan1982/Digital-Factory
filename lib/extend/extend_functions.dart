import 'package:digital_factory/app_state.dart';
import 'dart:convert';
import 'package:digital_factory/backend/api_requests/api_calls.dart';

void loginThingsBoard() async {
  String username = 'boingadmin@inlaylink.com';
  String password = 'boingadmin';
  LoginEndpointCall loginEndpointCall = LoginEndpointCall();
  ApiCallResponse res =
      await loginEndpointCall.call(username: username, password: password);
  String token = loginEndpointCall.token(res.jsonBody);
  FFAppState().token = token;
  print("token ${FFAppState().token}");
}
