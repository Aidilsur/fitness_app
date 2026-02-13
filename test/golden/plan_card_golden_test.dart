import 'package:fitness_app/app/design/design_tokens.dart';
import 'package:fitness_app/app/features/home/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../_config.dart';

void main() {
  setUpAll(goldenSetup);

  testGoldens('PlanCard variants', (tester) async {
    await mockNetworkImages(() async {
      tester.view.devicePixelRatio = 3.0;
      addTearDown(() {
        tester.view.resetDevicePixelRatio();
      });

      final builder = GoldenBuilder.column()
        ..addScenario(
          'Your plan section',
          SizedBox(
            height: 200,
            child: Row(
              children: [
                Expanded(
                  child: PlanCard(
                    color: DT.cardYellow,
                    difficulty: 'Medium',
                    title: 'Yoga Group',
                    date: '25 Nov',
                    time: '14:00-15:00',
                    room: 'AS room',
                    trainer: 'Tiffany Way',
                    trainerImage:
                        'https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    isLeft: true,
                    onTap: () => {},
                  ),
                ),
                SizedBox(width: DT.s4),
                Expanded(
                  child: PlanCard(
                    color: DT.cardBlue,
                    difficulty: 'Light',
                    title: 'Balance',
                    date: '20 Nov',
                    time: '18:00-19:30',
                    room: 'A2 room',
                    trainer: 'Tiffany Way',
                    trainerImage:
                        'https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    isLeft: false,
                    onTap: () => {},
                  ),
                ),
              ],
            ),
          ),
        );

      await tester.pumpWidgetBuilder(
        builder.build(),
        wrapper: materialAppWrapper(theme: ThemeData(useMaterial3: true)),
        surfaceSize: const Size(560, 400),
      );

      await screenMatchesGolden(tester, 'plan_card_variants');
    });
  });
}
