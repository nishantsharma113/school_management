import 'package:school_management/core/library/library.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color backgroundColor;
  final Color titleColor;
  final bool centerTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final double elevation;
  final bool showLanguage;
  final bool showtitle;
  final Function()? onNotificationTap;

  const CustomAppBar({
    super.key,
    this.title,
    this.backgroundColor = Colors.blue,
    this.titleColor = Colors.white,
    this.centerTitle = true,
    this.actions,
    this.leading,
    this.elevation = 4.0,
    this.showLanguage = false,
    this.showtitle = false,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showtitle
          ? IconButton(
              onPressed: () {
                context.go(AppRoutes.home);
              },
              icon: backIcon.toImage(color: Colors.white))
          : null,
      title: showtitle
          ? TextWidget(
              title!,
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            )
          : Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1)),
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: user.toImage(width: 50, height: 50).p4(),
                        )).p4()),
                20.widthBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    TextWidget(
                      "Rahul Jain",
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    TextWidget(
                      "Class : 10 A Science",
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )
              ],
            ),
      centerTitle: true,
      toolbarHeight: 120,
      actions: [
        onNotificationTap != null
            ? IconButton(
                icon: Icon(Icons.notifications),
                onPressed: onNotificationTap,
              )
            : SizedBox()
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: primaryColor),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
