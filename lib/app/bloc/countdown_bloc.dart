import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'countdown_state.dart';

class CountdownBloc extends Cubit<CountdownState> {
  static final targetDate = DateTime(2026, 9, 9);
  Timer? _timer;

  CountdownBloc() : super(_getState()) {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      emit(_getState());
    });
  }

  static CountdownState _getState() {
    final now = DateTime.now();
    final duration = targetDate.difference(now);
    return CountdownState(duration: duration, isPassed: duration.isNegative);
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
