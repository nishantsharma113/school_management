import 'package:school_management/core/library/library.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              right: -20,
              child: Image.asset(
                loginUpperImg,
                width: context.screenWidth * 0.8,
              )),
          Positioned(
              bottom: -1,
              left: -30,
              child: Image.asset(
                loginlowerImg,
                width: context.screenWidth * 0.9,
              )),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      "Let's Sign in",
                      textAlign: TextAlign.center,
                      color: textColor,
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),
                    5.heightBox,
                    SizedBox(
                      width: context.screenWidth,
                      child: const TextWidget(
                        "Welcome Back, You've been missed!",
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                    30.heightBox,
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon:
                            SvgPicture.asset(userIcon).pSymmetric(h: 14.0),
                        hintText: "Token Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    20.heightBox,
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon:
                            SvgPicture.asset(passwordIcon).pSymmetric(h: 14.0),
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Reset password?",
                          style: TextStyle(color: buttonColor, fontSize: 16),
                        ),
                      ),
                    ),
                    30.heightBox,
                    CustomButton(
                        text: "Sign in",
                        onPressed: () {
                          context.go(AppRoutes.home);
                        }).w(context.screenWidth).h(55).pOnly(bottom: 20.0),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Login as ",
                        style: TextStyle(
                            fontSize: 16,
                            color: primaryColor,
                            fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                            text: "QR Code",
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ).centered(),
                    20.heightBox,
                    Center(
                      child: Text(
                        "By logging in, you agree to our",
                        style: TextStyle(fontSize: 16, color: textColor),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Terms & Condition & Privacy Policy",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
