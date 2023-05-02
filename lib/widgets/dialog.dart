import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waterdairy/state/provider.dart';

class DailyGoalDialog extends StatelessWidget {
  const DailyGoalDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final goalAmountController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Consumer<WaterDairyDataFlow>(
          builder: (ctx, waterDairyDataFlow, _) => Center(
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
                        onFieldSubmitted: (_) => {
                          waterDairyDataFlow.addDailyGoal(
                              double.parse(goalAmountController.text)),
                          Navigator.pop(context),
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter a water intake ammout',
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
                            onPressed: () => {
                              waterDairyDataFlow.addDailyGoal(
                                  double.parse(goalAmountController.text)),
                              Navigator.pop(context),
                            },
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
      ),
      backgroundColor: Colors.white.withOpacity(0.9),
    );
  }
}
