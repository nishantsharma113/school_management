import 'package:school_management/core/library/library.dart' ;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final appState = Provider.of<SplashController>(context, listen: false);
    appState.navigateScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.screenWidth,
        height: context.screenHeight,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(splash), fit: BoxFit.fill)),
      ),
    );
  }
}
