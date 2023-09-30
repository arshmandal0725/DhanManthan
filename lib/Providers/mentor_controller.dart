import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MentorsNotifier extends StateNotifier<Widget> {
  MentorsNotifier() : super(Container());
  void mentorChange(Widget widget) {
    state = widget;
  }
}

final mentorProvider = StateNotifierProvider<MentorsNotifier, Widget>((ref) {
  return MentorsNotifier();
});
