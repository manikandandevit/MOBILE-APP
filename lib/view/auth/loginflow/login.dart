import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../controller/auth_controller.dart';
import '../../data/app_colors.dart';
import '../../data/app_style.dart';
import '../../data/app_text.dart';
import '../../data/utils.dart';
import '../../bottomnavigationbar/bottom_nav_bar_view.dart';
import '../../routes/app_pages.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_field.dart';

class Login extends StatelessWidget {
   Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: InkWell(
            onTap: () {
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
              child: Form(key: controller.formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                    Text(
                     Strings.welcomeBack,style: nunito.copyWith(fontSize: 24,color: AppColors.black) ,
                    ),
                    const SizedBox(height: 10,),
                    Text(
                     Strings.enterLoginDetail,
                      style: nunitoSans.copyWith(fontSize: 14,color: AppColors.black) ,
                    ),
                    const SizedBox(height: 20,),
                    Text(
                      Strings.emailAddress,
                      style: nunitoSans.copyWith(fontSize: 14,color: AppColors.black) ,
                    ),
                    const SizedBox(height: 10,),
                    CustomTextFormField(
                      onChanged: (value) {
                        controller.checkFields();
                      },
                      controller: controller.emailController,filled: true,fillColor: AppColors.white,borderColor: AppColors.greyShadeOne,
                      hintText: Strings.enterEmailAddress,
                      hintStyle: nunitoSans.copyWith(
                          fontSize: 15,
                          color: AppColors.black
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '* Email Id Required';
                        }
                        if (!(value.contains('@'))) {
                          return '* Invalid Email Id';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                    Text(
                      Strings.password,style: nunitoSans.copyWith(fontSize: 14,color: AppColors.black) ,
                    ),
                    const SizedBox(height: 10,),
                    CustomTextFormField(
                      onChanged: (value) {
                        controller.checkFields();
                      },
                      controller: controller.passwordController,
                      hintText: Strings.enterPassword,
                      hintStyle: nunitoSans.copyWith(
                        fontSize: 15,
                        color: AppColors.black
                      ),
                      validator: (value){
                        if (value!.isEmpty) {
                          return '* Password Required';
                        }
                        return null;
                      },
                      filled: true,
                      fillColor: AppColors.white,
                      borderColor: AppColors.greyShadeOne,
                      obscureText: controller.isPasswordHidden,
                      suffixIcon:   IconButton(
                        icon: Icon(
                          controller.isPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          controller.togglePassword();
                        },
                      ),

                    ),
                    const SizedBox(height: 25,),
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.pushNamed(context, Routes.FORGOTPASSWORD);
                    //     },
                    //     child: Text(
                    //       Strings.forgotPassword,style: nunitoSans.copyWith(fontSize: 14,
                    //         color: AppColors.black) ,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 10,),
                    InkWell(
                      onTap: () async {
                        if (!controller.formkey.currentState!.validate()) return;
                        // Navigator.pushReplacementNamed(
                        //     context, Routes.PARENTHOMESCREENBAR);
                        final success = await context.read<AuthController>().loginApi(
                          emailId: controller.emailController.text,
                          password: controller.passwordController.text,
                        );
                        if (success) {
                          Navigator.pushReplacementNamed(
                              context, Routes.PARENTHOMESCREENBAR);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Login failed')),
                          );
                        }
                      },
                      child: CustomButton(
                        buttonWidth: kWidth,
                        buttonHeight: 50,
                        color: controller.isButtonEnabled
                            ? AppColors.orange
                            : AppColors.greyShadeOne,
                        text: Strings.logIn,
                        style: nunitoSans.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: controller.isButtonEnabled
                              ? AppColors.white
                              : AppColors.greyShadeTwo,
                        ),
                        isLoading: controller.isLoading,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
