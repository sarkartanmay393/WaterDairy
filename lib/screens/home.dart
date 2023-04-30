import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../main.dart';
import '../widgets/button.dart';

class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyWaterIntake = ref.watch(dailyWaterIntakeProvider);
    final goalAmountController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // if (dailyWaterIntake.goal < -0.1)
            //   AlertDialog(
            //     title: const Text("Set Goal"),
            //     content: TextField(
            //       controller: goalAmountController,
            //       decoration: const InputDecoration(
            //         labelText: "Daily Water Intake Goal (ml)",
            //       ),
            //       keyboardType: TextInputType.number,
            //     ),
            //     actions: [
            //       TextButton(
            //           onPressed: () => {
            //                 if (goalAmountController.text.isNotEmpty)
            //                   {
            //                     ref
            //                         .read(dailyWaterIntakeProvider.notifier)
            //                         .setInitialGoal(
            //                             double.parse(goalAmountController.text))
            //                   }
            //               },
            //           child: const Text("Set")),
            //     ],
            //   ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 28, 0, 8),
              child: SizedBox(
                height: 300,
                width: 300,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: CircularProgressIndicator(
                        strokeWidth: 6,
                        backgroundColor: Colors.grey.shade200,
                        value: dailyWaterIntake.intakePercentage,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${(dailyWaterIntake.intakePercentage * 100).toStringAsFixed(0)}%',
                          style: const TextStyle(
                              fontSize: 42, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${dailyWaterIntake.goal} ',
                              style: const TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.w400),
                            ),
                            const Text(
                              'ml',
                              style: TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Text(
                          'Remain: ${dailyWaterIntake.intake} ml',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            TextButton(
              onPressed: dailyWaterIntake.completed ? () => {
                ref.read(dailyWaterIntakeProvider.notifier).resetIntake(),
              } : null,
              child: const Text('Reset Intake'),
            ),

            Container(
              margin: const EdgeInsets.all(16.0),
              height: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      GridButton(intakeML: 50),
                      SizedBox(width: 12),
                      GridButton(intakeML: 100),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      GridButton(intakeML: 150),
                      SizedBox(width: 12),
                      GridButton(intakeML: 200),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
