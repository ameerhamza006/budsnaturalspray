import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({super.key});

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {

  late final WebViewController _controller;

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
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller,);
  }
}
