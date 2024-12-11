import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bluetooth_thermal_print_method_channel.dart';

abstract class BluetoothThermalPrintPlatform extends PlatformInterface {
  /// Constructs a BluetoothThermalPrintPlatform.
  BluetoothThermalPrintPlatform() : super(token: _token);

  static final Object _token = Object();

  static BluetoothThermalPrintPlatform _instance = MethodChannelBluetoothThermalPrint();

  /// The default instance of [BluetoothThermalPrintPlatform] to use.
  ///
  /// Defaults to [MethodChannelBluetoothThermalPrint].
  static BluetoothThermalPrintPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BluetoothThermalPrintPlatform] when
  /// they register themselves.
  static set instance(BluetoothThermalPrintPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// Get list of all paired bluetooth devices
  Future<List?> getBluetooths() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// Get bluetooth device connection status
  Future<String?> connectionStatus() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// Connect to device using [mac].
  Future<String?> connect(String mac) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
  // disconnect to any connected device                        --> new feature
  Future<String?> disconnect() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }


  ///Printes the [bytes] using bluetooth printer.
  Future<String?> writeBytes(List<int> bytes) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///Printes the [text] using bluetooth printer.
  Future<String?> writeText(String text) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// Get battery level of the android device.
  Future<int?> getBatteryLevel() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
