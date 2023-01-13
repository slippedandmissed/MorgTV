import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morg_tv/api.dart';
import 'package:morg_tv/models/url_response.dart';
import 'package:auto_route/auto_route.dart';
import 'package:morg_tv/router/router.dart';

class WebView extends ConsumerStatefulWidget {
  const WebView({super.key});

  @override
  ConsumerState<WebView> createState() => _WebViewState();
}

class _WebViewState extends ConsumerState<WebView> {
  final _focusNode = FocusNode();
  late FutureProvider<URLResponse> _urlResponse;

  void _fetchURL() {
    setState(() {
      _urlResponse = url();
    });
  }

  @override
  void initState() {
    _fetchURL();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  KeyEventResult _handleKeyEvent(FocusNode node, RawKeyEvent event) {
    if (event is RawKeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.mediaPlayPause) {
      _fetchURL();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final url = ref.watch(_urlResponse);
    return Focus(
      focusNode: _focusNode,
      onKey: _handleKeyEvent,
      child: url.when(
        data: (url) => Column(
          children: [
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ref.read(_urlResponse.future).then(
                        (value) => context.router
                            .push(WebRendererViewRoute(url: value.url)),
                      );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.open_in_browser, color: Colors.white),
                    const SizedBox(width: 8),
                    Text(url.url, style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
        error: (error, stackTrace) => Card(
          color: Colors.red,
          child: Text(
            error.toString(),
            style: const TextStyle(color: Colors.red),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
