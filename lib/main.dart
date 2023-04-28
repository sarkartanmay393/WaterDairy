import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'utils/daily_water_intake.dart';

final addDailyWaterIntakeKey = UniqueKey();
final completedFilterKey = UniqueKey();

final dailyWaterIntakeProvider =
    StateNotifierProvider<DailyWaterIntakeController, DailyWaterIntake>((ref) {
  return DailyWaterIntakeController();
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
        primarySwatch: Colors.green,
      ),
      home: const Home(),
    );
  }
}

class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyWaterIntake = ref.watch(dailyWaterIntakeProvider);
    final goalAmountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Water Dairy"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (dailyWaterIntake.goal < 0.1)
              AlertDialog(
                title: const Text("Set Goal"),
                content: TextField(
                  controller: goalAmountController,
                  decoration: const InputDecoration(
                    labelText: "Daily Water Intake Goal (ml)",
                  ),
                  keyboardType: TextInputType.number,
                ),
                actions: [
                  TextButton(
                      onPressed: () => {
                            if (goalAmountController.text.isNotEmpty)
                              {
                                ref
                                    .read(dailyWaterIntakeProvider.notifier)
                                    .setInitialGoal(
                                        double.parse(goalAmountController.text))
                              }
                          },
                      child: const Text("Set")),
                ],
              ),
            Text('Goal: ${dailyWaterIntake.goal}'),
            Text('Intake: ${dailyWaterIntake.intake}'),
            if (!dailyWaterIntake.completed)
              TextButton(
                onPressed: () => {
                  ref.read(dailyWaterIntakeProvider.notifier).addIntake(50.0),
                },
                child: const Text('Add Intake (50ml)'),
              ),
            if (dailyWaterIntake.completed)
              TextButton(
                onPressed: () => {
                  ref.read(dailyWaterIntakeProvider.notifier).resetIntake(),
                },
                child: const Text('Reset Intake'),
              ),
          ],
        ),
      ),
    );
  }
}
