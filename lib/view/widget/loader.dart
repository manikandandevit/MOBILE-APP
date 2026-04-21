import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Core/Services/ServicesStorage/api_services.dart';
import '../../Core/Services/ServicesStorage/app_storage.dart';
import '../auth/loginflow/login.dart';

class LogoLoader extends StatelessWidget {
  const LogoLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 🔹 Logo Image
            Image.asset(
              'asset/image/bright_kid_logo.png',
              width: 50,
              height: 50,
            ),

            // 🔹 Circular Progress
            const SizedBox(
              width: 35,
              height: 35,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showCupertinoLogoutDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: const Text("Logout"),
      content: const Text("Are you sure you want to logout?"),
      actions: [
        CupertinoDialogAction(
          child: const Text("Cancel"),
          onPressed: () => Navigator.pop(context),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: const Text("Logout"),
          onPressed: () {
            AppStorage.logoutClear();
            ApiService.logout();
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
          },
        ),
      ],
    ),
  );
}