import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManthanPointsNotifier extends StateNotifier<int> {
  ManthanPointsNotifier() : super(0);
  void manthanPointsAdd(int points) {
    state = state + points;
  }
}

final manthanPointsProvider =
    StateNotifierProvider<ManthanPointsNotifier, int>((ref) {
  return ManthanPointsNotifier();
});
