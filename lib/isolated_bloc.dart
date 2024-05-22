export 'isolated_bloc_base.dart';

import 'isolated_bloc_web.dart' if (dart.library.io) 'isolated_bloc_io.dart';

typedef IsolatedBloc<Event, State> = InnerIsolatedBloc<Event, State>;

typedef BlocMainIsolateLogic = InnerBlocMainIsolateLogic;

typedef IsolatesDispatcher = InnerIsolatesDispatcher;
