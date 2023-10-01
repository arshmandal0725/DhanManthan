import 'package:flutter_riverpod/flutter_riverpod.dart';

class MentorPointsNotifier extends StateNotifier<int> {
  MentorPointsNotifier() : super(0);
  void mentorPointsAdd(int points) {
    state = state + points;
    
  }
}

final mentorPointsProvider =
    StateNotifierProvider<MentorPointsNotifier, int>((ref) {
  return MentorPointsNotifier();
});
