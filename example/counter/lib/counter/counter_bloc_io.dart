import 'package:isolated_bloc/isolated_bloc.dart';

import 'counter_bloc.dart';

class IsolatedCounterBloc extends IsolatedBloc<CounterBlocEvent, CounterBlocState> {
  IsolatedCounterBloc() : super(() => OriginalCounterBloc());
}

typedef CounterBloc = IsolatedCounterBloc;
