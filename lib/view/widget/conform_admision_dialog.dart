
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../booking/booking_fee.dart';
import '../data/app_colors.dart';
import '../data/app_style.dart';
import '../data/app_text.dart';
import '../data/utils.dart';
import 'custom_button.dart';

void conformAdmissionDialogBox(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,

        child: PopScope(
          canPop: false,
          child: Container(
            width: kWidth * 0.92,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.green
                        ),
                        child: Center(
                          child: Text(Strings.aK,style: nunito.copyWith(
                            fontSize: 18,
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Strings.arjunKumar,style: nunitoSans.copyWith(
                            fontSize: 16,
                            color: AppColors.black,
                          ),),
                          Row(
                            children: [
                              Text(Strings.levelWithDot,style: nunitoSans.copyWith(
                                fontSize: 14,
                                color: AppColors.black,
                                fontWeight: FontWeight.w700,
                              ),),
                              Text(Strings.nursery,style: nunitoSans.copyWith(
                                fontSize: 14,
                                color: AppColors.black,
                              ),),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    color: AppColors.greyShadeOne,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: kWidth * 0.8,
                    child: Text(Strings.confirmAdmissionInSteps,style: nunitoSans.copyWith(
                      fontSize: 16,
                      color: AppColors.black,
                    ),),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.skyShadeOne
                        ),
                        child: Center(
                          child: Text(
                            Strings.one,style: nunitoSans.copyWith(
                            fontSize: 14,
                            color: AppColors.blueShadeTwo,
                            fontWeight: FontWeight.w700,
                          ),),
                        ),
                      ),
                      const SizedBox(width: 15,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Strings.payBookingFee,style: nunitoSans.copyWith(
                            fontSize: 14,
                            color: AppColors.black,
                            fontWeight: FontWeight.w700,
                          ),),
                          SizedBox(
                            width: kWidth * 0.45,
                            child: Text(Strings.actualBookingFee,style: nunitoSans.copyWith(
                              fontSize: 14,
                              color: AppColors.greyShadeTwo,
                            ),),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 35,
                        width: 85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(99),
                          color: AppColors.orangeShadeTwo
                        ),
                        child: Center(
                          child: Text(
                           Strings.pending,style: nunitoSans.copyWith(
                          fontSize: 14,
                          color: AppColors.orangeShadeThree,
                          fontWeight: FontWeight.w700 ),),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),

                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const BookingFee()));
                    },
                    child: CustomButton(
                      buttonWidth: kWidth,
                      buttonHeight: 50,
                      color: AppColors.orange,
                      text: Strings.payBookingFee,
                      style: nunitoSans.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color:  AppColors.white
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
  );
}