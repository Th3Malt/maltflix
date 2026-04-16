import 'package:maltflix/app_imports.dart';

class BannerButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isPrimary;

  const BannerButton({
    super.key,
    required this.icon,
    required this.label,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isPrimary ? Colors.white : Colors.grey[800],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Icon(icon, color: isPrimary ? Colors.black : Colors.white),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(color: isPrimary ? Colors.black : Colors.white),
          ),
        ],
      ),
    );
  }
}
