import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stroll/features/home/view_models/home_state.dart';

final homeStateProvider =
    StateNotifierProvider<HomeStateNotifier, HomeState>((ref) {
  return HomeStateNotifier();
});

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier() : super(const HomeState());

  void changePage(int index) {
    state = state.copyWith(pageIndex: index);
  }
}
