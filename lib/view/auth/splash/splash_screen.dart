
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../Core/Services/ServicesStorage/app_storage.dart';
import '../../data/app_colors.dart';
import '../../data/app_images.dart';
import '../../data/utils.dart';
import '../../routes/app_pages.dart';
import '../loginflow/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
      navigate();
  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    final isFirstTime = AppStorage.isFirstTimeUser();
    final isLoggedIn = AppStorage.isLoggedIn();
    if (!mounted) return;
    if (isFirstTime) {
      Navigator.pushReplacementNamed(context, Routes.ONBOARDING);
    } else if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, Routes.PARENTHOMESCREENBAR);
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.splashBackground,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 150,
              width:  (kWidth == 0
                  ? MediaQuery.of(context).size.width
                  : kWidth) * 0.7,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(AppImages.brightKidLogo))
              ),
            ),
          )
        ],
      ),
    );
  }
}

