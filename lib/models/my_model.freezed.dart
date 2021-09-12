// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'my_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MyModelTearOff {
  const _$MyModelTearOff();

  _MyModel call({String? date, String? ipAddr, int? port, String? msg}) {
    return _MyModel(
      date: date,
      ipAddr: ipAddr,
      port: port,
      msg: msg,
    );
  }
}

/// @nodoc
const $MyModel = _$MyModelTearOff();

/// @nodoc
mixin _$MyModel {
  String? get date => throw _privateConstructorUsedError;
  String? get ipAddr => throw _privateConstructorUsedError;
  int? get port => throw _privateConstructorUsedError;
  String? get msg => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyModelCopyWith<MyModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyModelCopyWith<$Res> {
  factory $MyModelCopyWith(MyModel value, $Res Function(MyModel) then) =
      _$MyModelCopyWithImpl<$Res>;
  $Res call({String? date, String? ipAddr, int? port, String? msg});
}

/// @nodoc
class _$MyModelCopyWithImpl<$Res> implements $MyModelCopyWith<$Res> {
  _$MyModelCopyWithImpl(this._value, this._then);

  final MyModel _value;
  // ignore: unused_field
  final $Res Function(MyModel) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? ipAddr = freezed,
    Object? port = freezed,
    Object? msg = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      ipAddr: ipAddr == freezed
          ? _value.ipAddr
          : ipAddr // ignore: cast_nullable_to_non_nullable
              as String?,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int?,
      msg: msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MyModelCopyWith<$Res> implements $MyModelCopyWith<$Res> {
  factory _$MyModelCopyWith(_MyModel value, $Res Function(_MyModel) then) =
      __$MyModelCopyWithImpl<$Res>;
  @override
  $Res call({String? date, String? ipAddr, int? port, String? msg});
}

/// @nodoc
class __$MyModelCopyWithImpl<$Res> extends _$MyModelCopyWithImpl<$Res>
    implements _$MyModelCopyWith<$Res> {
  __$MyModelCopyWithImpl(_MyModel _value, $Res Function(_MyModel) _then)
      : super(_value, (v) => _then(v as _MyModel));

  @override
  _MyModel get _value => super._value as _MyModel;

  @override
  $Res call({
    Object? date = freezed,
    Object? ipAddr = freezed,
    Object? port = freezed,
    Object? msg = freezed,
  }) {
    return _then(_MyModel(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      ipAddr: ipAddr == freezed
          ? _value.ipAddr
          : ipAddr // ignore: cast_nullable_to_non_nullable
              as String?,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int?,
      msg: msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_MyModel with DiagnosticableTreeMixin implements _MyModel {
  const _$_MyModel({this.date, this.ipAddr, this.port, this.msg});

  @override
  final String? date;
  @override
  final String? ipAddr;
  @override
  final int? port;
  @override
  final String? msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyModel(date: $date, ipAddr: $ipAddr, port: $port, msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyModel'))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('ipAddr', ipAddr))
      ..add(DiagnosticsProperty('port', port))
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MyModel &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.ipAddr, ipAddr) ||
                const DeepCollectionEquality().equals(other.ipAddr, ipAddr)) &&
            (identical(other.port, port) ||
                const DeepCollectionEquality().equals(other.port, port)) &&
            (identical(other.msg, msg) ||
                const DeepCollectionEquality().equals(other.msg, msg)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(ipAddr) ^
      const DeepCollectionEquality().hash(port) ^
      const DeepCollectionEquality().hash(msg);

  @JsonKey(ignore: true)
  @override
  _$MyModelCopyWith<_MyModel> get copyWith =>
      __$MyModelCopyWithImpl<_MyModel>(this, _$identity);
}

abstract class _MyModel implements MyModel {
  const factory _MyModel(
      {String? date, String? ipAddr, int? port, String? msg}) = _$_MyModel;

  @override
  String? get date => throw _privateConstructorUsedError;
  @override
  String? get ipAddr => throw _privateConstructorUsedError;
  @override
  int? get port => throw _privateConstructorUsedError;
  @override
  String? get msg => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MyModelCopyWith<_MyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
