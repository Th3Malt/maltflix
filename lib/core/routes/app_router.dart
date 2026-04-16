import 'package:maltflix/app_imports.dart';

class GoRouterSystem {
  const GoRouterSystem._();

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');
  static final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  static BuildContext? get ctx =>
      router.routerDelegate.navigatorKey.currentContext;

  static String initialRoutePath = SplashPage.routeName;

  static GoRouter router = GoRouter(
    initialLocation: initialRoutePath,
    debugLogDiagnostics: kDebugMode,
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: SplashPage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return SplashPage();
        },
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: HomePage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return HomePage();
        },
      ),

      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: MoviePage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          final args = state.extra as Map<String, dynamic>;
          return MoviePage(movie: args['movie'] as MovieEntity);
        },
      ),
    ],
    errorPageBuilder: (BuildContext context, GoRouterState state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(body: Center(child: Text(state.error.toString()))),
      );
    },
  );
}
