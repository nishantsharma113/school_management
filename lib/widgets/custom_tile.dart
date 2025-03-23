import 'package:school_management/core/library/library.dart';

class Tile extends StatelessWidget {
  final String icon;
  final String label;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  const Tile(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.label,
      this.backgroundColor = const Color(0xFF473F97)});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: backgroundColor,
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon.toImage().wh(50, 50),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
        TextWidget(
          label,
          textAlign: TextAlign.center,
          fontSize: 16,
          color: const Color.fromARGB(255, 97, 97, 97),
          fontWeight: FontWeight.w500,
        ).h(40),
      ],
    ).w(context.screenWidth * 0.25);
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color iconColor;

  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
    this.backgroundColor = Colors.white,
    this.iconColor = const Color(0xFF473F97),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 50,
                  color: iconColor,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
        TextWidget(
          title,
          textAlign: TextAlign.center,
          fontSize: 16,
          color: const Color.fromARGB(255, 97, 97, 97),
          fontWeight: FontWeight.w500,
        ).h(40),
      ],
    ).w(context.screenWidth * 0.25);
  }
}
