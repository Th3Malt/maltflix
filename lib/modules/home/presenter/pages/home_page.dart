import 'package:maltflix/app_imports.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const HomeBanner(),
                  const SizedBox(height: 20),

                  NowPlayingContent(),

                  const SizedBox(height: 24),

                  PopularMoviesContent(),

                  const SizedBox(height: 40),
                ],
              ),
            ),
            HomeAppBar(),
          ],
        ),
      ),
    );
  }
}
