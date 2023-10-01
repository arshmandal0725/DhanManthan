import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MentorsNotifier extends StateNotifier<Widget> {
  MentorsNotifier() : super(Container());
  void mentorChange(Widget widget) {
    state = widget;
  }
}

class IsMentorsNotifier extends StateNotifier<bool> {
  IsMentorsNotifier() : super(false);
  void ismentor(bool tell) {
    state = tell;
  }
}

final mentorProvider = StateNotifierProvider<MentorsNotifier, Widget>((ref) {
  return MentorsNotifier();
});

final ismentorProvider = StateNotifierProvider<IsMentorsNotifier, bool>((ref) {
  return IsMentorsNotifier();
});
