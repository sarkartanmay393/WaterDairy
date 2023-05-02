import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waterdairy/state/provider.dart';

import 'screens/history.dart';
import 'screens/home.dart';
import 'screens/profile.dart';

class Layout extends StatefulWidget {
  static const routeName = "Layout";
  const Layout({super.key});

  @override
  State<Layout> createState() {
    return _LayoutState();
  }
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    final screens = [const Home(), const History(), const Profile()];

    return Consumer<WaterDairyDataFlow>(
      builder: (ctx, waterDairyDataFlow, _) => Scaffold(
        appBar: AppBar(
          title: const Text("Water Dairy"),
        ),
        body: screens[waterDairyDataFlow.tabIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_max), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: "Stats"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          currentIndex: waterDairyDataFlow.tabIndex,
          onTap: (value) => waterDairyDataFlow.changeTabIndex(value),
        ),
      ),
    );
  }
}

Map<String, dynamic> jsonEncode(DailyWaterIntake dailyWaterIntake) {
  Map<String, dynamic> jsonForm = {};
  jsonForm["id"] = dailyWaterIntake.id;
  jsonForm["goal"] = dailyWaterIntake.goal;
  jsonForm["intake"] = dailyWaterIntake.intake;
  jsonForm["completed"] = dailyWaterIntake.completed;
  jsonForm["intakePercentage"] = dailyWaterIntake.intakePercentage;

  return jsonForm;
}

DailyWaterIntake jsonDecode(Map<dynamic, dynamic> jsonForm) {
  return DailyWaterIntake(
    id: jsonForm["id"],
    goal: jsonForm["goal"],
    intake: jsonForm["intake"],
    completed: jsonForm["completed"],
    intakePercentage: jsonForm["intakePercentage"],
  );
}
