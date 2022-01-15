class BookingResponseModel {
  BookingResponseModel({
    this.status,
    this.statusCode,
    this.error,
    this.data,
    this.code,
  });

  String status;
  String statusCode;
  String error;
  String data;
  dynamic code;

  factory BookingResponseModel.fromJson(Map<String, dynamic> json) =>
      BookingResponseModel(
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
