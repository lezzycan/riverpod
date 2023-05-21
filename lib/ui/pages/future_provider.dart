import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_class/main.dart';

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(fetchUserProvider).when(data: (data) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Text(data.name),)
      );
    }, error: (error, stackTrace) {
      return  Center(
        child: Text(error.toString()),
      );
    }, loading: () {
      return const CircularProgressIndicator(
        color: Colors.red,
      );
    });
  }
}

/// 

