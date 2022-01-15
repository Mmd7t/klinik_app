class LoginModel {
  String phone;
  String password;

  LoginModel({this.phone, this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(phone: json['mobile'], password: json['password']);

  Map<String, dynamic> toJson() => {'mobile': phone, 'password': password};
}

class LoginResponseModel {
  LoginResponseModel({
    this.maincode,
    this.code,
    this.data,
    this.error,
  });

  int maincode;
  int code;
  Data data;
  dynamic error;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        maincode: json["maincode"],
        code: json["code"],
        data: Data.fromJson(json["data"]),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "maincode": maincode,
        "code": code,
        "data": data.toJson(),
        "error": error,
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
  String workType;
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
