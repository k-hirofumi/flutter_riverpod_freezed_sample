import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends ConsumerWidget {
  WebViewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Simple Example')),
      body: SafeArea(
        child: WebViewWidget(
          controller: WebViewController()
            ..loadRequest(Uri.parse("https://www.google.com/")),
        ),
      ),
    );
  }
}
