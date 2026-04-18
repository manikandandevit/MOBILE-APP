
class GetAdmission {
  final bool? success;
  final int? httpCode;
  final dynamic errorCode;
  final String? message;
  final GetAdmissionData? data;
  final Errors? errors;
  final DateTime? timestamp;

  GetAdmission({
    this.success,
    this.httpCode,
    this.errorCode,
    this.message,
    this.data,
    this.errors,
    this.timestamp,
  });

  factory GetAdmission.fromJson(Map<String, dynamic> json) => GetAdmission(
    success: json["success"],
    httpCode: json["httpCode"],
    errorCode: json["errorCode"],
    message: json["message"],
    data: json["data"] == null ? null : GetAdmissionData.fromJson(json["data"]),
    errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "httpCode": httpCode,
    "errorCode": errorCode,
    "message": message,
    "data": data?.toJson(),
    "errors": errors?.toJson(),
    "timestamp": timestamp?.toIso8601String(),
  };
}

class GetAdmissionData {
  final int? code;
  final Admission? admission;

  GetAdmissionData({
    this.code,
    this.admission,
  });

  factory GetAdmissionData.fromJson(Map<String, dynamic> json) => GetAdmissionData(
    code: json["code"],
    admission: json["admission"] == null ? null : Admission.fromJson(json["admission"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "admission": admission?.toJson(),
  };
}

class Admission {
  final String? id;
  final String? admissionId;
  final String? schoolCode;
  final String? studentId;
  final String? studentName;
  final String? level;
  final String? parentName;
  final String? parentEmail;
  final String? parentMobile;
  final bool? isWhatsappNumber;
  final int? bookingFee;
  final String? jotformLink;
  final String? status;
  final String? paymentScreenshot;
  final dynamic approvedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? schoolId;
  final SchoolQr? school;

  Admission({
    this.id,
    this.admissionId,
    this.schoolCode,
    this.studentId,
    this.studentName,
    this.level,
    this.parentName,
    this.parentEmail,
    this.parentMobile,
    this.isWhatsappNumber,
    this.bookingFee,
    this.jotformLink,
    this.status,
    this.paymentScreenshot,
    this.approvedAt,
    this.createdAt,
    this.updatedAt,
    this.schoolId,
    this.school,
  });

  factory Admission.fromJson(Map<String, dynamic> json) => Admission(
    id: json["_id"],
    admissionId: json["admission_id"],
    schoolCode: json["school_code"],
    studentId: json["student_id"],
    studentName: json["student_name"],
    level: json["level"],
    parentName: json["parent_name"],
    parentEmail: json["parent_email"],
    parentMobile: json["parent_mobile"],
    isWhatsappNumber: json["isWhatsappNumber"],
    bookingFee: json["booking_fee"],
    jotformLink: json["jotform_link"],
    status: json["status"],
    paymentScreenshot: json["payment_screenshot"],
    approvedAt: json["approved_at"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    schoolId: json["school_id"],
    school: json["school"] == null ? null : SchoolQr.fromJson(json["school"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "admission_id": admissionId,
    "school_code": schoolCode,
    "student_id": studentId,
    "student_name": studentName,
    "level": level,
    "parent_name": parentName,
    "parent_email": parentEmail,
    "parent_mobile": parentMobile,
    "isWhatsappNumber": isWhatsappNumber,
    "booking_fee": bookingFee,
    "jotform_link": jotformLink,
    "status": status,
    "payment_screenshot": paymentScreenshot,
    "approved_at": approvedAt,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "school_id": schoolId,
    "school": school?.toJson(),
  };
}

class SchoolQr {
  final String? schoolQrcode;
  final bool? payViaApp;
  final String? schoolName;

  SchoolQr({
    this.schoolQrcode,
    this.payViaApp,
    this.schoolName,
  });

  factory SchoolQr.fromJson(Map<String, dynamic> json) => SchoolQr(
    schoolQrcode: json["school_qrcode"],
    payViaApp: json["pay_via_app"],
    schoolName: json["school_name"],
  );

  Map<String, dynamic> toJson() => {
    "school_qrcode": schoolQrcode,
    "pay_via_app": payViaApp,
    "school_name": schoolName,
  };
}

class Errors {
  Errors();

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
  );

  Map<String, dynamic> toJson() => {
  };
}
