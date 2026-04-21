import 'package:bright_kid/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/app_colors.dart';
import '../data/app_style.dart';
import '../data/app_text.dart';
import '../data/utils.dart';


class BookingFeeAmountCardWidget extends StatelessWidget {
  const BookingFeeAmountCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(builder: (context, provider, child) =>
       Container(
        width: kWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
          border: Border.all(
              color: AppColors.greyShadeOne,
              width: 1
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 15,),
            Center(
              child: Text(
                Strings.bookingFeeAmount,style: nunitoSans.copyWith(
                  fontSize: 14,
                  color: AppColors.greyShadeTwo,
                  fontWeight: FontWeight.w400
              ),),
            ),
            const SizedBox(height: 10,),
            Center(
              child: Text("₹ ${provider.getAdmissionValue?.admission?.bookingFee ?? '---'}",
                style: nunito.copyWith(
                    fontSize: 32,
                    color: AppColors.black,
                    fontWeight: FontWeight.w700
                ),),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 12,right: 12,bottom: 20),
              child: Container(
                width: kWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.greyShadeThree
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${provider.getAdmissionValue?.admission?.studentName ?? '---'}",
                          style: nunitoSans.copyWith(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400
                          ),),
                        Text(
                          Strings.dot,style: nunitoSans.copyWith(
                            fontSize: 12,
                            color: AppColors.greyShadeTwo,
                            fontWeight: FontWeight.w400
                        ),),
                        Text(provider.formatLevel(
                            "${provider.getAdmissionValue?.admission?.level ?? '---'}"),
                          style: nunitoSans.copyWith(
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400
                          ),),
                        Text(
                          Strings.dot,style: nunitoSans.copyWith(
                            fontSize: 12,
                            color: AppColors.greyShadeTwo,
                            fontWeight: FontWeight.w400
                        ),),
                        Text(
                          Strings.koraManGala,style: nunitoSans.copyWith(
                            fontSize: 14,
                            color: AppColors.black,
                            fontWeight: FontWeight.w400
                        ),),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Center(
                      child: Text(
                        Strings.amountAdjustYourTotalFees,textAlign: TextAlign.center,style: nunitoSans.copyWith(
                          fontSize: 14,
                          color: AppColors.greyShadeTwo,
                          fontWeight: FontWeight.w400
                      ),),
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
