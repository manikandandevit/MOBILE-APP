
import 'package:bright_kid/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';



import '../data/app_colors.dart';
import '../data/app_style.dart';
import '../data/app_text.dart';
import '../data/utils.dart';
import '../routes/app_pages.dart';

class BookingFee extends StatelessWidget {
  const BookingFee({super.key});

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
      body: Consumer<HomeController>(builder: (context, provider, child) =>
         Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
            const SizedBox(
              height: 20,
            ),
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
             const SizedBox(height: 15,),
             Text(
               Strings.paymentOption,style: nunito.copyWith(
                 fontSize: 18,
                 color: AppColors.black,
                 fontWeight: FontWeight.w600
             ),),
             const SizedBox(height: 15,),
             Container(
               width: kWidth,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(12),
                 color: AppColors.white,
                 border: Border.all(
                   color: AppColors.greyShadeOne,
                   width: 1,
                 ),
               ),
               child: Column(
                 children: [
                   paymentOptionTile(
                     title: Strings.payWithUpiOrQr,
                     subtitle: Strings.paymentScannerInfo,
                     onTap: () {
                       Navigator.pushNamed(
                         context,
                         Routes.BOOKINGPAYWITHONLINE,
                       );
                       // Navigator.pushNamed(
                       //   context,
                       //   Routes.BOOKINGFEESUCCESS,
                       // );
                     },
                   ),

                   Divider(color: AppColors.greyShadeOne),

                   paymentOptionTile(
                     title: Strings.offlinePayment,
                     subtitle: Strings.paymentOfflinePayment,
                     onTap: () {

                     },
                   ),

                   Divider(color: AppColors.greyShadeOne),

                   paymentOptionTile(
                     title: Strings.payViaApp,
                     subtitle: Strings.paymentGatewayInfo,
                     onTap: () {

                     },
                   ),
                 ],
               ),
             ),
          ]),
        ),
      ),
    );
  }

  Widget paymentOptionTile({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: nunitoSans.copyWith(
                    fontSize: 16,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: kWidth * 0.75,
                  child: Text(
                    subtitle,
                    style: nunitoSans.copyWith(
                      fontSize: 14,
                      color: AppColors.greyShadeTwo,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: AppColors.greyShadeTwo,
            ),
          ],
        ),
      ),
    );
  }

}
