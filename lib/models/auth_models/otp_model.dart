class VerifyCodeResponseModel {
  VerifyCodeResponseModel({
    this.maincode,
    this.code,
    this.token,
    this.error,
    this.data,
  });

  int maincode;
  int code;
  String token;
  dynamic error;
  Data data;

  factory VerifyCodeResponseModel.fromJson(Map<String, dynamic> json) =>
      VerifyCodeResponseModel(
        maincode: json["Maincode"],
        code: json["code"],
        token: json["token"],
        error: json["error"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "Maincode": maincode,
        "code": code,
        "token": token,
        "error": error,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.emailVerifiedAt,
    this.groupId,
    this.main,
    this.info,
    this.img,
    this.isCompany,
    this.city,
    this.workType,
    this.verifyCode,
    this.apiToken,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String email;
  String mobile;
  dynamic emailVerifiedAt;
  dynamic groupId;
  String main;
  dynamic info;
  dynamic img;
  int isCompany;
  dynamic city;
  dynamic workType;
  String verifyCode;
  String apiToken;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        emailVerifiedAt: json["email_verified_at"],
        groupId: json["group_id"],
        main: json["main"],
        info: json["info"],
        img: json["img"],
        isCompany: json["is_company"],
        city: json["city"],
        workType: json["work_type"],
        verifyCode: json["verify_code"],
        apiToken: json["api_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "email_verified_at": emailVerifiedAt,
        "group_id": groupId,
        "main": main,
        "info": info,
        "img": img,
        "is_company": isCompany,
        "city": city,
        "work_type": workType,
        "verify_code": verifyCode,
        "api_token": apiToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
