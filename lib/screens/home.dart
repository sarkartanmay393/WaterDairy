import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../main.dart';

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
            SizedBox(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${dailyWaterIntake.goal} ',
                            style: const TextStyle(
                                fontSize: 36, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'ml',
                            style: TextStyle(
                                fontSize: 36, fontWeight: FontWeight.w300),
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

            // SimpleCircularProgressBar(
            //   size: 300,
            //   progressColors: const [Colors.green],
            //   backColor: Colors.grey.shade200,
            //   mergeMode: true,
            //   valueNotifier:
            //       ValueNotifier<double>(dailyWaterIntake.intakePercentage),
            // ),

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
