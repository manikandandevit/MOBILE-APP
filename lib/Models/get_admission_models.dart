
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
  final DateTime? approvedAt;
  final String? schoolId;
  final DateTime? paymentVerifiedAt;
  final DateTime? formSubmittedAt;
  final DateTime? studentDetailsEnteredAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Onboarding? onboarding;
  final List<VerificationMessage>? verificationMessages;
  final UserDetails? user;
  final VerifyDetails? verifyDetails;
  final PickupProgress? pickupProgress;
  final SchoolDetails? school;

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
    this.schoolId,
    this.paymentVerifiedAt,
    this.formSubmittedAt,
    this.studentDetailsEnteredAt,
    this.createdAt,
    this.updatedAt,
    this.onboarding,
    this.verificationMessages,
    this.user,
    this.verifyDetails,
    this.pickupProgress,
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
    approvedAt: json["approved_at"] == null ? null : DateTime.parse(json["approved_at"]),
    schoolId: json["school_id"],
    paymentVerifiedAt: json["payment_verified_at"] == null ? null : DateTime.parse(json["payment_verified_at"]),
    formSubmittedAt: json["form_submitted_at"] == null ? null : DateTime.parse(json["form_submitted_at"]),
    studentDetailsEnteredAt: json["student_details_entered_at"] == null ? null : DateTime.parse(json["student_details_entered_at"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    onboarding: json["onboarding"] == null ? null : Onboarding.fromJson(json["onboarding"]),
    verificationMessages: json["verification_messages"] == null ? [] : List<VerificationMessage>.from(json["verification_messages"]!.map((x) => VerificationMessage.fromJson(x))),
    user: json["user"] == null ? null : UserDetails.fromJson(json["user"]),
    verifyDetails: json["verify_details"] == null ? null : VerifyDetails.fromJson(json["verify_details"]),
    pickupProgress: json["pickup_progress"] == null ? null : PickupProgress.fromJson(json["pickup_progress"]),
    school: json["school"] == null ? null : SchoolDetails.fromJson(json["school"]),
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
    "approved_at": approvedAt?.toIso8601String(),
    "school_id": schoolId,
    "payment_verified_at": paymentVerifiedAt?.toIso8601String(),
    "form_submitted_at": formSubmittedAt?.toIso8601String(),
    "student_details_entered_at": studentDetailsEnteredAt?.toIso8601String(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "onboarding": onboarding?.toJson(),
    "verification_messages": verificationMessages == null ? [] : List<dynamic>.from(verificationMessages!.map((x) => x.toJson())),
    "user": user?.toJson(),
    "verify_details": verifyDetails?.toJson(),
    "pickup_progress": pickupProgress?.toJson(),
    "school": school?.toJson(),
  };
}

class Onboarding {
  final bool? isPickupAdded;
  final bool? isProfileSetup;
  final bool? isVerified;

  Onboarding({
    this.isPickupAdded,
    this.isProfileSetup,
    this.isVerified,
  });

  factory Onboarding.fromJson(Map<String, dynamic> json) => Onboarding(
    isPickupAdded: json["is_pickup_added"],
    isProfileSetup: json["is_profile_setup"],
    isVerified: json["is_verified"],
  );

  Map<String, dynamic> toJson() => {
    "is_pickup_added": isPickupAdded,
    "is_profile_setup": isProfileSetup,
    "is_verified": isVerified,
  };
}

class PickupProgress {
  final int? totalRequired;
  final int? completed;
  final int? remaining;

  PickupProgress({
    this.totalRequired,
    this.completed,
    this.remaining,
  });

  factory PickupProgress.fromJson(Map<String, dynamic> json) => PickupProgress(
    totalRequired: json["total_required"],
    completed: json["completed"],
    remaining: json["remaining"],
  );

  Map<String, dynamic> toJson() => {
    "total_required": totalRequired,
    "completed": completed,
    "remaining": remaining,
  };
}

class SchoolDetails {
  final String? schoolQrcode;
  final bool? payViaApp;
  final String? schoolName;

  SchoolDetails({
    this.schoolQrcode,
    this.payViaApp,
    this.schoolName,
  });

  factory SchoolDetails.fromJson(Map<String, dynamic> json) => SchoolDetails(
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

class UserDetails {
  final String? id;
  final String? name;
  final String? email;
  final int? phone;
  final String? passwordHash;
  final String? profilePic;
  final String? role;
  final String? schoolCode;
  final String? level;
  final bool? initialLogin;
  final bool? isActive;
  final dynamic fcmDeviceToken;
  final String? schoolId;
  final DateTime? dob;
  final String? fatherMobile;
  final String? motherMobile;
  final List<dynamic>? notices;
  final DateTime? timestamp;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserDetails({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.passwordHash,
    this.profilePic,
    this.role,
    this.schoolCode,
    this.level,
    this.initialLogin,
    this.isActive,
    this.fcmDeviceToken,
    this.schoolId,
    this.dob,
    this.fatherMobile,
    this.motherMobile,
    this.notices,
    this.timestamp,
    this.createdAt,
    this.updatedAt,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    passwordHash: json["password_hash"],
    profilePic: json["profile_pic"],
    role: json["role"],
    schoolCode: json["school_code"],
    level: json["level"],
    initialLogin: json["initial_login"],
    isActive: json["is_active"],
    fcmDeviceToken: json["fcm_device_token"],
    schoolId: json["school_id"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    fatherMobile: json["father_mobile"],
    motherMobile: json["mother_mobile"],
    notices: json["notices"] == null ? [] : List<dynamic>.from(json["notices"]!.map((x) => x)),
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "password_hash": passwordHash,
    "profile_pic": profilePic,
    "role": role,
    "school_code": schoolCode,
    "level": level,
    "initial_login": initialLogin,
    "is_active": isActive,
    "fcm_device_token": fcmDeviceToken,
    "school_id": schoolId,
    "dob": dob?.toIso8601String(),
    "father_mobile": fatherMobile,
    "mother_mobile": motherMobile,
    "notices": notices == null ? [] : List<dynamic>.from(notices!.map((x) => x)),
    "timestamp": timestamp?.toIso8601String(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class VerificationMessage {
  final String? message;
  final SentBy? sentBy;
  final DateTime? createdAt;
  final String? id;

  VerificationMessage({
    this.message,
    this.sentBy,
    this.createdAt,
    this.id,
  });

  factory VerificationMessage.fromJson(Map<String, dynamic> json) => VerificationMessage(
    message: json["message"],
    sentBy: sentByValues.map[json["sent_by"]]!,
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "sent_by": sentByValues.reverse[sentBy],
    "created_at": createdAt?.toIso8601String(),
    "_id": id,
  };
}

enum SentBy {
  PARENT
}

final sentByValues = EnumValues({
  "parent": SentBy.PARENT
});

class VerifyDetails {
  final String? studentName;
  final DateTime? dob;
  final String? level;
  final int? registeredMobile;
  final String? registeredEmail;
  final String? fatherMobile;
  final String? motherMobile;

  VerifyDetails({
    this.studentName,
    this.dob,
    this.level,
    this.registeredMobile,
    this.registeredEmail,
    this.fatherMobile,
    this.motherMobile,
  });

  factory VerifyDetails.fromJson(Map<String, dynamic> json) => VerifyDetails(
    studentName: json["student_name"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    level: json["level"],
    registeredMobile: json["registered_mobile"],
    registeredEmail: json["registered_email"],
    fatherMobile: json["father_mobile"],
    motherMobile: json["mother_mobile"],
  );

  Map<String, dynamic> toJson() => {
    "student_name": studentName,
    "dob": dob?.toIso8601String(),
    "level": level,
    "registered_mobile": registeredMobile,
    "registered_email": registeredEmail,
    "father_mobile": fatherMobile,
    "mother_mobile": motherMobile,
  };
}

class Errors {
  Errors();

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
  );

  Map<String, dynamic> toJson() => {
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
