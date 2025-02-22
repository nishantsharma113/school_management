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
