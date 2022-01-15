class DoctorDetailsModel {
  DoctorDetailsModel({
    this.maincode,
    this.code,
    this.error,
    this.data,
  });

  int maincode;
  int code;
  dynamic error;
  List<DoctorDetailsDatum> data;

  factory DoctorDetailsModel.fromJson(Map<String, dynamic> json) =>
      DoctorDetailsModel(
        maincode: json["Maincode"],
        code: json["code"],
        error: json["error"],
        data: List<DoctorDetailsDatum>.from(
            json["data"].map((x) => DoctorDetailsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Maincode": maincode,
        "code": code,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DoctorDetailsDatum {
  DoctorDetailsDatum({
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
    this.workingtiome,
  });

  int id;
  String name;
  String category;
  String img;
  String gender;
  String description;
  dynamic facebook;
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
  List<Workingtiome> workingtiome;

  factory DoctorDetailsDatum.fromJson(Map<String, dynamic> json) =>
      DoctorDetailsDatum(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        img: json["img"],
        gender: json["gender"],
        description: json["description"],
        facebook: json["facebook"],
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
        workingtiome: List<Workingtiome>.from(
            json["workingtiome"].map((x) => Workingtiome.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "img": img,
        "gender": gender,
        "description": description,
        "facebook": facebook,
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
        "workingtiome": List<dynamic>.from(workingtiome.map((x) => x.toJson())),
      };
}

class Workingtiome {
  Workingtiome({
    this.id,
    this.day,
    this.timeFrom,
    this.timeTo,
    this.doctorId,
    this.deleted,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int day;
  String timeFrom;
  String timeTo;
  int doctorId;
  int deleted;
  DateTime createdAt;
  DateTime updatedAt;

  factory Workingtiome.fromJson(Map<String, dynamic> json) => Workingtiome(
        id: json["id"],
        day: json["day"],
        timeFrom: json["time_from"],
        timeTo: json["time_to"],
        doctorId: json["doctor_id"],
        deleted: json["deleted"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "day": day,
        "time_from": timeFrom,
        "time_to": timeTo,
        "doctor_id": doctorId,
        "deleted": deleted,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
