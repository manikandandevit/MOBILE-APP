import 'dart:io';

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
