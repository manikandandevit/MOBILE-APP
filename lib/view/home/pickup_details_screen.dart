import 'dart:io';

import 'package:bright_kid/controller/home_controller.dart';
import 'package:bright_kid/view/widget/custom_field.dart';
import 'package:bright_kid/view/widget/loader.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/app_colors.dart';
import '../data/app_style.dart';
import '../widget/qrImage_download.dart';


class PickupDetailsScreen extends StatefulWidget {
  const PickupDetailsScreen({super.key});

  @override
  State<PickupDetailsScreen> createState() => _PickupDetailsScreenState();
}

class _PickupDetailsScreenState extends State<PickupDetailsScreen> {
  int currentPerson = 1;
  bool isLoading = false;

  final nameCtrl = TextEditingController();
  final relationCtrl = TextEditingController();
  final mobileCtrl = TextEditingController();

  bool validate() {
    return nameCtrl.text.isNotEmpty &&
        relationCtrl.text.isNotEmpty &&
        mobileCtrl.text.isNotEmpty;
  }

  Future<void> submitPerson() async {
    if (!validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields are required")),
      );
      return;
    }

    setState(() => isLoading = true);

    nameCtrl.clear();
    relationCtrl.clear();
    mobileCtrl.clear();

    setState(() {
      isLoading = false;
      currentPerson++;
    });

    if (currentPerson > 3) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F3EF),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          "Pick-up Details",
          style: nunitoSans.copyWith(
            fontSize: 16,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: isLoading ? const Center(child: LogoLoader()) : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Consumer<HomeController>(builder: (context, provider, child) =>
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pick-up Details",
                  style: nunitoSans.copyWith(fontSize: 20, color: AppColors.black, fontWeight: FontWeight.w600)
              ),
              const SizedBox(height: 10,),
              Text(
                "Add up to 3 authorized pickup persons for your child's safe handover after school.",
                  style: nunitoSans.copyWith(fontSize: 14, color: AppColors.black.withOpacity(0.65), fontWeight: FontWeight.w600)
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (currentPerson > 1) 
                          InkWell(
                            onTap: (){
                              setState(() {
                                currentPerson--;
                                nameCtrl.clear();
                                relationCtrl.clear();
                                mobileCtrl.clear();
                              });
                            },
                            child: Container(
                              width: 30,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                        if (currentPerson > 1) const SizedBox(width: 12),

                        Text(
                          "Person $currentPerson",
                          style: nunitoSans.copyWith(
                            fontSize: 20,
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    /// UPLOAD BOX
                    DottedBorder(
                      color: AppColors.orange,
                      strokeWidth: 1.5,
                      dashPattern: const [6, 4],
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(12),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             provider.selectedImage == null ? Column(
                               children: [
                                 Image.asset(
                                   "asset/image/profile_default_icon.png",
                                   width: 55,
                                 ),
                                 const SizedBox(height: 8),
                                 Text("Select and upload photo", style: nunitoSans.copyWith(fontSize: 14, color: AppColors.black, fontWeight: FontWeight.w400)),
                                 const SizedBox(height: 10),
                               ],
                             ): SizedBox(
                                 height: 110,
                                 width: 110,
                                   child: ClipRRect(
                                     borderRadius: BorderRadius.circular(10),
                                     child: Image.file(
                                       provider.selectedImage!,
                                       fit: BoxFit.cover,
                                     ),
                                   ),
                             ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: OutlinedButton(
                                  onPressed: () async {
                                    final File? image = await pickScreenshotFromGallery(context);
                                    if (image != null) {
                                      setState(() {
                                        print("Selected image: ${image.path}");
                                        provider.selectedImage = image;
                                        provider.fileName = image.path.split('/').last;
                                      });
                                    }
                                  },
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.orange,
                                    side: const BorderSide(color: Colors.orange),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                  ),
                                  child: Text("Upload Photo", style: nunitoSans.copyWith(fontSize: 14, color: AppColors.orange, fontWeight: FontWeight.w600)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    label("Name"),
                    field(nameCtrl),
                    label("Relationship"),
                    field(relationCtrl),
                    label("Mobile No"),
                    field(mobileCtrl, keyboard: TextInputType.phone,),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: submitPerson,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.orange,
                        side: const BorderSide(color: Colors.orange),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 14),
                      ),
                      child: Text("Submit", style: nunitoSans.copyWith(fontSize: 14,color: AppColors.orange, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  if (currentPerson < 3) ...[
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: submitPerson,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: Text("Add Next Person", style: nunitoSans.copyWith(fontSize: 14,color: AppColors.white, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget label(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, bottom: 6),
      child: RichText(
        text: TextSpan(
          text: text,
          style: nunitoSans.copyWith(fontSize: 14,color: AppColors.black),
          children: const [
            TextSpan(text: " *", style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }

Widget field(TextEditingController controller,
  {TextInputType keyboard = TextInputType.text,}) {
    return CustomTextFormField(
      controller: controller,
      keyboardType: keyboard,
      hintStyle: nunitoSans.copyWith(
          fontSize: 15,
          color: AppColors.black),
      filled: true,
      fillColor: AppColors.white,
      borderColor: AppColors.greyShadeOne,
    );
  }
}