import 'package:bright_kid/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Core/Utils/converter.dart';
import '../data/app_colors.dart';
import '../data/app_style.dart';
import '../data/app_text.dart';
import '../routes/app_pages.dart';

class VerifyDetailScreens extends StatelessWidget {
  const VerifyDetailScreens({super.key});

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
          "Verify Key Details",
          style: nunitoSans.copyWith(
            fontSize: 16,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Consumer<HomeController>(
        builder: (context, provider, child) {
          var verify = provider.getAdmissionValue?.admission?.verifyDetails;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 10),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      formDetails(
                        title: "Child’s Name:",
                        subTitle: verify?.studentName ?? '-',
                      ),
                      const SizedBox(height: 20),
                      formDetails(
                        title: "Date of Birth:",
                        subTitle: stringdateformat((verify?.dob ?? DateTime.now())
                            .toString(),),
                      ),
                      const SizedBox(height: 20),
                      formDetails(
                        title: "Level:",
                        subTitle: "${verify?.level}",
                      ),
                      const SizedBox(height: 20),
                      formDetails(
                        title: "Registered Mobile No:",
                        subTitle: "${verify?.registeredMobile}",
                      ),
                      const SizedBox(height: 20),
                      formDetails(
                        title: "Registered Email ID:",
                        subTitle: "${verify?.registeredEmail}",
                      ),
                      const SizedBox(height: 20),
                      formDetails(
                        title: "Father’s Mobile No:",
                        subTitle: "${verify?.fatherMobile}",
                      ),
                      const SizedBox(height: 20),
                      formDetails(title: "Mother’s Mobile No:",
                        subTitle: "${verify?.motherMobile}",),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                          ),
                          onPressed: () {
                            provider.postConfirmStudentDetails().then((value){
                              Navigator.pushNamed(context, Routes.PROFILEVERIFYSCREEN);
                              // Navigator.pushReplacementNamed(context, Routes.BOTTOMNAVIGATIONBAR);
                            });
                          },
                          child: Text("Confirm",
                            style: nunito.copyWith(
                              fontSize: 16,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => messageDialog(context, provider),
                            );
                          },
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),),
                          child: Text("Send message (request for change)",
                            style: nunito.copyWith(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget formDetails({required String title, required String subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: nunito.copyWith(
            fontSize: 14,
            color: AppColors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          subTitle,
          style: nunito.copyWith(
            fontSize: 14,
            color: AppColors.black.withOpacity(0.65),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }


  Widget messageDialog(BuildContext context, HomeController provider) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(Strings.writeYourMessage,
                textAlign: TextAlign.start,
                style: nunito.copyWith(
                  fontSize: 14,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                )),
            const SizedBox(height: 12,),
            /// Message Input
            TextFormField(
              controller: provider.messageCtrl,
              maxLines: 5,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
            ),

            const SizedBox(height: 20),
            /// Send Button
            SizedBox(
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  if (provider.messageCtrl.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Message is required'),
                      ),
                    );
                    return;
                  }
                  else{
                    provider.postRequestStudentDetailsChange(message: provider.messageCtrl.text).then((value){
                      Navigator.pushReplacementNamed(context, Routes.BOTTOMNAVIGATIONBAR);
                      provider.messageCtrl.clear();
                    });
                  }
                },
                child: const Text(
                  'Send Message',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            /// Cancel
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
