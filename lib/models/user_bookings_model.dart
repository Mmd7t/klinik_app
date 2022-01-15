class UserBookingsModel {
  UserBookingsModel({
    this.id,
    this.diagnoseId,
    this.treatment,
    this.date,
    this.time,
    this.approved,
    this.approvedTime,
    this.deleted,
    this.createdAt,
    this.updatedAt,
    this.patientId,
    this.doctorId,
    this.doctor,
  });

  int id;
  dynamic diagnoseId;
  dynamic treatment;
  String date;
  String time;
  int approved;
  dynamic approvedTime;
  int deleted;
  DateTime createdAt;
  DateTime updatedAt;
  int patientId;
  int doctorId;
  Doctor doctor;

  factory UserBookingsModel.fromJson(Map<String, dynamic> json) =>
      UserBookingsModel(
        id: json["id"],
        diagnoseId: json["diagnose_id"],
        treatment: json["treatment"],
        date: json["date"],
        time: json["time"],
        approved: json["approved"],
        approvedTime: json["approved_time"],
        deleted: json["deleted"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        patientId: json["patient_id"],
        doctorId: json["doctor_id"],
        doctor: Doctor.fromJson(json["doctor"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "diagnose_id": diagnoseId,
        "treatment": treatment,
        "date": date,
        "time": time,
        "approved": approved,
        "approved_time": approvedTime,
        "deleted": deleted,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "patient_id": patientId,
        "doctor_id": doctorId,
        "doctor": doctor.toJson(),
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

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
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
      };
}
