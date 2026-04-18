import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../Core/Services/ServicesStorage/app_storage.dart';
import '../../../controller/auth_controller.dart';
import '../../data/app_colors.dart';
import '../../data/app_images.dart';
import '../../data/app_style.dart';
import '../../data/app_text.dart';
import '../../data/utils.dart';
import '../../widget/custom_button.dart';
import '../loginflow/login.dart';

class Onboarding extends StatelessWidget {
   Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(builder: (context, controller, child) {
      return Scaffold(
        body: PageView(
          controller: controller.pageController,
          onPageChanged: (index) {
            controller.changePage(index);
          },
          scrollDirection: Axis.horizontal,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                    height: 70,
                    width: kWidth * 0.4,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(AppImages.onboardingLogo))
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: 400,
                    width: kWidth * 1.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(AppImages.onboardingLock))
                    ),
                  ),
                ),
                SizedBox(
                    width: kWidth * 0.75,
                    child: Center(child: Text(Strings.secureYourAccount,textAlign: TextAlign.center,style: nunito,))),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: kWidth * 0.85,
                    child: Center(
                        child: Text(Strings.onBoardingParagraphOne,textAlign: TextAlign.center,style: nunitoSans,))),
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset(
                    AppImages.onboardingOne
                ),

              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                    height: 70,
                    width: kWidth * 0.4,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(AppImages.onboardingLogo))
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: 400,
                    width: kWidth * 1.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(AppImages.onboardingCamera))
                    ),
                  ),
                ),
                SizedBox(
                    width: kWidth * 0.75,
                    child: Center(child: Text(Strings.addYourChildPhotos,textAlign: TextAlign.center,style: nunito,))),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: kWidth * 0.85,
                    child: Center(
                        child: Text(Strings.onBoardingParagraphTwo,textAlign: TextAlign.center,style: nunitoSans,))),
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset(
                    AppImages.onboardingTwo
                ),

              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                    height: 70,
                    width: kWidth * 0.4,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(AppImages.onboardingLogo))
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: 400,
                    width: kWidth * 1,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(AppImages.onboardingHii))
                    ),
                  ),
                ),
                SizedBox(
                    width: kWidth * 0.75,
                    child: Center(child: Text(Strings.joinTheCommunity,textAlign: TextAlign.center,style: nunito,))),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: kWidth * 0.85,
                    child: Center(
                        child: Text(Strings.onBoardingParagraphThree,
                          textAlign: TextAlign.center,style: nunitoSans,))),
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset(
                    AppImages.onboardingThree
                ),

              ],
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 60),
          child: InkWell(
            onTap: () {
              if (controller.currentPage < 2) {
                controller.nextPage();
              } else {
                AppStorage.setNotFirstTime();
                Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
              }
            },
            child: CustomButton(buttonWidth: kWidth * 0.8, buttonHeight: 50,
              color: AppColors.orange,
              text: Strings.getStarted, style: nunitoSans.copyWith(color: AppColors.white),),
          ),
        ),
      );
    });
  }
}
