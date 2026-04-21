import 'package:bright_kid/controller/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../data/app_colors.dart';
import '../data/app_style.dart';
import '../data/app_text.dart';
import '../data/utils.dart';
import '../routes/app_pages.dart';
import '../widget/custom_button.dart';
import '../widget/qrImage_download.dart';
import 'booking_fee_amount_card_widget.dart';

class BookingPayWithOnline extends StatelessWidget {
  const BookingPayWithOnline({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: Icon(Icons.arrow_back_ios, size: 20, color: AppColors.black)),
            const SizedBox(width: 10),
            Text(
              Strings.payWithOnline,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                BookingFeeAmountCardWidget(),
                const SizedBox(height: 20,),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                          child:  CircleAvatar(
                            radius: 120,
                            backgroundColor: Colors.white,
                            child: CachedNetworkImage(
                              imageUrl: provider.getAdmissionValue?.admission?.school?.schoolQrcode ?? '',
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Image.asset(
                                'asset/image/qr-code.jpg',
                                fit: BoxFit.cover,
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                'asset/image/qr-code.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      ),),
                      const SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          downloadAndShareQr(context, qrImageUrl: provider.getAdmissionValue?.admission?.school?.schoolQrcode ?? '');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset("asset/icon/download_icon.svg"),
                            const SizedBox(width: 12,),
                            Text("Download and Share",style: nunito.copyWith(
                                fontSize: 16,
                                color: Color(0xff1F78D2),
                                fontWeight: FontWeight.w600
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30,),

                Text(
                  Strings.howItWorks,style: nunito.copyWith(
                    fontSize: 18,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600
                ),),
                const SizedBox(height: 20,),

                Container(
                  width: kWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.greyShadeOne,
                      width: 1
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                Text(Strings.scan,style: nunitoSans.copyWith(
                                  fontSize: 14,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w700,
                                ),),
                                SizedBox(
                                  width: kWidth * 0.75,
                                  child: Text(Strings.scanTheCenterQrWithUpi,style: nunitoSans.copyWith(
                                    fontSize: 14,
                                    color: AppColors.greyShadeTwo,
                                  ),),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Divider(
                          color: AppColors.greyShadeOne,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                  Strings.three,style: nunitoSans.copyWith(
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
                                Text(Strings.upload,style: nunitoSans.copyWith(
                                  fontSize: 14,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w700,
                                ),),
                                SizedBox(
                                  width: kWidth * 0.75,
                                  child: Text(Strings.screenShotSuccessScreen,style: nunitoSans.copyWith(
                                    fontSize: 14,
                                    color: AppColors.greyShadeTwo,
                                  ),),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Center(
                  child: SizedBox(
                    width: kWidth * 0.85,
                    child: Text(
                      Strings.alreadyMadePaymentParagraph,textAlign: TextAlign.center,style: nunitoSans.copyWith(
                        fontSize: 14,
                        color: AppColors.greyShadeTwo,
                        fontWeight: FontWeight.w400
                    ),),
                  ),
                ),
                const SizedBox(height: 25,),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.UPLOADSCREENSHOTSCREEN);
                  },
                  child: CustomButton(
                    buttonWidth: kWidth,
                    buttonHeight: 50,
                    border: Border.all(
                      color: AppColors.orange,
                    ),
                    text: Strings.uploadScreenshot,
                    style:  nunitoSans.copyWith(
                        fontSize: 14,
                        color: AppColors.orange,
                        fontWeight: FontWeight.w700
                    ),),
                ),
                const SizedBox(height: 20,),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
