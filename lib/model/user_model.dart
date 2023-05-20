import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserModel {
  final String name;
  final int age;

  UserModel({required this.name, required this.age});

  UserModel copyWith({
    String? name,
    int? age,
  }) {
    return UserModel(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}

class UserNotifier extends StateNotifier<UserModel> {
  // UserNotifier(super.state);
  // we can have
  UserNotifier()
      : super(
          UserModel(name: '', age: 0),
        );//{updateName('lekan');} this is when i want an initial name on start like initState

  void updateName(String newName) {
    state = state.copyWith(name: newName);
  }

  void updateAge(int newAge) {
    state = state.copyWith(age: newAge);
  }
}
