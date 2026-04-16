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
    final w = size.width;
    final h = size.height;

    final p = Curves.easeOutCubic.transform(progress.clamp(0.0, 1.0));

    final basePaint = Paint()
      ..shader = LinearGradient(
        colors: const [
          Color(0xFF7A0000),
          Color(0xFFE50914),
          Color(0xFFB1060F),
          Color(0xFF4A0000),
        ],
        stops: const [0.0, 0.4, 0.7, 1.0],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, w, h))
      ..style = PaintingStyle.fill;

    final shimmerPosition = (p * 1.5 - 0.5).clamp(0.0, 1.0);

    final shimmerPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.transparent,
          Colors.white.withOpacity(0.25),
          Colors.transparent,
        ],
        stops: const [0.3, 0.5, 0.7],
        begin: Alignment(-1 + shimmerPosition * 2, -1),
        end: Alignment(1 + shimmerPosition * 2, 1),
      ).createShader(Rect.fromLTWH(0, 0, w, h))
      ..blendMode = BlendMode.plus;

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);

    final path = Path();

    final thickness = w * 0.18;

    path.moveTo(0, h);
    path.lineTo(0, 0);
    path.lineTo(thickness, 0);
    path.lineTo(w * 0.5, h * 0.65);
    path.lineTo(w - thickness, 0);
    path.lineTo(w, 0);
    path.lineTo(w, h);
    path.lineTo(w - thickness, h);
    path.lineTo(w - thickness, thickness);
    path.lineTo(w * 0.5, h * 0.8);
    path.lineTo(thickness, thickness);
    path.lineTo(thickness, h);
    path.close();

    final clipHeight = h * p;

    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0, h - clipHeight, w, clipHeight));

    canvas.drawPath(path.shift(const Offset(0, 4)), shadowPaint);

    canvas.drawPath(path, basePaint);

    canvas.drawPath(path, shimmerPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant MPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
