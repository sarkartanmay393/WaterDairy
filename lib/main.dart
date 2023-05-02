import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:waterdairy/screens/history.dart';
import 'package:waterdairy/screens/profile.dart';
import 'package:provider/provider.dart';

import 'layout.dart';
import 'screens/home.dart';
import 'state/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('water_dairy');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: WaterDairyDataFlow(),
      child: MaterialApp(
        // showPerformanceOverlay: true,
        debugShowCheckedModeBanner: false,
        title: "Water Dairy",
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.green,
        ),
        home: const Layout(),
        routes: {
          Home.routeName: (context) => const Home(),
          History.routeName: (context) => const History(),
          Profile.routeName: (context) => const Profile(),
        },
      ),
    );
  }
}
