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

  int? get totalOutput;

  int? get todayOutput;

  String? get type;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DevicesRecordBuilder builder) => builder
    ..name = ''
    ..status = 0
    ..address = ''
    ..location = ''
    ..totalOutput = 0
    ..todayOutput = 0
    ..type = '';

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
  int? totalOutput,
  int? todayOutput,
  String? type,
}) {
  final firestoreData = serializers.toFirestore(
    DevicesRecord.serializer,
    DevicesRecord(
      (d) => d
        ..name = name
        ..status = status
        ..address = address
        ..location = location
        ..totalOutput = totalOutput
        ..todayOutput = todayOutput
        ..type = type,
    ),
  );

  return firestoreData;
}
