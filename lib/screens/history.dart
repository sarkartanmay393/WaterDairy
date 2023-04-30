import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class History extends HookConsumerWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(child: Text("Coming Soon!")),
    );
  }
}
