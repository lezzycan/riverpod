import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_class/main.dart';

class StateNotifierProviderPage extends ConsumerWidget {
  const StateNotifierProviderPage({super.key});

  void onSubmitName(String value, WidgetRef ref) {
    ref.read(userStateNotifierProvider.notifier).updateName(value);
  }

  void onSubmitAge(WidgetRef ref, String value) {
    ref.read(userStateNotifierProvider.notifier).updateAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStateNotifierProvider);
    final userSelect =
        ref.watch(userStateNotifierProvider.select((value) => value.name),);// used for ingle entity
    return Scaffold(
      appBar: AppBar(
        title: Text(userSelect),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) => onSubmitName(value, ref),
          ),
          TextField(
            onSubmitted: (value) => onSubmitAge(ref, value),
          ),
          Text(user.age.toString()),
        ],
      ),
    );
  }
}
