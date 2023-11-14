import 'package:ble_example/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const appTitle = "Flutter demo";
const counterPageTitle = "Counter";
const incrementText = "Increment";
const decrementText = "Decrement";
const counterMessage = "Current value for count";

void main() {
  runApp(const BleApp());
}

class BleApp extends StatelessWidget {
  const BleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CounterCubit(),
          ),
        ],
        child: const CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, int>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text(counterPageTitle),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  counterMessage,
                ),
                Text(
                  context.watch<CounterCubit>().state.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  children: [
                    TextButton(
                      child: const Text(incrementText),
                      onPressed: () => context.read<CounterCubit>().increment(),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      child: const Text(decrementText),
                      onPressed: () => context.read<CounterCubit>().decrement(),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
