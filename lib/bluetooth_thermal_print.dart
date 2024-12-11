
import 'bluetooth_thermal_print_platform_interface.dart';

class BluetoothThermalPrint {
  Future<String?> getPlatformVersion() {
    return BluetoothThermalPrintPlatform.instance.getPlatformVersion();
  }

  /// Get list of all paired bluetooth devices
  static Future<List?> get getBluetooths async {
    return BluetoothThermalPrintPlatform.instance.getBluetooths();
  }

  /// Get bluetooth device connection status
  static Future<String?> get connectionStatus async {
    return BluetoothThermalPrintPlatform.instance.connectionStatus();
  }

  /// Connect to device using [mac].
  static Future<String?> connect(String mac) async {
    return BluetoothThermalPrintPlatform.instance.connect(mac);
  }
  // disconnect to any connected device                        --> new feature
  static Future<String?> disconnect() async {
    return BluetoothThermalPrintPlatform.instance.disconnect();
  }


  ///Printes the [bytes] using bluetooth printer.
  static Future<String?> writeBytes(List<int> bytes) async {
    return BluetoothThermalPrintPlatform.instance.writeBytes(bytes);
  }

  ///Printes the [text] using bluetooth printer.
  static Future<String?> writeText(String text) async {
    return BluetoothThermalPrintPlatform.instance.writeText(text);
  }

  /// Get battery level of the android device.
  static Future<int?> get getBatteryLevel async {
    return BluetoothThermalPrintPlatform.instance.getBatteryLevel();
  }
}
