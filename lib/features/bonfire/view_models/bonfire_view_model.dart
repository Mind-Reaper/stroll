import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stroll/features/bonfire/view_models/bonfire_state.dart';

final bonfireStateProvider =
    StateNotifierProvider<BonfireStateNotifier, BonfireState>((ref) {
  return BonfireStateNotifier();
});

class BonfireStateNotifier extends StateNotifier<BonfireState> {
  BonfireStateNotifier() : super(const BonfireState());

  void selectOption(int index) {
    state = state.copyWith(selectedOptionIndex: index);
  }
}
