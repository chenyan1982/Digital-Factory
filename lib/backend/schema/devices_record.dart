import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'devices_record.g.dart';

abstract class DevicesRecord
    implements Built<DevicesRecord, DevicesRecordBuilder> {
  static Serializer<DevicesRecord> get serializer => _$devicesRecordSerializer;

  String? get name;

  int? get status;

  String? get address;

  String? get location;

  String? get img;

  int? get totalOutput;

  int? get todayOutput;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DevicesRecordBuilder builder) => builder
    ..name = ''
    ..status = 0
    ..address = ''
    ..location = ''
    ..img = ''
    ..totalOutput = 0
    ..todayOutput = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('devices');

  static Stream<DevicesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DevicesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DevicesRecord._();
  factory DevicesRecord([void Function(DevicesRecordBuilder) updates]) =
      _$DevicesRecord;

  static DevicesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDevicesRecordData({
  String? name,
  int? status,
  String? address,
  String? location,
  String? img,
  int? totalOutput,
  int? todayOutput,
}) {
  final firestoreData = serializers.toFirestore(
    DevicesRecord.serializer,
    DevicesRecord(
      (d) => d
        ..name = name
        ..status = status
        ..address = address
        ..location = location
        ..img = img
        ..totalOutput = totalOutput
        ..todayOutput = todayOutput,
    ),
  );

  return firestoreData;
}
