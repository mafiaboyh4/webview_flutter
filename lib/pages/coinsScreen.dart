import 'package:cubitexample/stateManage/coins_cubit.dart';
import 'package:cubitexample/styles/text.dart';
import 'package:cubitexample/widgets/global/circle_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinScreen extends StatefulWidget {

  @override
  State createState() => _CoinsScreenState();
}


class _CoinsScreenState extends State {
  CoinsCubit get _cubit => BlocProvider.of<CoinsCubit>(context);
 ScrollController _controller = new  ScrollController();
  @override
  void initState() {
    super.initState();
    _cubit.getLists();
  }
  
  @override
  Widget build(BuildContext context) {
    final coins = context.watch<CoinsCubit>().coins;
    final loading = context.watch<CoinsCubit>().Loading;

    return Scaffold(
      body: SafeArea(
        child: loading ? circleLoading() : 
        Column(
          children: [
            Text('list ${coins.length}' , style: NormalText.textStyle,),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                controller: _controller,
                itemCount: coins.length,
                itemBuilder: (context, index) {
                  return _CoinItem(
                    text: coins[index].toString() ?? '',
                    onTap: () =>
                        print(coins[index].toString()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _CoinItem({required Function onTap, required String text}) {
    return Row(
      children: [
        Text(text)
      ],
    );
  }
}



