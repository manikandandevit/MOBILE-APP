import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';


import '../data/app_colors.dart';
import '../data/app_images.dart';
import '../data/app_style.dart';
import '../data/app_text.dart';
import '../data/utils.dart';
import '../widget/custom_button.dart';

class BookingPaymentFailed extends StatelessWidget {
  const BookingPaymentFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orangeShadeFour,
      appBar: AppBar(
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
                child: Icon(Icons.arrow_back_ios, size: 20, color: AppColors.black)),
            const SizedBox(width: 10),
            Text(
              Strings.bookingFee,
              style: nunitoSans.copyWith(
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Container(
              width: kWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.red
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 15,),
                  Text(
                    Strings.paymentFailed,style: nunito.copyWith(
                      fontSize: 20,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600
                  ),),
                  const SizedBox(height: 10,),
                  SvgPicture.asset(
                      AppImages.failedIcon
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    Strings.bookingFeeAmount,style: nunitoSans.copyWith(
                      fontSize: 14,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400
                  ),),
                  const SizedBox(height: 5,),
                  Text(
                    Strings.totalBookingAmountFee,style: nunito.copyWith(
                      fontSize: 32,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700
                  ),),
                  const SizedBox(height: 15,),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Text(
              Strings.amountAdjustYourTotalFees,style: nunitoSans.copyWith(
                fontSize: 14,
                color: AppColors.greyShadeTwo,
                fontWeight: FontWeight.w400
            ),),
            const SizedBox(height: 20,),
            Container(
              width: kWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.greyShadeOne,
                    width: 1,
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15,bottom: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            Strings.transactionId,style: nunitoSans.copyWith(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400
                          ),),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Text(
                            Strings.actualTransactionId,style: nunitoSans.copyWith(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400
                          ),),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7,),
                    Divider(
                      color: AppColors.greyShadeOne,
                    ),
                    const SizedBox(height: 7,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            Strings.studentName,style: nunitoSans.copyWith(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400
                          ),),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Text(
                            Strings.actualStudentName,style: nunitoSans.copyWith(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400
                          ),),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7,),
                    Divider(
                      color: AppColors.greyShadeOne,
                    ),
                    const SizedBox(height: 7,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            Strings.level,style: nunitoSans.copyWith(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400
                          ),),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Text(
                            Strings.actualLevel,style: nunitoSans.copyWith(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400
                          ),),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7,),
                    Divider(
                      color: AppColors.greyShadeOne,
                    ),
                    const SizedBox(height: 7,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            Strings.centerName,style: nunitoSans.copyWith(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400
                          ),),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Text(
                            Strings.actualCenterName,style: nunitoSans.copyWith(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400
                          ),),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7,),
                    Divider(
                      color: AppColors.greyShadeOne,
                    ),
                    const SizedBox(height: 7,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            Strings.centerLocation,style: nunitoSans.copyWith(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400
                          ),),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Text(
                            Strings.actualCenterLocation,style: nunitoSans.copyWith(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400
                          ),),
                        ),
                      ],
                    ),




                  ],
                ),
              ),
            ),
            const SizedBox(height: 25,),
            CustomButton(
              buttonWidth: kWidth,
              buttonHeight: 50,
              border: Border.all(
                color: AppColors.orange,
              ),
              text: Strings.tryAgain,
              style:  nunitoSans.copyWith(
                  fontSize: 14,
                  color: AppColors.orange,
                  fontWeight: FontWeight.w700
              ),)
          ],
        ),
      ),
    );
  }
}
