import 'package:school_management/core/library/library.dart';
import 'package:school_management/widgets/common/bottom_bar.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Home",
          onNotificationTap: () {
            context.go(AppRoutes.notification);
          },
        ),
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: 0,
          onItemTapped: (index) {},
        ),
        body: SizedBox(
          width: context.screenWidth,
          height: context.screenHeight,
          child: Column(
            children: [
              30.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      'Latest notices',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    TextWidget(
                      'View all',
                      fontSize: 16,
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: const [
                    NoticeCard(
                      title: 'Holiday',
                      subtitle: 'Due to bad weather',
                      time: '5 months ago',
                    ),
                    NoticeCard(
                      title: 'Singing Competition',
                      subtitle:
                          'Students from std. 8 to 10 can apply for this competition.',
                      time: 'about a year ago',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class NoticeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;

  const NoticeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(color: Color(0xffE6E6E6),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              title,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 5),
            TextWidget(
              subtitle,
              fontSize: 14,
              color: textColor,
            ),
            const SizedBox(height: 5),
            TextWidget(
              time,
              fontSize: 12,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
