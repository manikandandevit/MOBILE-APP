import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../controller/auth_controller.dart';

import '../../data/app_colors.dart';
import '../../data/app_style.dart';
import '../../data/app_text.dart';
import '../../data/utils.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_field.dart';

class ForgotPassword extends StatelessWidget {
   ForgotPassword({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
        bottom: PreferredSize(preferredSize: Size.fromHeight(1),
            child: Divider(
              color: AppColors.greyShadeOne,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Consumer<AuthController>(
            builder: (context, controller, child) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                    Text(
                      Strings.forgotPasswords,style: nunito.copyWith(fontSize: 24,color: AppColors.black) ,
                    ),
                    const SizedBox(height: 20,),
                    Text(
                      Strings.enterYourRegisterEmail,
                      style: nunitoSans.copyWith(fontSize: 14,color: AppColors.black),
                    ),
                    const SizedBox(height: 20,),
                    Text(
                      Strings.enterEmailAddress,
                      style: nunitoSans.copyWith(fontSize: 14,color: AppColors.black),
                    ),

                    const SizedBox(height: 10,),
                    CustomTextFormField(
                      onChanged: (value) {
                        controller.checkFields2();
                      },
                      controller: controller.forgotemailController,filled: true,fillColor: AppColors.white,borderColor: AppColors.greyShadeOne,
                      hintText: Strings.registerEmail,
                      hintStyle: nunitoSans.copyWith(
                          fontSize: 15,
                          color: AppColors.black
                      ),
                    ),
                    const SizedBox(height: 20,),
                    InkWell(
                      onTap: () {
                       /// Get.toNamed(Routes.BOTTOMNAVIGATIONBAR);
                      },
                      child: CustomButton(
                        buttonWidth: kWidth,
                        buttonHeight: 50,
                        color: controller.forgotisButtonEnabled ?
                        AppColors.orange
                            :
                        AppColors.greyShadeOne
                        ,
                        text: Strings.submit,
                        style: nunitoSans.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color:  controller.forgotisButtonEnabled ? AppColors.white : AppColors.greyShadeTwo
                        ),
                      ),
                    ),

                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
