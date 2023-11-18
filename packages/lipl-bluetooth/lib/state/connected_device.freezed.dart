// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connected_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectedDevice {
  BluetoothDevice get device => throw _privateConstructorUsedError;
  BluetoothService get displayService => throw _privateConstructorUsedError;
  BluetoothCharacteristic get textCharacteristic =>
      throw _privateConstructorUsedError;
  BluetoothCharacteristic get statusCharacteristic =>
      throw _privateConstructorUsedError;
  BluetoothCharacteristic get commandCharacteristic =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectedDeviceCopyWith<ConnectedDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectedDeviceCopyWith<$Res> {
  factory $ConnectedDeviceCopyWith(
          ConnectedDevice value, $Res Function(ConnectedDevice) then) =
      _$ConnectedDeviceCopyWithImpl<$Res, ConnectedDevice>;
  @useResult
  $Res call(
      {BluetoothDevice device,
      BluetoothService displayService,
      BluetoothCharacteristic textCharacteristic,
      BluetoothCharacteristic statusCharacteristic,
      BluetoothCharacteristic commandCharacteristic});
}

/// @nodoc
class _$ConnectedDeviceCopyWithImpl<$Res, $Val extends ConnectedDevice>
    implements $ConnectedDeviceCopyWith<$Res> {
  _$ConnectedDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
    Object? displayService = null,
    Object? textCharacteristic = null,
    Object? statusCharacteristic = null,
    Object? commandCharacteristic = null,
  }) {
    return _then(_value.copyWith(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice,
      displayService: null == displayService
          ? _value.displayService
          : displayService // ignore: cast_nullable_to_non_nullable
              as BluetoothService,
      textCharacteristic: null == textCharacteristic
          ? _value.textCharacteristic
          : textCharacteristic // ignore: cast_nullable_to_non_nullable
              as BluetoothCharacteristic,
      statusCharacteristic: null == statusCharacteristic
          ? _value.statusCharacteristic
          : statusCharacteristic // ignore: cast_nullable_to_non_nullable
              as BluetoothCharacteristic,
      commandCharacteristic: null == commandCharacteristic
          ? _value.commandCharacteristic
          : commandCharacteristic // ignore: cast_nullable_to_non_nullable
              as BluetoothCharacteristic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectedDeviceImplCopyWith<$Res>
    implements $ConnectedDeviceCopyWith<$Res> {
  factory _$$ConnectedDeviceImplCopyWith(_$ConnectedDeviceImpl value,
          $Res Function(_$ConnectedDeviceImpl) then) =
      __$$ConnectedDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BluetoothDevice device,
      BluetoothService displayService,
      BluetoothCharacteristic textCharacteristic,
      BluetoothCharacteristic statusCharacteristic,
      BluetoothCharacteristic commandCharacteristic});
}

/// @nodoc
class __$$ConnectedDeviceImplCopyWithImpl<$Res>
    extends _$ConnectedDeviceCopyWithImpl<$Res, _$ConnectedDeviceImpl>
    implements _$$ConnectedDeviceImplCopyWith<$Res> {
  __$$ConnectedDeviceImplCopyWithImpl(
      _$ConnectedDeviceImpl _value, $Res Function(_$ConnectedDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
    Object? displayService = null,
    Object? textCharacteristic = null,
    Object? statusCharacteristic = null,
    Object? commandCharacteristic = null,
  }) {
    return _then(_$ConnectedDeviceImpl(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice,
      displayService: null == displayService
          ? _value.displayService
          : displayService // ignore: cast_nullable_to_non_nullable
              as BluetoothService,
      textCharacteristic: null == textCharacteristic
          ? _value.textCharacteristic
          : textCharacteristic // ignore: cast_nullable_to_non_nullable
              as BluetoothCharacteristic,
      statusCharacteristic: null == statusCharacteristic
          ? _value.statusCharacteristic
          : statusCharacteristic // ignore: cast_nullable_to_non_nullable
              as BluetoothCharacteristic,
      commandCharacteristic: null == commandCharacteristic
          ? _value.commandCharacteristic
          : commandCharacteristic // ignore: cast_nullable_to_non_nullable
              as BluetoothCharacteristic,
    ));
  }
}

/// @nodoc

class _$ConnectedDeviceImpl implements _ConnectedDevice {
  const _$ConnectedDeviceImpl(
      {required this.device,
      required this.displayService,
      required this.textCharacteristic,
      required this.statusCharacteristic,
      required this.commandCharacteristic});

  @override
  final BluetoothDevice device;
  @override
  final BluetoothService displayService;
  @override
  final BluetoothCharacteristic textCharacteristic;
  @override
  final BluetoothCharacteristic statusCharacteristic;
  @override
  final BluetoothCharacteristic commandCharacteristic;

  @override
  String toString() {
    return 'ConnectedDevice(device: $device, displayService: $displayService, textCharacteristic: $textCharacteristic, statusCharacteristic: $statusCharacteristic, commandCharacteristic: $commandCharacteristic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectedDeviceImpl &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.displayService, displayService) ||
                other.displayService == displayService) &&
            (identical(other.textCharacteristic, textCharacteristic) ||
                other.textCharacteristic == textCharacteristic) &&
            (identical(other.statusCharacteristic, statusCharacteristic) ||
                other.statusCharacteristic == statusCharacteristic) &&
            (identical(other.commandCharacteristic, commandCharacteristic) ||
                other.commandCharacteristic == commandCharacteristic));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device, displayService,
      textCharacteristic, statusCharacteristic, commandCharacteristic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectedDeviceImplCopyWith<_$ConnectedDeviceImpl> get copyWith =>
      __$$ConnectedDeviceImplCopyWithImpl<_$ConnectedDeviceImpl>(
          this, _$identity);
}

abstract class _ConnectedDevice implements ConnectedDevice {
  const factory _ConnectedDevice(
          {required final BluetoothDevice device,
          required final BluetoothService displayService,
          required final BluetoothCharacteristic textCharacteristic,
          required final BluetoothCharacteristic statusCharacteristic,
          required final BluetoothCharacteristic commandCharacteristic}) =
      _$ConnectedDeviceImpl;

  @override
  BluetoothDevice get device;
  @override
  BluetoothService get displayService;
  @override
  BluetoothCharacteristic get textCharacteristic;
  @override
  BluetoothCharacteristic get statusCharacteristic;
  @override
  BluetoothCharacteristic get commandCharacteristic;
  @override
  @JsonKey(ignore: true)
  _$$ConnectedDeviceImplCopyWith<_$ConnectedDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
