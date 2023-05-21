import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class UserParams {
  final String name;
  final String email;

  UserParams({
    required this.name,
    required this.email,
  });

  UserParams copyWith({
    String? name,
    String? email,
  }) {
    return UserParams(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'email': email});
  
    return result;
  }

  factory UserParams.fromMap(Map<String, dynamic> map) {
    return UserParams(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserParams.fromJson(String source) => UserParams.fromMap(json.decode(source));

  @override
  String toString() => 'UserParams(name: $name, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserParams &&
      other.name == name &&
      other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}

 final userRepositoryProvider = Provider((ref) => UserRepository());// this is done inorder to save initialzing UerRepository everywhere in our code.
class UserRepository{
  Future<UserParams> fetchUserData(){
  const url = 'https://jsonplaceholder.typicode.com/users/1';
  return http.get(Uri.parse(url)).then(
        (value) => UserParams.fromJson(value.body),
      );
  }

}