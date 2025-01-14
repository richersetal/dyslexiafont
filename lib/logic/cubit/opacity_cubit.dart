import 'package:bloc/bloc.dart';

class OpacityCubit extends Cubit<int> {
  /// Standard opacity is 100 (complete visable)
  OpacityCubit() : super(100);

  /// change opacity (0 tot 100)
  void changeOpacity(int value) {
    if (value < 0) {
      emit(0); // min 0 (complete transparant)
    } else if (value > 100) {
      emit(100); // max 100 (all visible)
    } else {
      emit(value); // within range
    }
  }

  /// increase opacity
  void incrementOpacity() {
    if (state < 100) {
      emit(state + 1);
    }
  }

  /// decrease opacity
  void decrementOpacity() {
    if (state > 0) {
      emit(state - 1);
    }
  }

  /// Reset opacity
  void resetOpacity() {
    emit(100);
  }
}
