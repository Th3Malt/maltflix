import 'package:maltflix/app_imports.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
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

          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Maltflix',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.cast, color: Colors.white),
                      SizedBox(width: 16),
                      Icon(Icons.search, color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
