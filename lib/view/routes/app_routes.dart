part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const ONBOARDING = _Paths.ONBOARDING;
  static const BOOKINGFEESUCCESS = _Paths.BOOKINGFEESUCCESS;
  static const BOOKINGPAYMENTFAILED = _Paths.BOOKINGPAYMENTFAILED;
  static const BOOKINGPAYWITHONLINE = _Paths.BOOKINGPAYWITHONLINE;
  static const FORGOTPASSWORD = _Paths.FORGOTPASSWORD;
  static const BOTTOMNAVIGATIONBAR = _Paths.BOTTOMNAVIGATIONBAR;
  static const PARENTHOMESCREENBAR = _Paths.PARENTHOMESCREENBAR;
  static const BOOKINGFEESCREEN = _Paths.BOOKINGFEESCREEN;
  static const UPLOADSCREENSHOTSCREEN = _Paths.UPLOADSCREENSHOTSCREEN;
  static const JOTFORMSCREEN = _Paths.JOTFORMSCREEN;
  static const ADMISSIONUNDERREVIEWSCREEN = _Paths.ADMISSIONUNDERREVIEWSCREEN;

}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/';
  static const ONBOARDING = '/onboarding';
  static const BOOKINGFEESUCCESS = '/booking-success';
  static const BOOKINGPAYMENTFAILED = '/booking-payment-failed';
  static const BOOKINGPAYWITHONLINE = '/booking-pay-with-online';
  static const FORGOTPASSWORD = '/forgot-password';
  static const BOTTOMNAVIGATIONBAR = '/bottom-navigation-bar';
  static const PARENTHOMESCREENBAR = '/parent-home-screen';
  static const BOOKINGFEESCREEN = '/booking-fee-screen';
  static const UPLOADSCREENSHOTSCREEN = '/upload-screen-shot-screen';
  static const JOTFORMSCREEN = '/jot-form-screen';
  static const ADMISSIONUNDERREVIEWSCREEN = '/admission-under-review';

}