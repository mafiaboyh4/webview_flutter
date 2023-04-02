import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final path = '';
    RefreshController _refreshController = RefreshController(initialRefresh: false);
    
   final controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {
     
      },
      onPageFinished: (String url) {
        print('path ${url}');
      },
      
      onWebResourceError: (WebResourceError error) {},
    ),
  )
  ..loadRequest(Uri.parse('https://testclient.sekebit.com'));

  void _onRefresh() async{
    controller.reload();
    await Future.delayed(Duration(milliseconds: 2000));
    _refreshController.refreshCompleted();
  }


  @override
  void initState() {
     super.initState();
     controller.enableZoom(false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SmartRefresher(
            enablePullDown: true,
            enablePullUp: false,
            onRefresh: _onRefresh,
            controller: _refreshController,
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: WebViewWidget(controller: controller ),
            )
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.go('/setting');
            },
            backgroundColor: const Color(0xFF11593a),
            child: const Icon(Icons.settings),
          ),
        ),
      );
  }
}
