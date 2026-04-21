import 'package:bright_kid/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../data/app_colors.dart';
import '../data/app_style.dart';
import '../data/app_text.dart';
import '../data/utils.dart';
import '../routes/app_pages.dart';
import 'booking_fee_amount_card_widget.dart';

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
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: AppColors.black,
              ),
            ),
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
      body: Consumer<HomeController>(
        builder: (context, provider, child) => Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              BookingFeeAmountCardWidget(),
              const SizedBox(height: 15),
              Text(
                Strings.paymentOption,
                style: nunito.copyWith(
                  fontSize: 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: kWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.white,
                  border: Border.all(color: AppColors.greyShadeOne, width: 1),
                ),
                child: Column(
                  children: [
                    paymentOptionTile(provider,
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

                    paymentOptionTile(provider,
                      title: Strings.offlinePayment,
                      subtitle: Strings.paymentOfflinePayment,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.OFFLINEPAYMENT,
                        );
                      },
                    ),

                    Divider(color: AppColors.greyShadeOne),

                    paymentOptionTile(provider,
                      title: Strings.payViaApp,
                      subtitle: Strings.paymentGatewayInfo,
                      onTap: () {

                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentOptionTile(HomeController provider, {
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    bool payViaApp = (title == Strings.payViaApp && provider.getAdmissionValue?.admission?.school?.payViaApp == false);
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
                    color: payViaApp ? Colors.grey : AppColors.black,
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
            if(!payViaApp)
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
