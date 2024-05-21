import 'package:bloc/bloc.dart';

class MessageToIsolate {}

class MessageToMain {}

typedef CreateBloc<S, E> = Bloc<S, E> Function();
