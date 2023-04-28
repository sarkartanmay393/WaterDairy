import 'package:flutter/foundation.dart' show immutable;
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

/// A read-only description of a todo-item
@immutable
class DailyWaterIntake {
  const DailyWaterIntake({
    required this.id,
    required this.intake,
    this.goal = 0.0,
    this.completed = false,
  });

  final String id;
  final double goal;
  final double intake;
  final bool completed;

  @override
  String toString() {
    return 'Daily Intake(Goal: $goal, intake: $intake, completed: $completed)';
  }
}

class DailyWaterIntakeController extends StateNotifier<DailyWaterIntake> {
  DailyWaterIntakeController()
      : super(DailyWaterIntake(id: _uuid.v4(), intake: 0));

  void setInitialGoal(double goal) {
    state = DailyWaterIntake(
      id: _uuid.v4(),
      goal: goal,
      intake: 0.0,
      completed: false,
    );
  }

  void addIntake(double intakeAmount) {
    double currentIntake = state.intake + intakeAmount;
    state = DailyWaterIntake(
      id: _uuid.v4(),
      goal: state.goal,
      intake: currentIntake,
      completed: currentIntake >= state.goal ? true : state.completed,
    );
  }

  void resetIntake() {
    state = DailyWaterIntake(
      id: _uuid.v4(),
      goal: 0.0,
      intake: 0.0,
      completed: false,
    );
  }
}
