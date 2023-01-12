import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start iot Group Code

class IotGroup {
  static String baseUrl = 'https://ljecyjphlwhpxruhjcxa.functions.supabase.co';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxqZWN5anBobHdocHhydWhqY3hhIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzE3NjQ4OTMsImV4cCI6MTk4NzM0MDg5M30.DbYvXLjf2QVdBf_5_uNX_khOHoh8NAfQT5uOA-pqWjA',
  };
  static MultiDeviceBriefsCall multiDeviceBriefsCall = MultiDeviceBriefsCall();
}

class MultiDeviceBriefsCall {
  Future<ApiCallResponse> call({
    int? pageSize = 20,
    int? page = 0,
  }) {
    final body = '''
{
  "pageSize": ${pageSize},
  "page": ${page}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'multiDeviceBriefs',
      apiUrl: '${IotGroup.baseUrl}/multiDeviceBriefs',
      callType: ApiCallType.POST,
      headers: {...IotGroup.headers},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SingleDeviceOutputAggregationCall {
  static Future<ApiCallResponse> call({
    String? deviceId = '',
    int? startTs,
    int? endTs,
    int? interval,
  }) {
    final body = '''
{
  "deviceId": "${deviceId}",
  "startTs": ${startTs},
  "endTs": ${endTs},
  "interval": ${interval}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'singleDeviceOutputAggregation',
      apiUrl: '${IotGroup.baseUrl}/singleDeviceOutputAggregation',
      callType: ApiCallType.POST,
      headers: {...IotGroup.headers},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
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
