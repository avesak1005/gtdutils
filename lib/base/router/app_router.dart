import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigatorObserver extends NavigatorObserver {
  VoidCallback? onScreenPop;
  AppNavigatorObserver({this.onScreenPop});

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    debugPrint("Screen popped: ${route.settings.name}");
    onScreenPop?.call();
  }
}

final appNavigatorObserver = AppNavigatorObserver();

class AppRouter {
  AppRouter({required this.initialLocation, required this.routers, this.rootNavigatorKey});
  String initialLocation;
  List<RouteBase> routers;
  GlobalKey<NavigatorState>? rootNavigatorKey;
  final GlobalKey<NavigatorState> defaultRootNavigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();
  GoRouter generateRouter() {
    GoRouter appRouter = GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: rootNavigatorKey,
      initialLocation: initialLocation,
      observers: [appNavigatorObserver],
      routes: routers,
    );
    return appRouter;
  }

  GlobalKey<NavigatorState> getRootNavigationKey() {
    return rootNavigatorKey ?? defaultRootNavigatorKey;
  }

// |_ GoRoute
//   |_ parentNavigatorKey = _parentKey   👈 Specify key here
// |_ ShellRoute
//   |_ GoRoute                            // Needs Bottom Navigation
//     |_ parentNavigatorKey = _shellKey
//   |_ GoRoute                            // Needs Bottom Navigation
//     |_ parentNavigatorKey = _shellKey
// |_ GoRoute                              // Full Screen which doesn't need Bottom Navigation
//   |_parentNavigatorKey = _parentKey
  //MARK: Router for tabbar navigator
  GoRouter generateShellRouter() {
    GoRouter shellRouter = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: initialLocation,
      routes: routers,
    );
    return shellRouter;
  }
}
