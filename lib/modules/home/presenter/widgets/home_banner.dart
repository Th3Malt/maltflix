import 'package:maltflix/app_imports.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AppImage(
            image:
                'https://sm.ign.com/t/ign_br/screenshot/default/image1_2jjv.960.jpg',
            fit: BoxFit.cover,
          ),

          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          Positioned(
            bottom: 40,
            left: 16,
            right: 16,
            child: Column(
              children: [
                const Text(
                  'FILME DESTAQUE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BannerButton(
                      icon: Icons.play_arrow,
                      label: 'Assistir',
                      isPrimary: true,
                    ),
                    const SizedBox(width: 12),
                    BannerButton(icon: Icons.info_outline, label: 'Info'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
