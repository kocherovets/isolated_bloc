The library implements the idea of moving business logic to a separate isolate. It works on top of the well-known Bloc library, without changing it, but complementing it.

The main idea of building an application using this library is to create business logic only with blocs and run all of them in a separate isolate. In this same isolate, it is assumed that most data providers, such as APIs and databases, will be created. This will significantly offload the main isolate for a responsive UI.

However, the library does not require you to do so, as it works simply as a wrapper around existing blocs. Therefore, only some of the blocs can be moved to the isolate. Inconveniences may arise in designing interactions with data sources, which will need to be maintained in both the main isolate and the bloc isolate.

The library is very small, so you can easily determine if it suits your needs.

## Limitations:

1. The library does not support working with cubits. It works only with blocs.
2. Due to the actual creation of blocs in an isolate different from the main one, in general, DI through constructor parameters for complex dependencies will cease to work. DI not based on context will need to be set up in the isolate where the blocs operate.
3. Since isolates are not supported on the web, if a bloc is intended to be used there, additional configuration is needed to choose between a regular bloc or a bloc in an isolate depending on the platform.

## Usage

### Pubspec

```yaml
dependencies:
  isolated_bloc: ^1.0.0
```

### Init

To initialize an isolate that works with blocs, you need to add one line. It is assumed that this isolate will exist for the entire duration of the application's runtime.

```dart
import 'package:isolated_bloc/isolated_bloc.dart';

void main() async {
  await IsolatedBloc.blocMainIsolateLogic.run();

  runApp(const MyApp());
}
```

### Without web support

If you don't need to support the web, in an existing application, to convert a bloc into a bloc running in an isolate, you only need to add three lines and change the class name of the existing bloc.

from

```dart

class CounterBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
    ...
}
```

to

```dart
import 'package:isolated_bloc/isolated_bloc.dart';

class CounterBloc extends IsolatedBloc<CounterBlocEvent, CounterBlocState> {
  CounterBloc() : super(() => _CounterBloc());
}

class _CounterBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
    ...
}
```

### With web support

If you need to support the web, due to the lack of conditional compilation, the best way I found to choose the appropriate bloc based on the platform is to separate the type selection into different files and use conditional imports. If you know a more concise way, please share.

from

```dart
//counter_bloc.dart

class CounterBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
    ...
}
```

to

```dart
//counter_bloc.dart

class OriginalCounterBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
    ...
}
```

```dart
//counter_bloc_web.dart

import 'counter_bloc.dart';

typedef CounterBloc = OriginalCounterBloc;
```

```dart
//counter_bloc_io.dart

import 'package:isolated_bloc/isolated_bloc.dart';

import 'counter_bloc.dart';

class IsolatedCounterBloc extends IsolatedBloc<CounterBlocEvent, CounterBlocState> {
  IsolatedCounterBloc() : super(() => OriginalCounterBloc());
}

typedef CounterBloc = IsolatedCounterBloc;
```

```dart
//counter_page.dart

import 'counter_bloc_web.dart' if (dart.library.io) 'counter_bloc_io.dart';
```

### DI

To simplify the transfer of DI into the isolate, a special message is provided in the library. Below is an example of one of the ways to configure GetIt.

```dart

final DI = GetIt.instance;
final IsolatedDI = GetIt.instance;

...

class SetupDIMessageToIsolate extends CallableMessageToIsolate {
  void call() {
    final dio = Dio();
    IsolatedDI.registerSingleton(dio);

    final api = ApiClient(dio);
    IsolatedDI.registerSingleton(api);
  }
}

...

if (kIsWeb) {
  final dio = Dio();
  DI.registerSingleton(dio);

  final api = ApiClient(dio);
  DI.registerSingleton(api);

} else {
  await IsolatedBloc.blocMainIsolateLogic.run();
  IsolatedBloc.blocMainIsolateLogic.sendMessage(SetupDIMessageToIsolate());
}

...

class OriginalRelativesBloc extends Bloc<RelativesBlocEvent, RelativesBlocState> {
  late final _api = kIsWeb ? DI<ApiClient>() : IsolatedDI<ApiClient>();
    ...
}
```

### Demo

The example demonstrates the difference in the application's performance with the original (web) bloc and the bloc in the isolate. The example significantly and prolongedly loads the CPU, which very rarely happens in real applications, but it allows you to clearly see the decoupling of the UI performance from the business logic operations.

https://github.com/kocherovets/isolated_bloc/assets/4235844/e5064e84-a02f-45c2-8ef9-a2730f73a1da

