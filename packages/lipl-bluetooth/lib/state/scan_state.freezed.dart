// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScanState {

 List<ScanResult> get scanResults; bool get isScanning; ConnectedDevice? get connectedDevice;
/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanStateCopyWith<ScanState> get copyWith => _$ScanStateCopyWithImpl<ScanState>(this as ScanState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanState&&const DeepCollectionEquality().equals(other.scanResults, scanResults)&&(identical(other.isScanning, isScanning) || other.isScanning == isScanning)&&(identical(other.connectedDevice, connectedDevice) || other.connectedDevice == connectedDevice));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(scanResults),isScanning,connectedDevice);

@override
String toString() {
  return 'ScanState(scanResults: $scanResults, isScanning: $isScanning, connectedDevice: $connectedDevice)';
}


}

/// @nodoc
abstract mixin class $ScanStateCopyWith<$Res>  {
  factory $ScanStateCopyWith(ScanState value, $Res Function(ScanState) _then) = _$ScanStateCopyWithImpl;
@useResult
$Res call({
 List<ScanResult> scanResults, bool isScanning, ConnectedDevice? connectedDevice
});


$ConnectedDeviceCopyWith<$Res>? get connectedDevice;

}
/// @nodoc
class _$ScanStateCopyWithImpl<$Res>
    implements $ScanStateCopyWith<$Res> {
  _$ScanStateCopyWithImpl(this._self, this._then);

  final ScanState _self;
  final $Res Function(ScanState) _then;

/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scanResults = null,Object? isScanning = null,Object? connectedDevice = freezed,}) {
  return _then(_self.copyWith(
scanResults: null == scanResults ? _self.scanResults : scanResults // ignore: cast_nullable_to_non_nullable
as List<ScanResult>,isScanning: null == isScanning ? _self.isScanning : isScanning // ignore: cast_nullable_to_non_nullable
as bool,connectedDevice: freezed == connectedDevice ? _self.connectedDevice : connectedDevice // ignore: cast_nullable_to_non_nullable
as ConnectedDevice?,
  ));
}
/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectedDeviceCopyWith<$Res>? get connectedDevice {
    if (_self.connectedDevice == null) {
    return null;
  }

  return $ConnectedDeviceCopyWith<$Res>(_self.connectedDevice!, (value) {
    return _then(_self.copyWith(connectedDevice: value));
  });
}
}


/// Adds pattern-matching-related methods to [ScanState].
extension ScanStatePatterns on ScanState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScanState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScanState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScanState value)  $default,){
final _that = this;
switch (_that) {
case _ScanState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScanState value)?  $default,){
final _that = this;
switch (_that) {
case _ScanState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ScanResult> scanResults,  bool isScanning,  ConnectedDevice? connectedDevice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScanState() when $default != null:
return $default(_that.scanResults,_that.isScanning,_that.connectedDevice);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ScanResult> scanResults,  bool isScanning,  ConnectedDevice? connectedDevice)  $default,) {final _that = this;
switch (_that) {
case _ScanState():
return $default(_that.scanResults,_that.isScanning,_that.connectedDevice);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ScanResult> scanResults,  bool isScanning,  ConnectedDevice? connectedDevice)?  $default,) {final _that = this;
switch (_that) {
case _ScanState() when $default != null:
return $default(_that.scanResults,_that.isScanning,_that.connectedDevice);case _:
  return null;

}
}

}

/// @nodoc


class _ScanState extends ScanState {
  const _ScanState({final  List<ScanResult> scanResults = const [], required this.isScanning, this.connectedDevice = null}): _scanResults = scanResults,super._();
  

 final  List<ScanResult> _scanResults;
@override@JsonKey() List<ScanResult> get scanResults {
  if (_scanResults is EqualUnmodifiableListView) return _scanResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scanResults);
}

@override final  bool isScanning;
@override@JsonKey() final  ConnectedDevice? connectedDevice;

/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanStateCopyWith<_ScanState> get copyWith => __$ScanStateCopyWithImpl<_ScanState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScanState&&const DeepCollectionEquality().equals(other._scanResults, _scanResults)&&(identical(other.isScanning, isScanning) || other.isScanning == isScanning)&&(identical(other.connectedDevice, connectedDevice) || other.connectedDevice == connectedDevice));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_scanResults),isScanning,connectedDevice);

@override
String toString() {
  return 'ScanState(scanResults: $scanResults, isScanning: $isScanning, connectedDevice: $connectedDevice)';
}


}

/// @nodoc
abstract mixin class _$ScanStateCopyWith<$Res> implements $ScanStateCopyWith<$Res> {
  factory _$ScanStateCopyWith(_ScanState value, $Res Function(_ScanState) _then) = __$ScanStateCopyWithImpl;
@override @useResult
$Res call({
 List<ScanResult> scanResults, bool isScanning, ConnectedDevice? connectedDevice
});


@override $ConnectedDeviceCopyWith<$Res>? get connectedDevice;

}
/// @nodoc
class __$ScanStateCopyWithImpl<$Res>
    implements _$ScanStateCopyWith<$Res> {
  __$ScanStateCopyWithImpl(this._self, this._then);

  final _ScanState _self;
  final $Res Function(_ScanState) _then;

/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scanResults = null,Object? isScanning = null,Object? connectedDevice = freezed,}) {
  return _then(_ScanState(
scanResults: null == scanResults ? _self._scanResults : scanResults // ignore: cast_nullable_to_non_nullable
as List<ScanResult>,isScanning: null == isScanning ? _self.isScanning : isScanning // ignore: cast_nullable_to_non_nullable
as bool,connectedDevice: freezed == connectedDevice ? _self.connectedDevice : connectedDevice // ignore: cast_nullable_to_non_nullable
as ConnectedDevice?,
  ));
}

/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectedDeviceCopyWith<$Res>? get connectedDevice {
    if (_self.connectedDevice == null) {
    return null;
  }

  return $ConnectedDeviceCopyWith<$Res>(_self.connectedDevice!, (value) {
    return _then(_self.copyWith(connectedDevice: value));
  });
}
}

// dart format on
