import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../main.dart';

class DailyGoalDialog extends HookConsumerWidget {
  const DailyGoalDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
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
            child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      autofocus: true,
                      controller: goalAmountController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.go,
                      onFieldSubmitted: (_) => setDailyGoal(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a search term',
                        labelText: "Daily Water Intake Goal (ml)",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          height: 28,
                          highlightColor: Colors.green,
                          onPressed: setDailyGoal,
                          child: const Text("SET"),
                        ),
                        MaterialButton(
                          height: 28,
                          highlightColor: Colors.red,
                          onPressed: () => {
                            Navigator.pop(context),
                          },
                          child: const Text("CANCEL"),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ),
      backgroundColor: Colors.white.withOpacity(0.9),
    );
  }
}
