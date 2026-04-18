import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../controller/bottom_nav_bar_controller.dart';

import '../Profile/profile_screen.dart';
import '../data/app_colors.dart';
import '../data/app_images.dart';
import '../data/app_style.dart';
import '../data/app_text.dart';
import '../home/home_screen.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});



  final pages = [
    HomeScreen(),
    Center(child: Text(Strings.notice)),
    Center(child: Text(Strings.montLibrary)),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarController>(
      builder: (context, controller, child) {
        return Scaffold(
          body: pages[controller.selectedIndex],

          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(
                top: BorderSide(color: AppColors.greyShadeOne),
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(height: 1, color: AppColors.greyShadeOne),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      navItem(controller, AppImages.homeIcon, Strings.home, 0),
                      navItem(controller, AppImages.soundIcon, Strings.notice, 1),
                      navItem(controller, AppImages.libraryIcon, Strings.montLibrary, 2),
                      navItem(controller, AppImages.profileIcon, Strings.profile, 3),
                    ],
                  ),


                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget navItem(
      BottomNavBarController controller,
      String iconPath,
      String label,
      int index,
      ) {
    bool isSelected = controller.selectedIndex == index;

    return GestureDetector(
      onTap: () => controller.changeIndex(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              height: 24,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? AppColors.orange
                    : AppColors.greyShadeTwo,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: nunito.copyWith(
                fontSize: 12,
                color: isSelected
                    ? AppColors.orange
                    : AppColors.greyShadeTwo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}