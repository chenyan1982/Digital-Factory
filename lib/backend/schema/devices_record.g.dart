// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DevicesRecord> _$devicesRecordSerializer =
    new _$DevicesRecordSerializer();

class _$DevicesRecordSerializer implements StructuredSerializer<DevicesRecord> {
  @override
  final Iterable<Type> types = const [DevicesRecord, _$DevicesRecord];
  @override
  final String wireName = 'DevicesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DevicesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.img;
    if (value != null) {
      result
        ..add('img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.totalOutput;
    if (value != null) {
      result
        ..add('totalOutput')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.todayOutput;
    if (value != null) {
      result
        ..add('todayOutput')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  DevicesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DevicesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'img':
          result.img = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'totalOutput':
          result.totalOutput = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'todayOutput':
          result.todayOutput = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$DevicesRecord extends DevicesRecord {
  @override
  final String? name;
  @override
  final int? status;
  @override
  final String? address;
  @override
  final String? location;
  @override
  final String? img;
  @override
  final int? totalOutput;
  @override
  final int? todayOutput;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DevicesRecord([void Function(DevicesRecordBuilder)? updates]) =>
      (new DevicesRecordBuilder()..update(updates))._build();

  _$DevicesRecord._(
      {this.name,
      this.status,
      this.address,
      this.location,
      this.img,
      this.totalOutput,
      this.todayOutput,
      this.ffRef})
      : super._();

  @override
  DevicesRecord rebuild(void Function(DevicesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DevicesRecordBuilder toBuilder() => new DevicesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DevicesRecord &&
        name == other.name &&
        status == other.status &&
        address == other.address &&
        location == other.location &&
        img == other.img &&
        totalOutput == other.totalOutput &&
        todayOutput == other.todayOutput &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, name.hashCode), status.hashCode),
                            address.hashCode),
                        location.hashCode),
                    img.hashCode),
                totalOutput.hashCode),
            todayOutput.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DevicesRecord')
          ..add('name', name)
          ..add('status', status)
          ..add('address', address)
          ..add('location', location)
          ..add('img', img)
          ..add('totalOutput', totalOutput)
          ..add('todayOutput', todayOutput)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DevicesRecordBuilder
    implements Builder<DevicesRecord, DevicesRecordBuilder> {
  _$DevicesRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  String? _img;
  String? get img => _$this._img;
  set img(String? img) => _$this._img = img;

  int? _totalOutput;
  int? get totalOutput => _$this._totalOutput;
  set totalOutput(int? totalOutput) => _$this._totalOutput = totalOutput;

  int? _todayOutput;
  int? get todayOutput => _$this._todayOutput;
  set todayOutput(int? todayOutput) => _$this._todayOutput = todayOutput;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DevicesRecordBuilder() {
    DevicesRecord._initializeBuilder(this);
  }

  DevicesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _status = $v.status;
      _address = $v.address;
      _location = $v.location;
      _img = $v.img;
      _totalOutput = $v.totalOutput;
      _todayOutput = $v.todayOutput;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DevicesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DevicesRecord;
  }

  @override
  void update(void Function(DevicesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DevicesRecord build() => _build();

  _$DevicesRecord _build() {
    final _$result = _$v ??
        new _$DevicesRecord._(
            name: name,
            status: status,
            address: address,
            location: location,
            img: img,
            totalOutput: totalOutput,
            todayOutput: todayOutput,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
