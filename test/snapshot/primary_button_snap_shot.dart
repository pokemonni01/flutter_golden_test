import 'package:flutter/material.dart';
import 'package:flutter_golden_test/widgets/primay_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../app_wrapper.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  const textKey = Key('text');
  const iconKey = Key('icon');

  testGoldens('Primary Button Scenario - Snapshot Test',
      (WidgetTester tester) async {
    final builder = DeviceBuilder(bgColor: Colors.white)
      ..overrideDevicesForAllScenarios(devices: [
        Device.iphone11,
        const Device(
          name: '140 x 140',
          size: Size(140, 140),
        ),
        const Device(
          name: '200 x 200',
          size: Size(200, 200),
        ),
      ])
      ..addScenario(
          widget: const PrimaryButton(),
          // This trailing comma makes auto-formatting nicer for build methods.
          name: 'Default - No Text',
          onCreate: (scenarioWidgetKey) async {
            final textFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(textKey),
            );

            final iconFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(iconKey),
            );

            expect(textFinder, findsOneWidget);
            expect(iconFinder, findsNothing);
          })
      ..addScenario(
          widget: const PrimaryButton(text: "Test Primary Button"),
          // This trailing comma makes auto-formatting nicer for build methods.
          name: 'Default - Has Text',
          onCreate: (scenarioWidgetKey) async {
            final textFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(textKey),
            );

            final iconFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(iconKey),
            );

            expect(textFinder, findsOneWidget);
            expect(iconFinder, findsNothing);
          })
      ..addScenario(
          widget: const PrimaryButton(
            text: "Click Me",
            icon: Icons.add,
          ),
          name: 'Has Icon',
          onCreate: (scenarioWidgetKey) async {
            final textFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(textKey),
            );

            final iconFinder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byKey(iconKey),
            );

            expect(textFinder, findsOneWidget);
            expect(iconFinder, findsOneWidget);
          });

    await tester.pumpDeviceBuilder(builder, wrapper: getAppWrapper());
    await screenMatchesGolden(tester, 'primary_button');
  });
}
