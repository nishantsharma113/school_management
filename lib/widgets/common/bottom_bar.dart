import 'package:school_management/core/library/library.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(selectedIndex == 0 ? homeActive : home, "Home", 0),
            _buildNavItem(selectedIndex == 1 ? chatActive : chat, "Chat", 1),
            _buildNavItem(selectedIndex == 2 ? assignmentActive : assignment,
                "Assignment", 2),
            _buildNavItem(selectedIndex == 3 ? menuActive : menu, "Menu", 3),
          ],
        ),
      ),
    ).pSymmetric(h: 20.0, v: 20.0);
  }

  Widget _buildNavItem(String icon, String tile, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon.toImage(),
          if (selectedIndex == index)
            Text(
              tile,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? Colors.black : Colors.grey,
              ),
            ),
        ],
      ),
    );
  }
}
