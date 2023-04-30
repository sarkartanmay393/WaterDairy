import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../main.dart';

class DailyGoalDialog extends HookConsumerWidget {
  const DailyGoalDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyWaterIntake = ref.watch(dailyWaterIntakeProvider);
    final otherStateObjects = ref.watch(OtherStateObjectsProvider);
    final goalAmountController = TextEditingController();

    void setDailyGoal() {
      ref
          .read(dailyWaterIntakeProvider.notifier)
          .setDailyGoal(double.parse(goalAmountController.text));
      Navigator.pop(context);
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: goalAmountController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                    labelText: "Daily Water Intake Goal (ml)",
                  ),
                  keyboardType: TextInputType.number,
                ),
                MaterialButton(onPressed: setDailyGoal, child: const Text("SET")),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white.withOpacity(
          0.85), // this is the main reason of transparency at next screen. I am ignoring rest implementation but what i have achieved is you can see.
    );
  }
}
