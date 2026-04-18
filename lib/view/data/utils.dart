import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


late double kHeight;
late double kWidth;
late double kShortestSide;

late bool kIsSmallScreen;
late bool kIsMediumScreen;
late bool kIsLargeScreen;

// void initResponsiveValues() {
//   print("response call");
//   final size = Get.size;
//
//   kShortestSide = size.shortestSide;
//   kHeight = size.height;
//   kWidth = size.width;
//
//   // Define size thresholds
//   kIsSmallScreen = size.shortestSide <= 360;
//   kIsMediumScreen = size.shortestSide > 360 && size.shortestSide <= 600;
//   kIsLargeScreen = size.shortestSide > 600;
//
//   // Apply scaling factors to accommodate different screen sizes
//   double baseHeight = 800.0; // Base height for scaling
//   double baseWidth = 400.0; // Base width for scaling
//
//   // Calculate ratios for scaling
//   double heightRatio = size.height / baseHeight;
//   double widthRatio = size.width / baseWidth;
//
//   // Scale layout based on screen size
//   if (kIsLargeScreen) {
//     kHeight =
//         (size.height * heightRatio).clamp(size.height * 0.9, size.height * 1.1);
//     kWidth =
//         (size.width * widthRatio).clamp(size.width * 0.9, size.width * 1.2);
//   } else {
//     kHeight = size.height;
//     kWidth = size.width;
//   }
// }

void initResponsiveValues(BuildContext context) {
  print("response call");
  final size = MediaQuery.of(context).size;

  // READ-ONLY screen size
  kHeight = size.height;
  kWidth = size.width;
  kShortestSide = size.shortestSide;

  // Screen classification (correct for iPad)
  kIsSmallScreen = kShortestSide < 360;          // small phones
  kIsMediumScreen = kShortestSide >= 360 && kShortestSide < 600; // phones
  kIsLargeScreen = kShortestSide >= 600;         // tablets / iPads

  // ⚠️ IMPORTANT:
  // Do NOT scale screen size
  // Just clamp usable width for tablets
  if (kIsLargeScreen) {
    // Keep height as-is
    kHeight = size.height;

    // Limit content width so UI doesn’t stretch on iPad
    kWidth = (size.width)
        .clamp(size.width * 0.9, size.width);

  } else {
    // Phones → full width
    kHeight = size.height;
    kWidth = size.width;
  }
}

