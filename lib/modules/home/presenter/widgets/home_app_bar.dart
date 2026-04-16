import 'package:maltflix/app_imports.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            MaltflixLogo(),
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
    );
  }
}

class MaltflixLogo extends StatelessWidget {
  const MaltflixLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      isRepeatingAnimation: true,
      animatedTexts: [
        ColorizeAnimatedText(
          'MALTFLIX',
          textStyle: const TextStyle(
            color: Color(0xFFE50914),
            fontSize: 26,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
          speed: const Duration(seconds: 2),
          colors: [Colors.red, Colors.white, Colors.red],
        ),
      ],
    );
  }
}
