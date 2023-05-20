import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_class/model/user_model.dart';
import 'package:riverpod_class/ui/home.dart';
import 'package:riverpod_class/ui/pages/state_notifier_provider.dart';
import 'package:riverpod_class/ui/pages/state_provider.dart';

// Provider *** Riverpod : value can't be changed
// StateProvider: update value from outside
//StateNotifierProvider
final nameProvider = Provider<String>((ref) => 'Waheed');
final nameStateProvider = StateProvider<String?>((ref) => null);
// final userStateNotifierProvider = StateNotifierProvider<UserNotifier, UserModel>(
//   (
//     ref,
//   ) =>
//       UserNotifier(
//     UserModel(name: '', age: 0),
//   ),
// );
final userStateNotifierProvider =
    StateNotifierProvider<UserNotifier, UserModel>((ref) => UserNotifier());
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod',
      theme: FlexThemeData.light(),
      darkTheme: FlexThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const StateNotifierProviderPage(),
    );
  }
}
