import 'package:bright_kid/view/widget/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../controller/home_controller.dart';
import '../data/app_colors.dart';
import '../data/app_style.dart';
import '../routes/app_pages.dart';

class JotFormScreen extends StatefulWidget {
  const JotFormScreen({super.key});

  @override
  State<JotFormScreen> createState() => _JotFormScreenState();
}

class _JotFormScreenState extends State<JotFormScreen> {
  late final WebViewController controller;
  bool isLoading = true;
  bool showDoneButton = false;

  @override
  void initState() {
    super.initState();
    final provider = context.read<HomeController>();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() => isLoading = true);
          },
          onPageFinished: (url) async {
            setState(() {
              isLoading = false;
            });
            if (url.toLowerCase().contains("thank")) {
              setState(() {
                showDoneButton = true;
              });
              return;
            }
            final result = await controller.runJavaScriptReturningResult(
              "document.body.innerText",
            );
            if (result.toString().toLowerCase().contains("thank")) {
              setState(() {
                showDoneButton = true;
              });
            }
          },
          onWebResourceError: (error) {
            setState(() => isLoading = false);
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          provider.getAdmissionValue?.admission?.jotformLink ?? "",
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeController>();
    return PopScope(
      canPop: !showDoneButton,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: !showDoneButton,
          backgroundColor: AppColors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          leading: showDoneButton ? null : InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
          title: showDoneButton ? Center(
            child: Text(
              "Registration Form - ${provider.getAdmissionValue?.admission?.studentName ?? ""}",
              style: nunitoSans.copyWith(
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ) : Text(
            "Registration Form - ${provider.getAdmissionValue?.admission?.studentName ?? ""}",
            style: nunitoSans.copyWith(
              fontSize: 16,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Stack(
          children: [
            WebViewWidget(controller: controller),
            if (isLoading)
             LogoLoader()
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: showDoneButton ? FloatingActionButton.extended(
          backgroundColor: AppColors.orange,
          label: provider.loadingValue ?
          SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2,
            color: Colors.white,)) : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Done",
              style: nunito.copyWith(
                fontSize: 16,
                color: AppColors.white,
              ),
            ),
          ),
          onPressed: provider.loadingValue ? null : () async {
            final success = await provider.patchMarkSubmitted(
              provider.getAdmissionValue?.admission?.id ?? '',
            );
            if (!context.mounted) return;
            Fluttertoast.showToast(
              msg: success
                  ? "Form submitted successfully"
                  : "Failed to submit form. Try again later",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
            if(success){
              Navigator.pushReplacementNamed(context, Routes.PARENTHOMESCREENBAR);
            }
          },
        ) : null,
      ),
    );
  }
}