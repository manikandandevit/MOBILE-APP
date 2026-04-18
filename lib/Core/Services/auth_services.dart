import 'dart:developer';
import '../../Models/login_models.dart';
import 'ServicesStorage/api_services.dart';
import 'ServicesStorage/app_storage.dart';
import 'ServicesStorage/end_points.dart';

class AuthServices {
  final ApiService api;

  AuthServices(this.api);

  Future<bool> loginApi({
    required String emailId,
    required String password,}) async {
    try {
      final res = await api.post(Endpoints.login,
        {"email": emailId, "password": password,},);
      if (!res.success) {
        return false;
      }
      final loginModel = LoginModel(
        success: res.success,
        data: Data.fromJson(res.data),
      );
      final data = loginModel.data;
      if (data == null) return false;

      /// 🔹 Tokens
      await AppStorage.setData(
        AppStorage.keyIsBearerToken,
        data.accessToken,
      );

      await AppStorage.setData(
        AppStorage.keyIsRefreshToken,
        data.refreshToken,
      );

      /// 🔹 Store User (FULL OBJECT)
      if (data.user != null) {
        await AppStorage.setJson(
          AppStorage.keyUser,
          data.user!.toJson(),
        );
      }

      /// 🔹 Store School (FULL OBJECT)
      if (data.school != null) {
        await AppStorage.setJson(
          AppStorage.keySchool,
          data.school!.toJson(),
        );
      }

      return true;
    } catch (e, st) {
      log('Login error: $e\n$st');
      return false;
    }
  }
}
