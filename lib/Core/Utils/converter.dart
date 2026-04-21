import 'dart:math';
import 'dart:math' as maths;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


DateTime stringdatetodate(String dateStr) {
  DateTime dateTime = DateTime.parse(dateStr);
  return dateTime;
}

String stringdateformat(String dateStr) {
  if (dateStr.isEmpty) return '';
  DateTime dateTime = DateTime.parse(dateStr);
  DateTime localDate = dateTime.toLocal();
  return DateFormat('dd/MM/yyyy').format(localDate);
}

TimeOfDay timeformat(String dateStr) {
  DateTime dateTime = DateTime.parse(dateStr);
  DateTime localDate = dateTime.toLocal();
  final timeOfDay = TimeOfDay(hour: localDate.hour, minute: localDate.minute);
  return timeOfDay;
}

String stringtimeformat(TimeOfDay picked) {
  final now = DateTime.now();
  final dt = DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
  final formattedTime = DateFormat('hh:mm a').format(dt);
  return formattedTime;
}

String stringtimewithampmformat(String time) {
  final parts = time.split(':');
  final hour24 = int.parse(parts[0]);
  final minute = int.parse(parts[1]);
  final isAm = hour24 < 12;
  final hour12 = hour24 % 12 == 0 ? 12 : hour24 % 12;
  final period = isAm ? 'AM' : 'PM';
  return '${hour12.toString().padLeft(2, '0')}:'
      '${minute.toString().padLeft(2, '0')} $period';
}

String convertToIST(String utcString) {
  DateTime utcDate = DateTime.parse(utcString);
  DateTime istDate = utcDate.toLocal();
  return DateFormat('yyyy-MM-dd hh:mm a').format(istDate);
}

String convertToISTime(String utcString) {
  DateTime utcDate = DateTime.parse(utcString);
  DateTime istDate = utcDate.toLocal();
  return DateFormat('hh:mm a').format(istDate);
}

String dateStringtoformat(String date) {
  DateTime newdate = DateTime.parse(date);
  DateTime localDate = newdate.toLocal();
  return DateFormat.yMMMMEEEEd().format(localDate);
}

String projectdateformate(String date) {
  DateTime newdate = DateTime.parse(date);
  DateTime localDate = newdate.toLocal();
  return DateFormat('MMM dd, yyyy').format(localDate);
}

String attendancedateStringtoformat(String date, {bool? isfullweek = false}) {
  DateTime newdate = DateTime.parse(date);
  DateTime localDate = newdate.toLocal();
  if (isfullweek!) {
    return DateFormat('dd MMM yyyy, EEEE').format(localDate);
  }
  return DateFormat('dd MMM yyyy, EEE').format(localDate);
}

String datetimestringconverter(String date) {
  DateTime newdate = DateTime.parse(date);
  DateTime localDate = newdate.toLocal();
  return DateFormat('MMM dd, yyyy  hh:mm a').format(localDate);
}

String getInitials(String? title) {
  if (title == null || title.isEmpty) return "";
  List<String> words = title.trim().split(' ');
  if (words.length == 1) {
    return words[0][0].toUpperCase();
  } else {
    return (words[0][0] + words[1][0]).toUpperCase();
  }
}

Color getLeaveColor(String? title) {
  if (title == null) return Colors.yellow; // default

  final normalized = title.trim().split(' ')[0].toLowerCase();
  switch (normalized) {
    case 'casual':
      return Color(0xFF4FC3F7); // Blue
    case 'sick':
      return Color(0xFFE57373); // Red
    case 'emergency':
      return Color(0xFFFFB74D); // Orange
    case 'maternity':
      return Color(0xFFBA68C8); // Purple
    default:
      return Color(0xFFFFD54F); // Default Yellow
  }
}

String formatBytes(int bytes, [int decimals = 2]) {
  if (bytes <= 0) return "0 B";
  const suffixes = ["B", "KB", "MB", "GB", "TB"];
  final i = (bytes == 0) ? 0 : (maths.log(bytes) / maths.log(1024)).floor();
  final size = (bytes / maths.pow(1024, i)).toStringAsFixed(decimals);
  return "$size ${suffixes[i]}";
}

String formatHM(double decimalHours) {
  final totalMinutes = (decimalHours * 60).round();
  final hours = totalMinutes ~/ 60;
  final minutes = totalMinutes % 60;

  final parts = <String>[];

  if (hours > 0) {
    parts.add('$hours ${hours == 1 ? "hour" : "hours"}');
  }

  if (minutes > 0) {
    parts.add('$minutes ${minutes == 1 ? "min" : "mins"}');
  }

  if (parts.isEmpty) {
    parts.add('0');
  }

  return parts.join(' ');
}

String formatHMValue(num decimalHours) {
  final totalMinutes = (decimalHours * 60).round();
  final hours = totalMinutes ~/ 60;
  final minutes = totalMinutes % 60;

  final parts = <String>[];

  if (hours > 0) {
    parts.add('$hours ${hours == 1 ? "hour" : "hours"}');
  }

  if (minutes > 0) {
    parts.add('$minutes ${minutes == 1 ? "min" : "mins"}');
  }

  if (parts.isEmpty) {
    parts.add('0');
  }

  return parts.join(' ');
}

extension StringCasingExt on String {
  String get capitalized =>
      isEmpty ? '' : this[0].toUpperCase() + substring(1).toLowerCase();

  String get upper => toUpperCase();

  String get lower => toLowerCase();
}

TimeOfDay parseTime(String timeString) {
  final parts = timeString.split(':');
  return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
}

String formatTime12Hour(String? time24) {
  if (time24 == null || time24.isEmpty) return '--:--';
  try {
    final dt = DateFormat('HH:mm').parse(time24);
    return DateFormat('hh:mm a').format(dt);
  } catch (e) {
    return time24;
  }
}

String formatIndianAmount(String? amount) {
  if (amount == null || amount == 'null' || amount == '') return '0';
  final numValue = num.parse(amount);
  final formatter = NumberFormat.decimalPattern('en_IN');
  return formatter.format(numValue);
}

bool isNetworkImage(String path) =>
    (path.contains('http') || path.contains('https'));

String getRandomString(int length) {
  const chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random rnd = Random();

  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
    ),
  );
}

String formatMaternityLeave(Map<String, dynamic>? leave) {
  if (leave == null) return "-";

  final bool isMaternity = leave['isMaternityPaternity'] == true;
  final String calcMode = leave['maternityCalcMode'] ?? "";

  // Normal leave → show days
  if (!isMaternity || calcMode != "month") {
    final int available = leave['available'] ?? 0;
    return "$available day${available > 1 ? "s" : ""}";
  }

  // Maternity leave → month based
  final int totalMonths = leave['total'] ?? 0;
  final int takenDays = leave['taken'] ?? 0;

  final int totalDays = totalMonths * 30; // 1 month = 30 days
  final int remainingDays = totalDays - takenDays;

  final int months = remainingDays ~/ 30;
  final int days = remainingDays % 30;

  String result = "";

  if (months > 0) {
    result += "$months month${months > 1 ? "s" : ""} ";
  }

  if (days > 0) {
    result += "$days day${days > 1 ? "s" : ""}";
  }

  return result.trim().isNotEmpty ? result.trim() : "0 day";
}

String formatLeaveValue(Map<String, dynamic>? leave) {
  if (leave == null) return "-";

  final bool isMaternity = leave['isMaternityPaternity'] == true;
  final int available = leave['available'] ?? 0;
  final String calcMode = leave['maternityCalcMode'] ?? "";

  if (isMaternity) {
    if (calcMode == "month") {
      return "$available month${available > 1 ? "s" : ""}";
    }
    return "$available day${available > 1 ? "s" : ""}";
  }

  return "$available day${available > 1 ? "s" : ""}";
}

String formatLeaveTotal(Map<String, dynamic>? leave) {
  if (leave == null) return "-";

  final bool isMaternity = leave['isMaternityPaternity'] == true;
  final int total = leave['total'] ?? 0;
  final String calcMode = leave['maternityCalcMode'] ?? "";

  if (isMaternity) {
    if (calcMode == "month") {
      return "$total month${total > 1 ? "s" : ""}";
    }
    return "$total day${total > 1 ? "s" : ""}";
  }

  return "$total day${total > 1 ? "s" : ""}";
}

Color getColorFromHex(String hexColor) {
  hexColor = hexColor.replaceFirst('#', '');
  return Color(int.parse('FF$hexColor', radix: 16));
}

extension StringCasingExtension on String {
  String capitalizeFirstLowerRest() {
    if (isEmpty) return this;
    final text = trim().toLowerCase();
    return text[0].toUpperCase() + text.substring(1);
  }
}
