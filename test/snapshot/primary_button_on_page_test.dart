import 'package:flutter/material.dart';
import 'package:flutter_golden_test/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../app_wrapper.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });


  testGoldens('Primary Button Scenario - Snapshot Test',
          (WidgetTester tester) async {
        final builder = DeviceBuilder(bgColor: Colors.white)
          ..overrideDevicesForAllScenarios(devices: [
            Device.phone,
            Device.iphone11,
            Device.tabletPortrait,
            Device.tabletLandscape
          ])
          ..addScenario(
              widget: const MyHomePage('Flutter Demo Home Page'),
              name: 'Primary Button On Page',
              onCreate: (scenarioWidgetKey) async {

              });

        await tester.pumpDeviceBuilder(builder, wrapper: getAppWrapper());
        await screenMatchesGolden(tester, 'primary_button_on_page');
      });
}