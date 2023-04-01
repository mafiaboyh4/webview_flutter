import 'dart:convert';
import 'dart:developer';

import 'package:cubitexample/core/constants.dart';
import 'package:cubitexample/models/coins_model.dart';
import 'package:cubitexample/models/response_model.dart';
import 'package:cubitexample/service/dio_client.dart';
import 'package:cubitexample/service/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart' show rootBundle;

class CoinsCubit extends Cubit<List<String>> {
  CoinsCubit() : super([]);

  bool Loading = true;
  List coins = [];

  void getLists() async {
     //example 1 
  //   try {
  //     Loading = true;
  //   var response = (await Dio().get('${Constants.apiBaseUrl}market/spot/markets')).data;
  //   Loading = false;
  //   coins = [...(response['data'] as List)];
  //   print(coins.toString());
  //   emit(state);
  // } catch (e) {
  //   print(e);
  // }

  // example 2 

    Loading = true;
    coins.clear();
    var response = await DioService().getMethod('market/spot/markets');
    print((response.data['data'] as List).toString());
    coins.addAll(response.data['data'] as List);
    log('coins ${coins.toString()}');
    Loading = false;
    emit(state);

  }

  Future<String> getJson() {
    return rootBundle.loadString('assets/data.json');
  }
}
