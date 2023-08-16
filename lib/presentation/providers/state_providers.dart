import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state_providers.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() => 6;

  void increaseByOne() {
    state++;
  }
}

@riverpod
class DarkMode extends _$DarkMode {
  @override
  bool build() => false;

  void toggleDarkMode() {
    state = !state;
  }
}

@riverpod
class UserName extends _$UserName {
  @override
  String build() {
    return 'Carlos Carvajal';
  }

  void changeName(String newName) {
    state = newName;
  }
}
