import 'package:flutter/foundation.dart' show immutable;
import 'package:riverpod/riverpod.dart';

@immutable
class OtherStateObjects {
  const OtherStateObjects({
    required this.currentTabIndex,
  });

  final int currentTabIndex;
}

class OtherStateObjectsController extends StateNotifier<OtherStateObjects> {
  OtherStateObjectsController()
      : super(const OtherStateObjects(currentTabIndex: 0));

  void setInitialObjects() {
    state = const OtherStateObjects(currentTabIndex: 0);
  }

  void changeTabIndex(int index) {
    state = OtherStateObjects(currentTabIndex: index);
  }

  void resetTabIndex() {
    state = const OtherStateObjects(currentTabIndex: 0);
  }
}
