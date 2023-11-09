import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({super.key});

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {

  late final WebViewController _controller;

  arrowback() async{
    if(await _controller.canGoBack()){
      await _controller.canGoBack();
    }
  }
  arrowForword() async{
    if(await _controller.canGoForward()){
      await _controller.canGoForward();
    }
  }

  @override
  void initState(){
    super.initState();


  final WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(Colors.white)

  ..loadRequest(Uri.parse('https://budsnaturalspray.com/mobile-home/'));
  _controller = controller;
  }


  @override
  Widget build(BuildContext context) => WillPopScope(
    child:  WebViewWidget(controller: _controller,),
    onWillPop: () async {
      if(await _controller.canGoBack()){
         await _controller.canGoBack();
        return false;
      }else{
        return true;
      }

    },
  );
  //Widget build(BuildContext context) {

    //return WebViewWidget(controller: _controller,);

  //}
}
