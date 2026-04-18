
class LoginModel {
  final bool? success;
  final int? httpCode;
  final dynamic errorCode;
  final String? message;
  final Data? data;
  final Errors? errors;
  final DateTime? timestamp;

  LoginModel({
    this.success,
    this.httpCode,
    this.errorCode,
    this.message,
    this.data,
    this.errors,
    this.timestamp,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["success"],
    httpCode: json["httpCode"],
    errorCode: json["errorCode"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
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

class Data {
  final int? code;
  final String? message;
  final String? accessToken;
  final String? refreshToken;
  final User? user;
  final School? school;

  Data({
    this.code,
    this.message,
    this.accessToken,
    this.refreshToken,
    this.user,
    this.school,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    code: json["code"],
    message: json["message"],
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    school: json["school"] == null ? null : School.fromJson(json["school"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "accessToken": accessToken,
    "refreshToken": refreshToken,
    "user": user?.toJson(),
    "school": school?.toJson(),
  };
}

class School {
  final String? schoolCode;
  final String? schoolName;
  final String? schoolLogo;
  final String? city;
  final String? state;
  final int? pincode;

  School({
    this.schoolCode,
    this.schoolName,
    this.schoolLogo,
    this.city,
    this.state,
    this.pincode,
  });

  factory School.fromJson(Map<String, dynamic> json) => School(
    schoolCode: json["school_code"],
    schoolName: json["school_name"],
    schoolLogo: json["school_logo"],
    city: json["city"],
    state: json["state"],
    pincode: json["pincode"],
  );

  Map<String, dynamic> toJson() => {
    "school_code": schoolCode,
    "school_name": schoolName,
    "school_logo": schoolLogo,
    "city": city,
    "state": state,
    "pincode": pincode,
  };
}

class User {
  final String? id;
  final String? name;
  final String? email;
  final String? profilePic;
  final String? role;
  final String? schoolCode;
  final bool? isActive;
  final String? level;
  final String? admissionId;

  User({
    this.id,
    this.name,
    this.email,
    this.profilePic,
    this.role,
    this.schoolCode,
    this.isActive,
    this.level,
    this.admissionId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    profilePic: json["profile_pic"],
    role: json["role"],
    schoolCode: json["school_code"],
    isActive: json["is_active"],
    level: json["level"],
    admissionId: json["admission_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "profile_pic": profilePic,
    "role": role,
    "school_code": schoolCode,
    "is_active": isActive,
    "level": level,
    "admission_id": admissionId,
  };
}

class Errors {
  Errors();

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
  );

  Map<String, dynamic> toJson() => {
  };
}
