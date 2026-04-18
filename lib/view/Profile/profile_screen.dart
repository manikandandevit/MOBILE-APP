import 'package:flutter/material.dart';

import '../data/app_colors.dart';
import '../data/app_style.dart';
import '../widget/loader.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: (){
            showCupertinoLogoutDialog(context);
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.orange,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout,size: 24,color: AppColors.white,),
                  const SizedBox(width: 10,),
                  Text("Logout",style: nunito.copyWith(
                    fontSize: 14,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
