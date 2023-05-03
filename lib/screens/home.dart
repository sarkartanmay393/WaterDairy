import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/provider.dart';
import '../widgets/button.dart';
import '../widgets/dialog.dart';

class Home extends StatefulWidget {
  static const routeName = "Layout";
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Consumer<WaterDairyDataFlow>(
          builder: (ctx, waterDairyDataFlow, _) => SizedBox(
            // height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                            strokeWidth: 8,
                            color: Colors.blue.shade400,
                            backgroundColor: Colors.grey.shade200,
                            value: waterDairyDataFlow
                                .dailyWaterIntake.intakePercentage,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${(waterDairyDataFlow.dailyWaterIntake.intakePercentage * 100).toStringAsFixed(0)}%',
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
                                  '${waterDairyDataFlow.dailyWaterIntake.goal.toStringAsFixed(0)} ',
                                  style: const TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Text(
                                  'ml',
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Text(
                              'Remain: ${waterDairyDataFlow.dailyWaterIntake.intake} ml',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.redAccent),
                        tapTargetSize: MaterialTapTargetSize.padded,
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                      ),
                      onPressed: () =>
                          waterDairyDataFlow.resetDailyWaterIntake(),
                      child: const Text(
                        'RESET INTAKE',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.padded,
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                      ),
                      onPressed: () => {
                        Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (c, _, __) => const DailyGoalDialog(),
                        ))
                      },
                      child: const Text(
                        'SET DAILY GOAL',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
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
        ),
      ),
    );
  }
}
