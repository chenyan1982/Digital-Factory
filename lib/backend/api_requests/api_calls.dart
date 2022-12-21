import 'dart:convert';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start thingsBoard Group Code

class ThingsBoardGroup {
  static String baseUrl = 'http://180.167.54.158:10020';
  static Map<String, String> headers = {};
  static LoginEndpointCall loginEndpointCall = LoginEndpointCall();
  static GetCustomerDeviceInfosCall getCustomerDeviceInfosCall =
      GetCustomerDeviceInfosCall();
}

class LoginEndpointCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) {
    final body = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'loginEndpoint',
      apiUrl: '${ThingsBoardGroup.baseUrl}/api/auth/login',
      callType: ApiCallType.POST,
      headers: {
        ...ThingsBoardGroup.headers,
        'ContentType': 'application/json',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }

  dynamic token1(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
  dynamic refreshToken1(dynamic response) => getJsonField(
        response,
        r'''$.refreshToken''',
      );
}

class GetCustomerDeviceInfosCall {
  Future<ApiCallResponse> call({
    String? customerId = 'fd6650b0-e553-11ec-bef4-c38ec7217ebf',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getCustomerDeviceInfos',
      apiUrl:
          '${ThingsBoardGroup.baseUrl}/api/customer/${customerId}/deviceInfos',
      callType: ApiCallType.GET,
      headers: {
        ...ThingsBoardGroup.headers,
        'x-authorization':
            'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJib2luZ2FkbUBpbmxheWxpbmsuY29tIiwic2NvcGVzIjpbIkNVU1RPTUVSX1VTRVIiXSwidXNlcklkIjoiZmUzNmU0ZTAtNThjNy0xMWVkLWI1M2UtMTc3MmE4NzMwN2I5IiwiZW5hYmxlZCI6dHJ1ZSwiaXNQdWJsaWMiOmZhbHNlLCJ0ZW5hbnRJZCI6IjNjZjViN2EwLTY4ODgtMTFlYy1iMTEwLTQ3NjEwNzA0NTg5NCIsImN1c3RvbWVySWQiOiJmZDY2NTBiMC1lNTUzLTExZWMtYmVmNC1jMzhlYzcyMTdlYmYiLCJpc3MiOiJ0aGluZ3Nib2FyZC5pbyIsImlhdCI6MTY3MTQ0MDU4NSwiZXhwIjoxNjcxNDQ5NTg1fQ.mtXUSdyHYcS-zXjzW77Bquthdlgk2TkTSqjRFamdnpFfdNniZYDa1zUNtN9Q5tAyiZabuzAUSAt3eKurvPlPHg',
      },
      params: {
        'pageSize': 1000,
        'page': 0,
      },
      returnBody: true,
      cache: false,
    );
  }
}

/// End thingsBoard Group Code

class PicsumCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'picsum',
      apiUrl: 'https://picsum.photos/v2/list',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
