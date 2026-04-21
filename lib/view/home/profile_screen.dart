import 'dart:io';

import 'package:bright_kid/controller/home_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/app_colors.dart';
import '../data/app_style.dart';
import '../data/app_text.dart';
import '../data/utils.dart';
import '../routes/app_pages.dart';
import '../widget/custom_button.dart';
import '../widget/qrImage_download.dart';

class ProfileVerifyScreen extends StatefulWidget {
  const ProfileVerifyScreen({super.key});

  @override
  State<ProfileVerifyScreen> createState() => _ProfileVerifyScreenState();
}

class _ProfileVerifyScreenState extends State<ProfileVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          "Profile Icon",
          style: nunitoSans.copyWith(
            fontSize: 16,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Consumer<HomeController>(
        builder: (context, provider, child) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    final File? image = await pickScreenshotFromGallery(context);
                    if (image != null) {
                      setState(() {
                        print("Selected image: ${image.path}");
                        provider.selectProfile = image;
                        provider.profileName = image.path.split('/').last;
                      });
                    }
                  },
                  child: DottedBorder(
                    color: AppColors.orange,
                    strokeWidth: 1.5,
                    dashPattern: const [6, 4],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 2,
                      alignment: Alignment.center,
                      child: provider.selectProfile == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Icon(
                                //   Icons.upload_file,
                                //   size: 40,
                                //   color: Colors.grey.shade600,
                                // ),
                                Image.asset('asset/image/onboarding_camera.png'),
                                Text(
                                  "Upload your screenshot",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  "PNG, JPG up to 5MB",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                provider.selectProfile!,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Create Profile Icon',
                  textAlign: TextAlign.center,
                  style: nunito.copyWith(
                    fontSize: 24,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Upload your child’s photo… or a family one with the little bright kid in it.',
                  textAlign: TextAlign.center,
                  style: nunito.copyWith(
                    fontSize: 16,
                    color: AppColors.black.withOpacity(0.75),
                  ),
                ),
                const SizedBox(height: 30,),
                InkWell(
                  onTap: () async{
                    await provider.uploadProfileImage();
                    if (provider.uploadSuccess) {
                      Navigator.pushNamed(context, Routes.PICKUPDETAILSSCREEN);
                      provider.selectProfile = null;
                    }
                  },
                  child: CustomButton(
                    buttonWidth: kWidth,
                    buttonHeight: 50,
                    color: AppColors.orange,
                    text: "Upload",
                    style: nunitoSans.copyWith(
                      fontSize: 14,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    isLoading: provider.loading,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
