class CommentsModel {
  CommentsModel({
    this.maincode,
    this.code,
    this.error,
    this.data,
  });

  int maincode;
  int code;
  dynamic error;
  List<Datum> data;

  factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
        maincode: json["Maincode"],
        code: json["code"],
        error: json["error"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Maincode": maincode,
        "code": code,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.postId,
    this.comment,
    this.status,
    this.sender,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int postId;
  String comment;
  String status;
  String sender;
  String email;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        postId: json["post_id"],
        comment: json["comment"] == null ? null : json["comment"],
        status: json["status"],
        sender: json["sender"] == null ? null : json["sender"],
        email: json["email"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "post_id": postId,
        "comment": comment == null ? null : comment,
        "status": status,
        "sender": sender == null ? null : sender,
        "email": email,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
