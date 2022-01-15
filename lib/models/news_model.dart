class NewsModel {
  NewsModel({
    this.maincode,
    this.code,
    this.error,
    this.data,
  });

  int maincode;
  int code;
  dynamic error;
  List<NewsDatum> data;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        maincode: json["Maincode"],
        code: json["code"],
        error: json["error"],
        data: json["data"] == null
            ? null
            : List<NewsDatum>.from(
                json["data"].map((x) => NewsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Maincode": maincode,
        "code": code,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class NewsDatum {
  NewsDatum({
    this.id,
    this.title,
    this.link,
    this.description,
    this.content,
    this.views,
    this.img,
    this.status,
    this.pLink,
    this.comments,
    this.slider1,
    this.slider2,
    this.category,
    this.user,
    this.likes,
    this.createdAt,
    this.updatedAt,
    this.doctor,
    this.doctors,
    this.allComments,
  });

  int id;
  String title;
  String link;
  String description;
  String content;
  String views;
  String img;
  String status;
  dynamic pLink;
  int comments;
  String slider1;
  String slider2;
  int category;
  int user;
  int likes;
  DateTime createdAt;
  DateTime updatedAt;
  int doctor;
  Doctors doctors;
  List<AllComment> allComments;

  factory NewsDatum.fromJson(Map<String, dynamic> json) => NewsDatum(
        id: json["id"],
        title: json["title"],
        link: json["link"] == null ? null : json["link"],
        description: json["description"],
        content: json["content"],
        views: json["views"],
        img: json["img"],
        status: json["status"],
        pLink: json["p_link"],
        comments: json["comments"] == null ? null : json["comments"],
        slider1: json["slider1"],
        slider2: json["slider2"],
        category: json["category"],
        user: json["user"],
        likes: json["likes"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        doctor: json["doctor"],
        doctors:
            json["doctors"] == null ? null : Doctors.fromJson(json["doctors"]),
        allComments: json["all_comments"] == null
            ? null
            : List<AllComment>.from(
                json["all_comments"].map((x) => AllComment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "link": link == null ? null : link,
        "description": description,
        "content": content,
        "views": views,
        "img": img,
        "status": status,
        "p_link": pLink,
        "comments": comments == null ? null : comments,
        "slider1": slider1,
        "slider2": slider2,
        "category": category,
        "user": user,
        "likes": likes,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "doctor": doctor,
        "doctors": doctors.toJson(),
        "all_comments": List<dynamic>.from(allComments.map((x) => x.toJson())),
      };
}

class AllComment {
  AllComment({
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
  dynamic createdAt;
  dynamic updatedAt;

  factory AllComment.fromJson(Map<String, dynamic> json) => AllComment(
        id: json["id"],
        postId: json["post_id"],
        comment: json["comment"],
        status: json["status"],
        sender: json["sender"],
        email: json["email"],
        createdAt: json["created_at"] ?? null,
        updatedAt: json["updated_at"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "post_id": postId,
        "comment": comment,
        "status": status,
        "sender": sender,
        "email": email,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Doctors {
  Doctors({
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

  factory Doctors.fromJson(Map<String, dynamic> json) => Doctors(
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
