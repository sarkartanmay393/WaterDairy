import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waterdairy/screens/history.dart';
import 'package:waterdairy/screens/home.dart';
import 'package:waterdairy/screens/profile.dart';

import 'main.dart';

class Layout extends HookConsumerWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otherStateObjects = ref.watch(OtherStateObjectsProvider);
    final screens = [const Home(), const History(), const Profile()];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Water Dairy"),
      ),
      body: screens[otherStateObjects.currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_max), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Stats"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: otherStateObjects.currentTabIndex,
        onTap: (value) => {
          ref.read(OtherStateObjectsProvider.notifier).changeTabIndex(value)
        },
      ),
    );
  }
}
