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
  final Function()? onDrawerTap;

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
    this.onDrawerTap,
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
          : GestureDetector(
              onTap: onDrawerTap,
              child: drawerIcon.toImage().pSymmetric(h: 14),
            ),
      title: showtitle
          ? Align(
              alignment: Alignment.centerLeft,
              child: TextWidget(
                title!,
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            )
          : Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    TextWidget(
                      "Rahul Jain",
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    TextWidget(
                      "Class 10 A Science",
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )
              ],
            ),
      centerTitle: true,
      toolbarHeight: 120,
      actions: [
        showtitle
            ? SizedBox()
            : ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: user.toImage(width: 50, height: 50).p4(),
              ).p4().onTap(
                () {
                  context.go(AppRoutes.profile);
                },
              ),
      ],
      flexibleSpace: Container(
        width: context.screenWidth,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
          image: DecorationImage(
            image: AssetImage(loginBgImg),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
