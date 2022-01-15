class AddCommentResponseModel {
  AddCommentResponseModel({
    this.maincode,
    this.code,
    this.error,
    this.data,
  });

  int maincode;
  int code;
  dynamic error;
  String data;

  factory AddCommentResponseModel.fromJson(Map<String, dynamic> json) =>
      AddCommentResponseModel(
        maincode: json["Maincode"],
        code: json["code"],
        error: json["error"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "Maincode": maincode,
        "code": code,
        "error": error,
        "data": data,
      };
}
