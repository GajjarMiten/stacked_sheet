import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked_sheet/layers/config/routing/routes.dart';
import 'package:stacked_sheet/layers/data/enums/routes_enum.dart';

typedef RoutePage = Widget Function(BuildContext, GoRouterState);
typedef QueryParams = Map<String, dynamic>;

class AppRouter {
  final GoRouter _router;

  AppRouter(this._router);

  GoRouter get allRoutes => _router;
  Routes get currentRoute => _getCurrentRoute();

  String nextRoute = '';
  String rootRoute = '';

  Routes _getCurrentRoute() {
    final route = _router.routerDelegate.currentConfiguration.last;

    return Routes.values.firstWhere(
      (element) => element.path == route.matchedLocation,
      orElse: () => Routes.other,
    );
  }

  factory AppRouter.init() {
    final router = GoRouter(
      initialLocation: Routes.discoverScreen.path,
      routes: _routeBuilder().toList(),
    );

    return AppRouter(router);
  }

  static Iterable<RouteBase> _routeBuilder() sync* {
    for (Routes route in Routes.values) {
      yield GoRoute(
        path: route.path,
        name: route.name,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: getPage(route, context, state),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              final tween = Tween(begin: begin, end: end);
              final curvedAnimation = CurvedAnimation(
                parent: animation,
                curve: curve,
              );
              return SlideTransition(
                position: tween.animate(curvedAnimation),
                child: child,
              );
            },
          );
        },
      );
    }
  }

  String _pathWithQueryParams(Routes route,
      [QueryParams queryParams = const {}]) {
    final path = Uri(path: route.path, queryParameters: queryParams).toString();
    return path;
  }

  Future<T?> push<T>(Routes route,
      {QueryParams queryParams = const {}, Object? extra}) {
    return _router.push<T>(_pathWithQueryParams(route, queryParams),
        extra: extra);
  }

  Future<T?> pushReplace<T>(Routes route,
      {QueryParams queryParams = const {}, Object? extra}) {
    if (route == currentRoute) {
      return Future.value(null);
    }
    return _router.pushReplacement<T>(_pathWithQueryParams(route),
        extra: extra);
  }

  Future<T?> pushAndRemoveAll<T>(Routes route,
      {QueryParams queryParams = const {}, Object? extra, Routes? rootRoute}) {
    while (_router.canPop()) {
      _router.pop();
    }
    if (rootRoute != null) {
      _router.pushReplacement<T>(_pathWithQueryParams(rootRoute), extra: extra);
      return _router.push<T>(_pathWithQueryParams(route), extra: extra);
    } else {
      return _router.pushReplacement<T>(_pathWithQueryParams(route),
          extra: extra);
    }
  }

  void pop<T extends Object>([T? result]) {
    _router.pop(result);
  }

  bool canPop() {
    return _router.canPop();
  }

  void go(Routes route, {QueryParams queryParams = const {}, Object? extra}) {
    _router.go(_pathWithQueryParams(route, queryParams), extra: extra);
  }
}
