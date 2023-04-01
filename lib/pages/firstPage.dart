


import 'package:cubitexample/stateManage/counter_cubit.dart';
import 'package:cubitexample/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class CubitCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
            child: BlocProvider(
            create: (_) => CounterCubit(),
            child: FirstPage(),
          ),
          ),
    );
  }
}

class FirstPage extends StatelessWidget {

  const FirstPage({super.key});
  @override
  Widget build(BuildContext context) {
    final counterText = context.watch<CounterCubit>().state;
    final loading = context.watch<CounterCubit>().Loading;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: < Widget > [
          ElevatedButton (
            onPressed: (() => {
            context.go('/second')
          }) ,child: Text('Go Secound' ),),
          Expanded(child: BlocBuilder < CounterCubit, int > (
            builder: (context, count) => Center(
              child: Text('${loading ? 'loading .... ' : count}' , style: NormalText.textStyle,)),
          ),),
          Text('watch ${loading ? loading : counterText}'),
          FloatingActionButton(
            child: const Icon(Icons.add),
              onPressed: () => context.read < CounterCubit > ().increment(),
          ),
          const SizedBox(height: 4),
            FloatingActionButton(
              child: const Icon(Icons.remove),
                onPressed: () => context.read < CounterCubit > ().decrement(),
            ),
        ],
      ),

    );
  }
}