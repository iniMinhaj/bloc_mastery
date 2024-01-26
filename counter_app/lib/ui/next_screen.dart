import 'package:counter_app/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_event.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, state) => Center(
          child: Text(state.toString(), style: const TextStyle(fontSize: 24)),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterIncrementEvent());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterDecrementEvent());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.minimize),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            tooltip: 'Increment',
            child: const Text("Back"),
          ),
        ],
      ),
    );
  }
}
