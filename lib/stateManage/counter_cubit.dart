import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  bool Loading = false;

  get () => Loading;
  void checkLoading() => {
      if (state > 3) Loading = true 
      else Loading = false
  };
  
  void increment() => {
    emit(state + 1),
    checkLoading()
  };
  void decrement() => {
    emit(state - 1),
    checkLoading()
  };
}