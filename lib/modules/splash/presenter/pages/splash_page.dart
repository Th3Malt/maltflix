import 'package:maltflix/app_imports.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 4));

    if (!mounted) return;

    context.go(HomePage.routeName);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (_, _) {
            return CustomPaint(
              size: const Size(200, 200),
              painter: MPainter(progress: controller.value),
            );
          },
        ),
      ),
    );
  }
}

class MPainter extends CustomPainter {
  final double progress;

  MPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFB1060F), Color(0xFFE50914), Color(0xFFB1060F)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path();

    final w = size.width;
    final h = size.height;

    final p = progress.clamp(0.0, 1.0);

    if (p > 0.0) {
      final leftProgress = (p * 3).clamp(0.0, 1.0);

      path.addRect(Rect.fromLTWH(0, 0, w * 0.2, h * leftProgress));
    }

    if (p > 0.3) {
      final midProgress = ((p - 0.3) * 3).clamp(0.0, 1.0);

      path.moveTo(0, 0);
      path.lineTo(w * 0.5 * midProgress, h * midProgress);
      path.lineTo(w * 0.5 * midProgress + w * 0.2, h * midProgress);
      path.lineTo(w * 0.2, 0);
      path.close();
    }

    if (p > 0.6) {
      final rightDiagProgress = ((p - 0.6) * 3).clamp(0.0, 1.0);

      path.moveTo(w * 0.5, h);
      path.lineTo(
        w * (0.5 + 0.5 * rightDiagProgress),
        h * (1 - rightDiagProgress),
      );
      path.lineTo(
        w * (0.5 + 0.5 * rightDiagProgress) - w * 0.2,
        h * (1 - rightDiagProgress),
      );
      path.lineTo(w * 0.5 - w * 0.2, h);
      path.close();
    }

    if (p > 0.8) {
      final rightProgress = ((p - 0.8) * 5).clamp(0.0, 1.0);

      path.addRect(
        Rect.fromLTWH(
          w * 0.8,
          h * (1 - rightProgress),
          w * 0.2,
          h * rightProgress,
        ),
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant MPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
