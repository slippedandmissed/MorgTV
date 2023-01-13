// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$Router extends RootStackRouter {
  _$Router([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const Dashboard(),
      );
    },
    WebRendererViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<WebRendererViewRouteArgs>(
          orElse: () =>
              WebRendererViewRouteArgs(url: pathParams.getString('url')));
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WebRendererView(
          url: args.url,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          DashboardRoute.name,
          path: '/',
        ),
        RouteConfig(
          WebRendererViewRoute.name,
          path: '/web/:url',
        ),
      ];
}

/// generated route for
/// [Dashboard]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: '/',
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [WebRendererView]
class WebRendererViewRoute extends PageRouteInfo<WebRendererViewRouteArgs> {
  WebRendererViewRoute({
    required String url,
    Key? key,
  }) : super(
          WebRendererViewRoute.name,
          path: '/web/:url',
          args: WebRendererViewRouteArgs(
            url: url,
            key: key,
          ),
          rawPathParams: {'url': url},
        );

  static const String name = 'WebRendererViewRoute';
}

class WebRendererViewRouteArgs {
  const WebRendererViewRouteArgs({
    required this.url,
    this.key,
  });

  final String url;

  final Key? key;

  @override
  String toString() {
    return 'WebRendererViewRouteArgs{url: $url, key: $key}';
  }
}
