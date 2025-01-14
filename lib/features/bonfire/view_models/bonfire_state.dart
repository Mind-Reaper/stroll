

import 'package:freezed_annotation/freezed_annotation.dart';

part 'bonfire_state.freezed.dart';

@freezed
class BonfireState with _$BonfireState {
  const factory BonfireState({
     int? selectedOptionIndex,
  }) = _BonfireState;
}