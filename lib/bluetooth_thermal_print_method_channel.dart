import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bluetooth_thermal_print_platform_interface.dart';

/// An implementation of [BluetoothThermalPrintPlatform] that uses method channels.
class MethodChannelBluetoothThermalPrint extends BluetoothThermalPrintPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bluetooth_thermal_print');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  /// Get list of all paired bluetooth devices
  @override
  Future<List?> getBluetooths() async {
    List? items = [];
    try {
      final List? result = await methodChannel.invokeMethod('bluetothLinked');
      items = result;
    } on PlatformException catch (e) {
      print("Bluetooth paired failure: '${e.message}'.");
    }

    return items;
  }

  /// Get bluetooth device connection status
  @override
  Future<String?> connectionStatus() async {
    try {
      final String? result = await methodChannel.invokeMethod('connectionStatus');
      return result;
    } on PlatformException catch (e) {
      print("Failed to write bytes: '${e.message}'.");
      return "false";
    }
  }

  /// Connect to device using [mac].
  @override
  Future<String?> connect(String mac) async {
    String? result = "false";
    try {
      result = await methodChannel.invokeMethod('connectPrinter', mac);
    } on PlatformException catch (e) {
      print("Failed to connect: '${e.message}'.");
    }
    return result;
  }
  // disconnect to any connected device
  @override
  Future<String?> disconnect() async {
    String? result = "false";
    try {
      result = await methodChannel.invokeMethod('disconnectPrinter');
    } on PlatformException catch (e) {
      print("Failed to disconnect: '${e.message}'.");
    }
    return result;
  }


  ///Printes the [bytes] using bluetooth printer.
  @override
  Future<String?> writeBytes(List<int> bytes) async {
    try {
      final String? result = await methodChannel.invokeMethod('writeBytes', bytes);
      return result;
    } on PlatformException catch (e) {
      print("Failed to write bytes: '${e.message}'.");
      return "false";
    }
  }

  ///Printes the [text] using bluetooth printer.
  @override
  Future<String?> writeText(String text) async {
    try {
      final String? result = await methodChannel.invokeMethod('printText', text);
      return result;
    } on PlatformException catch (e) {
      print("Failed to writeText: '${e.message}'.");
      return "false";
    }
  }

  /// Get battery level of the android device.
  @override
  Future<int?> getBatteryLevel() async {
    try {
      final int? result = await methodChannel.invokeMethod('getBatteryLevel');
      return result;
    } on PlatformException catch (e) {
      print("Failed to get battery level: '${e.message}'.");
      return -1;
    }
  }
}
