import 'package:school_management/core/library/library.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: context.screenWidth,
          height: context.screenHeight,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: context.screenWidth,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(loginBgImg), fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      logo.toImage().wh(140, 140).pOnly(top: 50),
                      TextWidget("Sign In",
                          fontSize: 34,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ColoredBox(
                  color: primaryColor,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(30))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget("Phone Number",
                            fontSize: 18, fontWeight: FontWeight.w400),
                        5.heightBox,
                        TextField(
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            hintText: "9812345678",
                            hintStyle: TextStyle(
                                fontSize: 30,
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.bold),
                            border: InputBorder.none,
                          ),
                        ),
                        15.heightBox,
                        TextWidget("Password",
                            fontSize: 18, fontWeight: FontWeight.w400),
                        5.heightBox,
                        TextField(
                          obscureText: true,
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            hintText: "**********",
                            hintStyle: TextStyle(
                                fontSize: 30,
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.bold),
                            border: InputBorder.none,
                          ),
                        ),
                        40.heightBox,
                        CustomButton(
                          text: "LOGIN",
                          onPressed: () {
                            context.go(AppRoutes.home);
                          },
                        ).w(context.screenWidth)
                      ],
                    ).pSymmetric(h: 25.0, v: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
