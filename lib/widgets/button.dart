import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waterdairy/main.dart';

class GridButton extends HookConsumerWidget {
  const GridButton({super.key, required this.intakeML});
  final int intakeML;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialButton(
      color: Colors.green.shade400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      elevation: 0,
      focusElevation: 0,
      onPressed: () {
        ref.read(dailyWaterIntakeProvider.notifier).addIntake(double.parse(intakeML.toString()));
      },
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
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
