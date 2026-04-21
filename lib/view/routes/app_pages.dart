import 'package:bright_kid/view/booking/booking_fee.dart';
import 'package:bright_kid/view/booking/offline_payment.dart';
import 'package:bright_kid/view/booking/upload_screenshot_screen.dart';
import 'package:flutter/material.dart';

import '../Profile/profile_screen.dart';
import '../admission/under_review_screen.dart';
import '../auth/loginflow/forgot_password.dart';
import '../auth/onboarding/onboarding.dart';
import '../auth/splash/splash_screen.dart';
import '../booking/booking_fee_success.dart';
import '../booking/booking_pay_with_online.dart';
import '../booking/booking_payment_failed.dart';
import '../bottomnavigationbar/bottom_nav_bar_view.dart';
import '../home/Verify_detail_screens.dart';
import '../home/jot_form_screen.dart';
import '../home/parent_home_screen.dart';
import '../home/pickup_details_screen.dart';
import '../home/profile_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final Map<String, WidgetBuilder> routes = {
    Routes.SPLASH: (context) => const SplashScreen(),
    Routes.ONBOARDING: (context) => Onboarding(),
    Routes.BOOKINGFEESUCCESS: (context) => BookingFeeSuccess(),
    Routes.BOOKINGPAYMENTFAILED: (context) => BookingPaymentFailed(),
    Routes.BOOKINGPAYWITHONLINE: (context) => BookingPayWithOnline(),
    Routes.FORGOTPASSWORD: (context) => ForgotPassword(),
    Routes.BOTTOMNAVIGATIONBAR: (context) => BottomNavScreen(),
    Routes.PARENTHOMESCREENBAR: (context) => SchoolHomeScreen(),
    Routes.BOOKINGFEESCREEN: (context) => BookingFee(),
    Routes.UPLOADSCREENSHOTSCREEN: (context) => UploadScreenshotScreen(),
    Routes.JOTFORMSCREEN: (context) => JotFormScreen(),
    Routes.VERIFYDETAILSCREEN: (context) => VerifyDetailScreens(),
    Routes.ADMISSIONUNDERREVIEWSCREEN: (context) => AdmissionUnderReviewPage(),
    Routes.OFFLINEPAYMENT: (context) => OfflinePayment(),
    Routes.PROFILEVERIFYSCREEN: (context) => ProfileVerifyScreen(),
    Routes.PICKUPDETAILSSCREEN: (context) => PickupDetailsScreen(),
  };
}