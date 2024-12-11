import 'package:flutter_test/flutter_test.dart';
import 'package:bluetooth_thermal_print/bluetooth_thermal_print.dart';
import 'package:bluetooth_thermal_print/bluetooth_thermal_print_platform_interface.dart';
import 'package:bluetooth_thermal_print/bluetooth_thermal_print_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBluetoothThermalPrintPlatform
    with MockPlatformInterfaceMixin
    implements BluetoothThermalPrintPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> connect(String mac) {
    // TODO: implement connect
    throw UnimplementedError();
  }

  @override
  Future<String?> connectionStatus() {
    // TODO: implement connectionStatus
    throw UnimplementedError();
  }

  @override
  Future<String?> disconnect() {
    // TODO: implement disconnect
    throw UnimplementedError();
  }

  @override
  Future<int?> getBatteryLevel() {
    // TODO: implement getBatteryLevel
    throw UnimplementedError();
  }

  @override
  Future<List?> getBluetooths() {
    // TODO: implement getBluetooths
    throw UnimplementedError();
  }

  @override
  Future<String?> writeBytes(List<int> bytes) {
    // TODO: implement writeBytes
    throw UnimplementedError();
  }

  @override
  Future<String?> writeText(String text) {
    // TODO: implement writeText
    throw UnimplementedError();
  }
}

void main() {
  final BluetoothThermalPrintPlatform initialPlatform = BluetoothThermalPrintPlatform.instance;

  test('$MethodChannelBluetoothThermalPrint is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBluetoothThermalPrint>());
  });

  test('getPlatformVersion', () async {
    BluetoothThermalPrint bluetoothThermalPrintPlugin = BluetoothThermalPrint();
    MockBluetoothThermalPrintPlatform fakePlatform = MockBluetoothThermalPrintPlatform();
    BluetoothThermalPrintPlatform.instance = fakePlatform;

    expect(await bluetoothThermalPrintPlugin.getPlatformVersion(), '42');
  });
}
