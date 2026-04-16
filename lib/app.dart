import 'package:maltflix/app_imports.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MaltFlix',
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouterSystem.router,
      scaffoldMessengerKey: GoRouterSystem.scaffoldKey,
      builder: (context, child) {
        return child ?? const SizedBox.shrink();
      },
    );
  }
}
