import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  String? name;
  String? age;
  User({
    required this.age,
    required this.name,
  });
}

class TestNotifier extends StateNotifier<User> {
  TestNotifier(super.state);

  void updateUser(User newUser) {
    state = ;
  }
}
