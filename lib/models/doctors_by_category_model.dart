class DoctorsByCategoryModel {
  DoctorsByCategoryModel({
    this.maincode,
    this.code,
    this.error,
    this.data,
  });

  int maincode;
  int code;
  dynamic error;
  List<Datum> data;

  factory DoctorsByCategoryModel.fromJson(Map<String, dynamic> json) =>
      DoctorsByCategoryModel(
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
    this.name,
    this.category,
    this.img,
    this.gender,
    this.description,
    this.facebook,
    this.twitter,
    this.instagram,
    this.linkedin,
    this.whatsapp,
    this.rank,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.profileCover,
  });

  int id;
  String name;
  String category;
  String img;
  String gender;
  dynamic description;
  String facebook;
  dynamic twitter;
  dynamic instagram;
  dynamic linkedin;
  dynamic whatsapp;
  int rank;
  int categoryId;
  DateTime createdAt;
  DateTime updatedAt;
  String profileCover;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        img: json["img"],
        gender: json["gender"],
        description: json["description"],
        facebook: json["facebook"] == null ? null : json["facebook"],
        twitter: json["twitter"],
        instagram: json["instagram"],
        linkedin: json["linkedin"],
        whatsapp: json["whatsapp"],
        rank: json["rank"],
        categoryId: json["category_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        profileCover: json["profile_cover"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "img": img,
        "gender": gender,
        "description": description,
        "facebook": facebook == null ? null : facebook,
        "twitter": twitter,
        "instagram": instagram,
        "linkedin": linkedin,
        "whatsapp": whatsapp,
        "rank": rank,
        "category_id": categoryId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "profile_cover": profileCover,
      };
}
