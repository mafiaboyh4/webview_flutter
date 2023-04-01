import 'dart:developer';

import 'package:cubitexample/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HookScreen extends HookWidget {
  const HookScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
     final _counter = useState(0);
     final _whenUpdate = useState(0);
    final email = useTextEditingController(text: '');
    final noRender = useRef('');

    useValueChanged(_counter.value, ((oldValue, oldResult) => {
      _whenUpdate.value += 2
      //or do any think you want
    })); // watch _conter

    final result = useMemoized(() {
      return _counter.value + _whenUpdate.value ;
    }, [_counter.value]); 

    onSubmit () {
      _counter.value ++;
      log(email.value.text.toString());
    };

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration:const InputDecoration(
                  hintText: 'enter your email'
                ),
              ),
            ),
            const SizedBox(height: 30,),
            // Text('email ${email.value}'),
            Text( 'resualt $result', style: NormalText.medium,),
            Text('${_counter.value.toString()} ${_whenUpdate.value.toString()}', style: NormalText.medium,),
            ElevatedButton(
              onPressed: ()=> onSubmit(), 
              child: const Text('Plus' , style: NormalText.medium,)
            )
          ]
        ),
      ),
    );
  }
}