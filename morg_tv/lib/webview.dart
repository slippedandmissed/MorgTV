import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebRendererView extends StatefulWidget {
  final String url;
  const WebRendererView({@PathParam() required this.url, super.key});

  @override
  State<WebRendererView> createState() => _WebRendererViewState();
}

class _WebRendererViewState extends State<WebRendererView> {
  final _controller = WebViewController();
  final _focusNode = FocusNode();
  final _scrollSpeed = 25;
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
    Factory(() => EagerGestureRecognizer())
  };

  @override
  void dispose() {
    _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    _focusNode.dispose();
    super.dispose();
  }

  KeyEventResult _handleKey(FocusNode _, RawKeyEvent event) {
    try {
      if (event is RawKeyDownEvent) {
        if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          _controller.scrollBy(0, -_scrollSpeed);
          return KeyEventResult.handled;
        } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          _controller.scrollBy(_scrollSpeed, 0);
          return KeyEventResult.handled;
        } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          _controller.scrollBy(0, _scrollSpeed);
          return KeyEventResult.handled;
        } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          _controller.scrollBy(-_scrollSpeed, 0);
          return KeyEventResult.handled;
        }
      }
      return KeyEventResult.ignored;
    } on Exception {
      return KeyEventResult.ignored;
    }
  }

  @override
  void initState() {
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36",
      )
      ..setNavigationDelegate(NavigationDelegate())
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(19, 11, 19, 11),
      child: Focus(
        focusNode: _focusNode,
        onKey: _handleKey,
        child: WebViewWidget(
          controller: _controller,
        ),
      ),
    );
  }
}
