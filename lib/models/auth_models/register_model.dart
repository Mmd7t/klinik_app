class RegisterModel {
  String name;
  String email;
  String password;
  String mobile;

  RegisterModel({
    this.email,
    this.name,
    this.password,
    this.mobile,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        name: json['name'],
        email: json['email'],
        password: json['password'],
        mobile: json['mobile'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'mobile': mobile,
      };
}

class RegisterResponseModel {
  RegisterResponseModel({
    this.status,
    this.statusCode,
    this.error,
    this.data,
    this.code,
  });

  String status;
  String statusCode;
  dynamic error;
  String data;
  int code;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        status: json["status"],
        statusCode: json["statusCode"],
        error: json["error"],
        data: json["data"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
        "error": error,
        "data": data,
        "code": code,
      };
}
