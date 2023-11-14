import 'package:equatable/equatable.dart';

class Device extends Equatable {
  const Device({required this.name, required this.address});
  final String name;
  final String address;

  @override
  List<Object?> get props => [name, address];
}

class ScanCubitState extends Equatable {
  final List<Device> discoveredDevices = [];

  @override
  List<Object?> get props => [discoveredDevices];
}
