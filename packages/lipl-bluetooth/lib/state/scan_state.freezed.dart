// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScanState {
  List<ScanResult> get scanResults => throw _privateConstructorUsedError;
  bool get isScanning => throw _privateConstructorUsedError;
  ConnectedDevice? get connectedDevice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScanStateCopyWith<ScanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanStateCopyWith<$Res> {
  factory $ScanStateCopyWith(ScanState value, $Res Function(ScanState) then) =
      _$ScanStateCopyWithImpl<$Res, ScanState>;
  @useResult
  $Res call(
      {List<ScanResult> scanResults,
      bool isScanning,
      ConnectedDevice? connectedDevice});

  $ConnectedDeviceCopyWith<$Res>? get connectedDevice;
}

/// @nodoc
class _$ScanStateCopyWithImpl<$Res, $Val extends ScanState>
    implements $ScanStateCopyWith<$Res> {
  _$ScanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanResults = null,
    Object? isScanning = null,
    Object? connectedDevice = freezed,
  }) {
    return _then(_value.copyWith(
      scanResults: null == scanResults
          ? _value.scanResults
          : scanResults // ignore: cast_nullable_to_non_nullable
              as List<ScanResult>,
      isScanning: null == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool,
      connectedDevice: freezed == connectedDevice
          ? _value.connectedDevice
          : connectedDevice // ignore: cast_nullable_to_non_nullable
              as ConnectedDevice?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ConnectedDeviceCopyWith<$Res>? get connectedDevice {
    if (_value.connectedDevice == null) {
      return null;
    }

    return $ConnectedDeviceCopyWith<$Res>(_value.connectedDevice!, (value) {
      return _then(_value.copyWith(connectedDevice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScanStateImplCopyWith<$Res>
    implements $ScanStateCopyWith<$Res> {
  factory _$$ScanStateImplCopyWith(
          _$ScanStateImpl value, $Res Function(_$ScanStateImpl) then) =
      __$$ScanStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ScanResult> scanResults,
      bool isScanning,
      ConnectedDevice? connectedDevice});

  @override
  $ConnectedDeviceCopyWith<$Res>? get connectedDevice;
}

/// @nodoc
class __$$ScanStateImplCopyWithImpl<$Res>
    extends _$ScanStateCopyWithImpl<$Res, _$ScanStateImpl>
    implements _$$ScanStateImplCopyWith<$Res> {
  __$$ScanStateImplCopyWithImpl(
      _$ScanStateImpl _value, $Res Function(_$ScanStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanResults = null,
    Object? isScanning = null,
    Object? connectedDevice = freezed,
  }) {
    return _then(_$ScanStateImpl(
      scanResults: null == scanResults
          ? _value._scanResults
          : scanResults // ignore: cast_nullable_to_non_nullable
              as List<ScanResult>,
      isScanning: null == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool,
      connectedDevice: freezed == connectedDevice
          ? _value.connectedDevice
          : connectedDevice // ignore: cast_nullable_to_non_nullable
              as ConnectedDevice?,
    ));
  }
}

/// @nodoc

class _$ScanStateImpl extends _ScanState {
  const _$ScanStateImpl(
      {final List<ScanResult> scanResults = const [],
      required this.isScanning,
      this.connectedDevice = null})
      : _scanResults = scanResults,
        super._();

  final List<ScanResult> _scanResults;
  @override
  @JsonKey()
  List<ScanResult> get scanResults {
    if (_scanResults is EqualUnmodifiableListView) return _scanResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scanResults);
  }

  @override
  final bool isScanning;
  @override
  @JsonKey()
  final ConnectedDevice? connectedDevice;

  @override
  String toString() {
    return 'ScanState(scanResults: $scanResults, isScanning: $isScanning, connectedDevice: $connectedDevice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanStateImpl &&
            const DeepCollectionEquality()
                .equals(other._scanResults, _scanResults) &&
            (identical(other.isScanning, isScanning) ||
                other.isScanning == isScanning) &&
            (identical(other.connectedDevice, connectedDevice) ||
                other.connectedDevice == connectedDevice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_scanResults),
      isScanning,
      connectedDevice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanStateImplCopyWith<_$ScanStateImpl> get copyWith =>
      __$$ScanStateImplCopyWithImpl<_$ScanStateImpl>(this, _$identity);
}

abstract class _ScanState extends ScanState {
  const factory _ScanState(
      {final List<ScanResult> scanResults,
      required final bool isScanning,
      final ConnectedDevice? connectedDevice}) = _$ScanStateImpl;
  const _ScanState._() : super._();

  @override
  List<ScanResult> get scanResults;
  @override
  bool get isScanning;
  @override
  ConnectedDevice? get connectedDevice;
  @override
  @JsonKey(ignore: true)
  _$$ScanStateImplCopyWith<_$ScanStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
