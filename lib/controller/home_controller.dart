
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Core/Services/ServicesStorage/app_storage.dart';
import '../Core/Services/home_services.dart';
import '../Models/get_admission_models.dart';
import '../Models/login_models.dart';

class HomeController extends ChangeNotifier {
  late HomeServices homeServices;
  GetAdmissionData? getAdmission;
  bool loadingValue = false;
  GetAdmissionData? get getAdmissionValue => getAdmission;
  bool get loading => loadingValue;
  String schoolName = "";
  String schoolImage = "";
  String admissionId = "";
  static const parentName = "";
  static const studentName = "";
  static const parentPhoneNumber = "";
  File? selectedImage;
  String? fileName;
  bool uploadSuccess = false;
  final amount = TextEditingController();
  final formkey = GlobalKey<FormState>();


  HomeController(){
    homeServices = HomeServices();
    loadUser();
  }

  boolUploadSuccess(bool value){
    uploadSuccess = value;
    notifyListeners();
  }

  void loadUser() {
    final userJson = AppStorage.getJson(AppStorage.keyUser);
    final schoolJson = AppStorage.getJson(AppStorage.keySchool);
    final user = userJson == null ? null : User.fromJson(userJson);
    fetchAdmission(user?.admissionId ?? ''.toString());
    final school = schoolJson == null ? null : School.fromJson(schoolJson);
    schoolName = school?.schoolName ?? '';
    schoolImage = school?.schoolLogo ?? '';
    admissionId = user?.admissionId ?? ''.toString();
  }

  Future<void> fetchAdmission(String admissionId) async {
    loadingValue = true;
    notifyListeners();
    try {
      getAdmission = await homeServices.getAdmission(admissionId: admissionId);
    } catch (e) {
      debugPrint(e.toString());
    }
    loadingValue = false;
    notifyListeners();
  }

  Future<bool> patchMarkSubmitted(String admissionId) async {
    loadingValue = true;
    notifyListeners();
    try {
      final bool success = await homeServices.markFormSubmitted(admissionId);
      return success;
    } catch (e) {
      debugPrint("patchMarkSubmitted error: $e");
      return false;
    } finally {
      loadingValue = false;
      notifyListeners();
    }
  }

  int getCurrentStep() {
    final status = getAdmissionValue?.admission?.status;

    switch (status) {
      case "link_sent" || "payment_pending":
        return 1; // Booking Fee done

      case "payment_verified":
        return 2; // Registration done

      case "form_submitted" || "student_details_entered":
        return 3;

      case "approved":
        return 4; // Admission step

      default:
        return 0; // Nothing started
    }
  }

  Future<void> submitPayment() async {
    if (loadingValue) return;
    if (selectedImage == null) {
      Fluttertoast.showToast(
        msg: "Please select screenshot",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return;
    }
    loadingValue = true;
    notifyListeners();
    try {
      final success = await homeServices.uploadPaymentScreenshot(
        admissionId: admissionId,
        amount: amount.text.trim(),
        screenshot: selectedImage!,
      );
      uploadSuccess = success;
      if (success) {
        selectedImage = null;
        amount.clear();
      }
      Fluttertoast.showToast(
        msg: success
            ? "Upload Success"
            : "Upload Failed. Try again later",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } finally {
      loadingValue = false;
      notifyListeners();
    }
  }

  DateTime? lastBackPressed;
  Future<bool> onWillPop() async {
    final now = DateTime.now();
    if (lastBackPressed == null ||
        now.difference(lastBackPressed!) > const Duration(seconds: 2)) {
      lastBackPressed = now;
      Fluttertoast.showToast(
        msg: "Press back again to exit BrightKid",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return false;
    }
    return true;
  }

  String formatLevel(String? value) {
    if (value == null || value.isEmpty) return '';
    return value[0].toUpperCase() + value.substring(1);
  }


}
