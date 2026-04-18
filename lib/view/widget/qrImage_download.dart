import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

Future<void> downloadAndShareQr(BuildContext context, {required String qrImageUrl}) async {
  try {
    final dio = Dio();
    final directory = await getTemporaryDirectory();
    final filePath = "${directory.path}/payment_qr.png";

    /// DOWNLOAD QR
    await dio.download(
      qrImageUrl,
      filePath,
      options: Options(
        responseType: ResponseType.bytes,
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    /// SHARE QR
    await Share.shareXFiles([
      XFile(filePath),
    ], text: "Scan this QR to complete the payment");
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Download / Share failed")));
  }
}

Future<File?> pickScreenshotFromGallery(BuildContext context) async {
  try {
    PermissionStatus status;

    /// ✅ ANDROID PERMISSION HANDLING
    if (Platform.isAndroid) {
      if (await Permission.photos.isGranted ||
          await Permission.storage.isGranted) {
        status = PermissionStatus.granted;
      } else {
        status = await Permission.photos.request();
        if (!status.isGranted) {
          status = await Permission.storage.request();
        }
      }
    } else {
      status = await Permission.photos.request();
    }

    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Gallery permission is required"),
        ),
      );
      return null;
    }

    /// ✅ OPEN GALLERY
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return null; // user cancelled
    }

    return File(pickedFile.path);
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Failed to pick image")),
    );
    return null;
  }
}