import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:morg_tv/dashboard.dart';
import 'package:morg_tv/webview.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,View',
  routes: [
    AutoRoute(
      path: '/',
      page: Dashboard,
      initial: true,
    ),
    AutoRoute(
      path: '/web/:url',
      page: WebRendererView,
    ),
  ],
)
class Router extends _$Router {}
