import 'dart:io';

import 'package:bright_kid/controller/home_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../data/app_colors.dart';
import '../data/app_style.dart';
import '../data/app_text.dart';
import '../data/utils.dart';
import '../routes/app_pages.dart';
import '../widget/custom_button.dart';
import '../widget/custom_field.dart';
import '../widget/qrImage_download.dart';

class UploadScreenshotScreen extends StatefulWidget {
  const UploadScreenshotScreen({super.key});

  @override
  State<UploadScreenshotScreen> createState() => _UploadScreenshotScreenState();
}

class _UploadScreenshotScreenState extends State<UploadScreenshotScreen> {

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeController>();
    return Scaffold(
      backgroundColor: AppColors.orangeShadeFour,
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: AppColors.black,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              Strings.uploadScreeShot,
              style: nunitoSans.copyWith(
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      body: provider.uploadSuccess ? Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      Strings.uploadCompleted,
                      style: nunitoSans.copyWith(
                        fontSize: 20,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      Strings.uploadCompletedContent,textAlign: TextAlign.center,
                      style: nunitoSans.copyWith(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.green
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                        child: Icon(Icons.check_rounded, size: 50, color: Colors.white,),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Text('${provider.fileName ?? ''}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30,),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.PARENTHOMESCREENBAR);
                provider.boolUploadSuccess(false);
              },
              child: CustomButton(
                buttonWidth: kWidth,
                buttonHeight: 50,
                border: Border.all(color: AppColors.orange),
                text: Strings.done,
                style: nunitoSans.copyWith(
                  fontSize: 14,
                  color: AppColors.orange,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ) : SingleChildScrollView(
        child: Consumer<HomeController>(builder: (context, provider, child) =>
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: Form(
              key: provider.formkey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final File? image = await pickScreenshotFromGallery(context);
                      if (image != null) {
                        setState(() {
                          print("Selected image: ${image.path}");
                          provider.selectedImage = image;
                          provider.fileName = image.path.split('/').last;
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
                        height: MediaQuery.of(context).size.height / 1.6,
                        alignment: Alignment.center,
                        child: provider.selectedImage == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.upload_file,
                                    size: 40,
                                    color: Colors.grey.shade600,
                                  ),
                                  const SizedBox(height: 12),
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
                                  provider.selectedImage!,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  CustomTextFormField(
                    controller: provider.amount,
                    filled: true,
                    fillColor: AppColors.white,
                    borderColor: AppColors.greyShadeOne,
                    hintText: Strings.enterAmount,
                    hintStyle: nunitoSans.copyWith(
                        fontSize: 15,
                        color: AppColors.black
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '* Amount Required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () async{
                      if (!provider.formkey.currentState!.validate()) return;
                      await provider.submitPayment();
                      if (provider.uploadSuccess) {
                        provider.selectedImage = null;
                        provider.amount.clear();
                      }
                    },
                    child: CustomButton(
                      buttonWidth: kWidth,
                      buttonHeight: 50,
                      border: Border.all(color: AppColors.orange),
                      text: Strings.submit,
                      style: nunitoSans.copyWith(
                        fontSize: 14,
                        color: AppColors.orange,
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
      )
    );
  }
}
