import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_class/main.dart';

// Provider Rivepod
// There are 2 ways of reading a widget in riverpod {"1" :" ConsumerWidgets"}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer(
        builder: ( context, ref, child) {
          final name = ref.watch(nameProvider);
          return Center(
            child: Text('Welcome $name you will be a successful man'),
          );
        },
      ),
    );
  }
}

/// 

