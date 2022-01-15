class CategoriesModel {
  CategoriesModel({
    this.maincode,
    this.code,
    this.error,
    this.data,
  });

  int maincode;
  int code;
  dynamic error;
  List<CategoriesDatum> data;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        maincode: json["Maincode"],
        code: json["code"],
        error: json["error"],
        data: List<CategoriesDatum>.from(
            json["data"].map((x) => CategoriesDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Maincode": maincode,
        "code": code,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoriesDatum {
  CategoriesDatum({
    this.id,
    this.name,
    this.img,
    this.link,
    this.background,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.doctors,
  });

  int id;
  String name;
  String img;
  String link;
  String background;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  List<Doctor> doctors;

  factory CategoriesDatum.fromJson(Map<String, dynamic> json) =>
      CategoriesDatum(
        id: json["id"],
        name: json["name"],
        img: json["img"],
        link: json["link"],
        background: json["background"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        doctors:
            List<Doctor>.from(json["doctors"].map((x) => Doctor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
        "link": link,
        "background": background,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "doctors": List<dynamic>.from(doctors.map((x) => x.toJson())),
      };
}

class Doctor {
  Doctor({
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
    this.live,
    this.from,
    this.eduction,
    this.review,
  });

  int id;
  String name;
  String category;
  String img;
  String gender;
  String description;
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
  String live;
  String from;
  String eduction;
  String review;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
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
        live: json["live"],
        from: json["from"],
        eduction: json["eduction"],
        review: json["review"],
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
        "live": live,
        "from": from,
        "eduction": eduction,
        "review": review,
      };
}
