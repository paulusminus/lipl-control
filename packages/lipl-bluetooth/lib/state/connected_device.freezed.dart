// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connected_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConnectedDevice {

 BluetoothDevice get device; BluetoothService get displayService; BluetoothCharacteristic get textCharacteristic; BluetoothCharacteristic get statusCharacteristic; BluetoothCharacteristic get commandCharacteristic;
/// Create a copy of ConnectedDevice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectedDeviceCopyWith<ConnectedDevice> get copyWith => _$ConnectedDeviceCopyWithImpl<ConnectedDevice>(this as ConnectedDevice, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectedDevice&&(identical(other.device, device) || other.device == device)&&(identical(other.displayService, displayService) || other.displayService == displayService)&&(identical(other.textCharacteristic, textCharacteristic) || other.textCharacteristic == textCharacteristic)&&(identical(other.statusCharacteristic, statusCharacteristic) || other.statusCharacteristic == statusCharacteristic)&&(identical(other.commandCharacteristic, commandCharacteristic) || other.commandCharacteristic == commandCharacteristic));
}


@override
int get hashCode => Object.hash(runtimeType,device,displayService,textCharacteristic,statusCharacteristic,commandCharacteristic);

@override
String toString() {
  return 'ConnectedDevice(device: $device, displayService: $displayService, textCharacteristic: $textCharacteristic, statusCharacteristic: $statusCharacteristic, commandCharacteristic: $commandCharacteristic)';
}


}

/// @nodoc
abstract mixin class $ConnectedDeviceCopyWith<$Res>  {
  factory $ConnectedDeviceCopyWith(ConnectedDevice value, $Res Function(ConnectedDevice) _then) = _$ConnectedDeviceCopyWithImpl;
@useResult
$Res call({
 BluetoothDevice device, BluetoothService displayService, BluetoothCharacteristic textCharacteristic, BluetoothCharacteristic statusCharacteristic, BluetoothCharacteristic commandCharacteristic
});




}
/// @nodoc
class _$ConnectedDeviceCopyWithImpl<$Res>
    implements $ConnectedDeviceCopyWith<$Res> {
  _$ConnectedDeviceCopyWithImpl(this._self, this._then);

  final ConnectedDevice _self;
  final $Res Function(ConnectedDevice) _then;

/// Create a copy of ConnectedDevice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? device = null,Object? displayService = null,Object? textCharacteristic = null,Object? statusCharacteristic = null,Object? commandCharacteristic = null,}) {
  return _then(_self.copyWith(
device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as BluetoothDevice,displayService: null == displayService ? _self.displayService : displayService // ignore: cast_nullable_to_non_nullable
as BluetoothService,textCharacteristic: null == textCharacteristic ? _self.textCharacteristic : textCharacteristic // ignore: cast_nullable_to_non_nullable
as BluetoothCharacteristic,statusCharacteristic: null == statusCharacteristic ? _self.statusCharacteristic : statusCharacteristic // ignore: cast_nullable_to_non_nullable
as BluetoothCharacteristic,commandCharacteristic: null == commandCharacteristic ? _self.commandCharacteristic : commandCharacteristic // ignore: cast_nullable_to_non_nullable
as BluetoothCharacteristic,
  ));
}

}


/// @nodoc


class _ConnectedDevice implements ConnectedDevice {
  const _ConnectedDevice({required this.device, required this.displayService, required this.textCharacteristic, required this.statusCharacteristic, required this.commandCharacteristic});
  

@override final  BluetoothDevice device;
@override final  BluetoothService displayService;
@override final  BluetoothCharacteristic textCharacteristic;
@override final  BluetoothCharacteristic statusCharacteristic;
@override final  BluetoothCharacteristic commandCharacteristic;

/// Create a copy of ConnectedDevice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectedDeviceCopyWith<_ConnectedDevice> get copyWith => __$ConnectedDeviceCopyWithImpl<_ConnectedDevice>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectedDevice&&(identical(other.device, device) || other.device == device)&&(identical(other.displayService, displayService) || other.displayService == displayService)&&(identical(other.textCharacteristic, textCharacteristic) || other.textCharacteristic == textCharacteristic)&&(identical(other.statusCharacteristic, statusCharacteristic) || other.statusCharacteristic == statusCharacteristic)&&(identical(other.commandCharacteristic, commandCharacteristic) || other.commandCharacteristic == commandCharacteristic));
}


@override
int get hashCode => Object.hash(runtimeType,device,displayService,textCharacteristic,statusCharacteristic,commandCharacteristic);

@override
String toString() {
  return 'ConnectedDevice(device: $device, displayService: $displayService, textCharacteristic: $textCharacteristic, statusCharacteristic: $statusCharacteristic, commandCharacteristic: $commandCharacteristic)';
}


}

/// @nodoc
abstract mixin class _$ConnectedDeviceCopyWith<$Res> implements $ConnectedDeviceCopyWith<$Res> {
  factory _$ConnectedDeviceCopyWith(_ConnectedDevice value, $Res Function(_ConnectedDevice) _then) = __$ConnectedDeviceCopyWithImpl;
@override @useResult
$Res call({
 BluetoothDevice device, BluetoothService displayService, BluetoothCharacteristic textCharacteristic, BluetoothCharacteristic statusCharacteristic, BluetoothCharacteristic commandCharacteristic
});




}
/// @nodoc
class __$ConnectedDeviceCopyWithImpl<$Res>
    implements _$ConnectedDeviceCopyWith<$Res> {
  __$ConnectedDeviceCopyWithImpl(this._self, this._then);

  final _ConnectedDevice _self;
  final $Res Function(_ConnectedDevice) _then;

/// Create a copy of ConnectedDevice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? device = null,Object? displayService = null,Object? textCharacteristic = null,Object? statusCharacteristic = null,Object? commandCharacteristic = null,}) {
  return _then(_ConnectedDevice(
device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as BluetoothDevice,displayService: null == displayService ? _self.displayService : displayService // ignore: cast_nullable_to_non_nullable
as BluetoothService,textCharacteristic: null == textCharacteristic ? _self.textCharacteristic : textCharacteristic // ignore: cast_nullable_to_non_nullable
as BluetoothCharacteristic,statusCharacteristic: null == statusCharacteristic ? _self.statusCharacteristic : statusCharacteristic // ignore: cast_nullable_to_non_nullable
as BluetoothCharacteristic,commandCharacteristic: null == commandCharacteristic ? _self.commandCharacteristic : commandCharacteristic // ignore: cast_nullable_to_non_nullable
as BluetoothCharacteristic,
  ));
}


}

// dart format on
