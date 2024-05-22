- [Motivation](#Motivation)
- [Limitations](#Limitations)
- [Usage](#Usage)
  * [Pubspec](#Pubspec)
  * [Transformation of an existing bloc](#Transformation-of-an-existing-bloc)
  * [DI](#DI)
  * [Working with multiple isolates](#Working-with-multiple-isolates)
- [Demo](#Demo)

## Motivation:

The library implements the idea of moving business logic to a separate isolate. It works on top of the well-known Bloc library, without changing it, but complementing it.

The main idea of building an application using this library is to create business logic only with blocs and run all of them in a separate isolate. In this same isolate, it is assumed that most data providers, such as APIs and databases, will be created. This will significantly offload the main isolate for a responsive UI.

However, the library does not require you to do so, as it works simply as a wrapper around existing blocs. Therefore, only some of the blocs can be moved to the isolate. Inconveniences may arise in designing interactions with data sources, which will need to be maintained in both the main isolate and the bloc isolate.

Moreover, the library allows blocs to work in different isolates. Each bloc can be assigned an isolate in which it will be created.

## Limitations:

1. The library does not support working with cubits. It works only with blocs.
2. Due to the actual creation of blocs in an isolate different from the main one, in general, DI through constructor parameters for complex dependencies will cease to work. DI not based on context will need to be set up in the isolate where the blocs operate.

## Usage

### Pubspec

```yaml
dependencies:
  isolated_bloc: ^1.2.0
```

### Transformation of an existing bloc

In an existing application, to convert a bloc into a bloc running in an isolate, you only need to add three lines and change the class name of the existing bloc.

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

Since the use of isolates is not supported on the web, a simple empty wrapper around the bloc is used for the web, which does nothing by itself.

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
  IsolatedBloc.isolatesDispatcher.isolate().sendMessage(SetupDIMessageToIsolate());
}

...

class OriginalRelativesBloc extends Bloc<RelativesBlocEvent, RelativesBlocState> {
  late final _api = kIsWeb ? DI<ApiClient>() : IsolatedDI<ApiClient>();
    ...
}
```

### Working with multiple isolates

By default, all blocks operate in a single isolate. This setup does not require any additional configuration.

However, each block can be assigned an isolate in which it will operate. Isolates in the library are distinguished by names. The default isolate name is `IsolatesDispatcher.kDefaultIsolateName`. To create a new isolate, you can simply specify its name when creating a block.

```dart
class CounterBloc extends IsolatedBloc<CounterBlocEvent, CounterBlocState> {
  CounterBloc({required String isolateName})
      : super(() => _CounterBloc(), isolateName: isolateName);
}

...

BlocProvider(create: (BuildContext context) => CounterBloc(isolateName: _isolateName)),
```

Alternatively, you can explicitly obtain the isolate, for example, to configure DI (Dependency Injection) within it:

```dart
IsolatedBloc.isolatesDispatcher.isolate(isolateName: _isolateName);
```

If an isolate with this name does not yet exist, it will be created. 

When the isolate is no longer needed, it can be removed:

```dart
IsolatedBloc.isolatesDispatcher.removeIsolate(isolateName: _isolateName);
```
If the isolate name is not specified in any of these cases, the default isolate will be used. This default isolate cannot be removed.

## Demo

The example demonstrates the difference in the application's performance with the original (web) bloc and the bloc in the isolate. The example significantly and prolongedly loads the CPU, which very rarely happens in real applications, but it allows you to clearly see the decoupling of the UI performance from the business logic operations.

https://github.com/kocherovets/isolated_bloc/assets/4235844/e5064e84-a02f-45c2-8ef9-a2730f73a1da

