import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:waterdairy/state/provider.dart';

class GridButton extends StatelessWidget {
  const GridButton({super.key, required this.intakeML});
  final int intakeML;

  @override
  Widget build(BuildContext context) {
    return Consumer<WaterDairyDataFlow>(
      builder: (ctx, waterDairyDataFlow, _) => MaterialButton(
        color: Colors.green.shade400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 0,
        focusElevation: 0,
        onPressed: () =>
            waterDairyDataFlow.addIntake(double.parse(intakeML.toString())),
        child: SizedBox(
          width: 135,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const FaIcon(FontAwesomeIcons.glassWaterDroplet),
              const SizedBox(
                width: 8,
              ),
              Text(
                '$intakeML ml',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
