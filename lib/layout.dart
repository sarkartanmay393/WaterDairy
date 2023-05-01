import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'main.dart';
import 'screens/history.dart';
import 'screens/home.dart';
import 'screens/profile.dart';

class Layout extends HookConsumerWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otherStateObjects = ref.watch(otherStateObjectsProvider);
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
          ref.read(otherStateObjectsProvider.notifier).changeTabIndex(value)
        },
      ),
    );
  }
}
