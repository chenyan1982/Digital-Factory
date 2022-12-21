import 'dart:convert';

import 'database.dart';

abstract class SupabaseDataRow {
  SupabaseDataRow(this.data);

  SupabaseTable get table;
  Map<String, dynamic> data;

  String get tableName => table.tableName;

  T? getField<T>(String fieldName, [T? defaultValue]) =>
      _supaDeserialize<T>(data[fieldName]) ?? defaultValue;
  void setField<T>(String fieldName, T? value) =>
      data[fieldName] = supaSerialize(value);
  List<T> getListField<T>(String fieldName) =>
      _supaDeserializeList<T>(data[fieldName]) ?? [];
  void setListField<T>(String fieldName, List<T>? value) =>
      data[fieldName] = supaSerialize(value);

  @override
  String toString() => '''
Table: $tableName
Row Data: {${data.isNotEmpty ? '\n' : ''}${data.entries.map((e) => '  (${e.value.runtimeType}) "${e.key}": ${e.value},\n').join('')}}''';
}

dynamic supaSerialize<T>(T? value) {
  if (value == null) {
    return null;
  }

  switch (T) {
    case DateTime:
      return (value as DateTime).toIso8601String();
    case LatLng:
      final latLng = (value as LatLng);
      return {'lat': latLng.latitude, 'lng': latLng.longitude};
    default:
      return value;
  }
}

List? supaSerializeList<T>(List<T>? value) =>
    value?.map((v) => supaSerialize<T>(v)).toList();

T? _supaDeserialize<T>(dynamic value) {
  if (value == null) {
    return null;
  }

  switch (T) {
    case int:
      return (value as num).round() as T?;
    case double:
      return (value as num).toDouble() as T?;
    case DateTime:
      return DateTime.tryParse(value as String) as T?;
    case LatLng:
      final latLng = value is Map ? value : json.decode(value) as Map;
      final lat = latLng['lat'] ?? latLng['latitude'];
      final lng = latLng['lng'] ?? latLng['longitude'];
      return lat is num && lng is num
          ? LatLng(lat.toDouble(), lng.toDouble()) as T?
          : null;
    default:
      return value as T;
  }
}

List<T>? _supaDeserializeList<T>(dynamic value) => value is List
    ? value
        .map((v) => _supaDeserialize<T>(v))
        .where((v) => v != null)
        .map((v) => v as T)
        .toList()
    : null;
