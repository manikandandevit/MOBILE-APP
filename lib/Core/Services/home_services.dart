import 'dart:io';

import 'package:bright_kid/Core/Services/ServicesStorage/api_response.dart';
import 'package:bright_kid/Models/get_admission_models.dart';
import 'package:dio/dio.dart';

import 'ServicesStorage/api_services.dart';
import 'ServicesStorage/end_points.dart';

class HomeServices {
  late ApiService api;

  HomeServices() {
    api = ApiService();
  }

  Future<dynamic> getAdmission({required String admissionId}) async {
    final res = await api.get("${Endpoints.getAdmissionApi}/$admissionId");
    return GetAdmissionData.fromJson(res.data);
  }

  Future<dynamic> confirmStudentDetails({required String admissionId}) async {
    final ApiResponse res = await api.post("${Endpoints.confirmStudentDetailsSubmitted}/$admissionId",{});
    if(res.success == true){
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> requestStudentDetailsChange({required String admissionId, required String message}) async {
    final ApiResponse res = await api.post("${Endpoints.requestStudentDetailsChangeSubmitted}/$admissionId",{
      "message" : message,
    });
    if(res.success == true){
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> offlinePaymentApi({required String admissionId, required String amount, required String paymentMode, required String paymentDate, String? chequeDetails}) async {
    final ApiResponse res = await api.post("${Endpoints.postOfflinePaymentApi}/$admissionId",{
      "amount": amount,
      "payment_mode": paymentMode,
      "payment_date": paymentDate,
      "cheque_details" : chequeDetails ?? ''
    });
    if(res.success == true){
      return true;
    } else {
      return false;
    }
  }

  Future<bool> uploadPaymentScreenshot({
    required String admissionId,
    required String amount,
    required File? screenshot,
  }) async {
    try {
      final formData = FormData.fromMap({
        'amount': amount,
        'screenshot': await MultipartFile.fromFile(
          screenshot?.path ?? '',
          filename: screenshot?.path.split('/').last,
        ),
      });

      final response = await api.post(
        "${Endpoints.postUploadScreenApi}/$admissionId",
        formData,
      );

      if (response.data['code'] == 200) {
        print('SUCCESS: ${response.data}');
        return true;
      }
      return false;
    } on DioException catch (e) {
      print('DIO ERROR: ${e.response?.data}');
      return false;
    } catch (e) {
      print('ERROR: $e');
      return false;
    }
  }

  Future<bool> uploadProfileImage({
    required String admissionId,
    required File? screenshot,
  }) async {
    try {
      final formData = FormData.fromMap({
        'profile': await MultipartFile.fromFile(
          screenshot?.path ?? '',
          filename: screenshot?.path.split('/').last,
        ),
      });

      final response = await api.post(
        "${Endpoints.postProfileImageApi}/$admissionId",
        formData,
      );

      if (response.data['code'] == 200) {
        print('SUCCESS: ${response.data}');
        return true;
      }
      return false;
    } on DioException catch (e) {
      print('DIO ERROR: ${e.response?.data}');
      return false;
    } catch (e) {
      print('ERROR: $e');
      return false;
    }
  }

  Future<bool> markFormSubmitted(String admissionId) async {
    try {
      final response = await api.patch("${Endpoints.patchMarkSubmitted}/$admissionId",);
      if (response.success == true) {
        return true;
      }
      return false;
    }on DioException catch (e) {
      print('DIO ERROR: ${e.response?.data}');
      return false;
    } catch (e) {
      print('ERROR: $e');
      return false;
    }
  }
}
