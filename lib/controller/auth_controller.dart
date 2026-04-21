import 'package:flutter/cupertino.dart';
import '../Core/Services/auth_services.dart';

class AuthController extends ChangeNotifier {
  final AuthServices authService;

  AuthController(this.authService);

  final pageController = PageController();
  int currentPage = 0;

  bool isPasswordHidden = true;
  bool isButtonEnabled = false;
  bool forgotisButtonEnabled = false;
  bool isLoading = false;

  final formkey = GlobalKey<FormState>();
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  final emailController = TextEditingController(text: "advik1729@gmail.com");
  final passwordController = TextEditingController(text: "Test@123");
  final registerController = TextEditingController();
  final forgotemailController = TextEditingController();

  Future<bool> loginApi({required String emailId, required String password}) async {
    try {
      isLoading = true;
      notifyListeners();
      return await authService.loginApi(emailId: emailId, password: password);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void changePage(int index) {
    currentPage = index;
    notifyListeners();
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void togglePassword() {
    isPasswordHidden = !isPasswordHidden;
    notifyListeners();
  }

  void checkFields() {
    final email = emailController.text.trim();
    final password = passwordController.text;
    isButtonEnabled =
        email.isNotEmpty && email.contains('@') && password.isNotEmpty;
    notifyListeners();
  }

  void checkFields2() {
    if (forgotemailController.text.isNotEmpty) {
      forgotisButtonEnabled = true;
    } else {
      forgotisButtonEnabled = false;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    registerController.dispose();
    forgotemailController.dispose();
    pageController.dispose();
    super.dispose();
  }
}
