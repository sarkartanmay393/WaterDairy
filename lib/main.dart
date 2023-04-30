import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers/daily_water_intake.dart';
import 'providers/other_state_objects.dart';
import 'layout.dart';

final addDailyWaterIntakeKey = UniqueKey();
final completedFilterKey = UniqueKey();

final dailyWaterIntakeProvider =
    StateNotifierProvider<DailyWaterIntakeController, DailyWaterIntake>((ref) {
  return DailyWaterIntakeController();
});

final OtherStateObjectsProvider =
    StateNotifierProvider<OtherStateObjectsController, OtherStateObjects>(
        (ref) {
  return OtherStateObjectsController();
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // showPerformanceOverlay: true,
      debugShowCheckedModeBanner: false,
      title: "Water Dairy",
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
      ),
      home: const Layout(),
    );
  }
}
