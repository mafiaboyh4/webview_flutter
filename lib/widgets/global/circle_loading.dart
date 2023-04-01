import 'package:cubitexample/styles/text.dart';
import 'package:flutter/material.dart';

Widget circleLoading({
  double? size,
  String? text
}) {
  return Material(
    color: Colors.transparent,
    child: Center(
      child: SizedBox(
        width: size,
        height: size,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const CircularProgressIndicator(
            color: Colors.black87,
            ),
            SizedBox(height: 20,),
            Text( text ?? 'در حال بارگذاری' , style: NormalText.medium,)
          ] 
        ),
      ),
    ),
  );
}
