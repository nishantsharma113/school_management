import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/profile/provider/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(30)),
                  image: DecorationImage(
                    image: AssetImage(loginBgImg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top:51,
                child: Row(
                  children: [IconButton(
              onPressed: () {
                context.go(AppRoutes.home);
              },
              icon: backIcon.toImage(color: Colors.white)),
              10.widthBox,
                    TextWidget(
                      "Profile",
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
              Positioned(
                top: 50,
                bottom: -20,
                right: 50,
                left: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.scale(scale: 1.2, child: Image.asset(profileImg)),
                    60.heightBox,
                    TextWidget(
                      profile.name,
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    10.heightBox,
                    TextWidget(
                      profile.classInfo,
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(children: [
              ProfileInfoRow(title: "Roll Number", value: profile.rollNumber),
            ProfileInfoRow(title: "Date of Birth", value: profile.dob),
            ProfileInfoRow(title: "Blood Group", value: profile.bloodGroup),
            ProfileInfoRow(
                title: "Emergency Contact", value: profile.emergencyContact),
            ProfileInfoRow(
                title: "Position in Class", value: profile.positionInClass),
            ProfileInfoRow(title: "Father's Name", value: profile.fatherName),
            ProfileInfoRow(title: "Mother's Name", value: profile.motherName),
            CustomButton(
              text: "Ask for Update",
              onPressed: () {
                context.go(AppRoutes.home);
              },
            ).w(context.screenWidth).pSymmetric(h: 30, v: 30),
            ],),
          )
        ],
      ),
    );
  }
}

class ProfileInfoRow extends StatelessWidget {
  final String title;
  final String value;

  const ProfileInfoRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                title,
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
              TextWidget(value, fontSize: 16, color: Colors.deepPurple),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
