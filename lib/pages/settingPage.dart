import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';


class SettingPage extends HookWidget {
  
  static const route = 'second-screen';

  @override
  Widget build(BuildContext context) {
  final _number = useState(0);
    return  SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Text('second ${_number.value}'),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: ()=> context.go('/'), child: const Text('First Page')),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: ()=> _number.value ++, child: const Text('add'))
            ],
          ),
        ),
      ),
    );
  }
}