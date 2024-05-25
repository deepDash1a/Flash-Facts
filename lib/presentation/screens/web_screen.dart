import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  WebViewScreen({super.key, required this.title, required this.url});

  String? title;
  String? url;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18.00,
            color: AppColors.blueDegree1,
          ),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
        title: Text(
          'More about ${widget.title!}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 20.00,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: WebView(
        initialUrl: widget.url,
      ),
    );
  }
}
