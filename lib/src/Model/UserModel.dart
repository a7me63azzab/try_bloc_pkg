// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    bool status;
    String msg;
    User data;

    UserModel({
        this.status,
        this.msg,
        this.data,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        msg: json["msg"],
        data: User.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
    };
}

class User {
    int id;
    String type;
    String username;
    dynamic email;
    int active;
    dynamic resetCode;
    String phone;
    String img;
    DateTime createdAt;
    String language;
    int countryId;
    int cityId;
    dynamic hayId;
    String imageUrl;
    dynamic latitude;
    dynamic longitude;
    dynamic sectionId;
    dynamic subSectionId;
    dynamic serviceDesc;
    int rating;
    List<dynamic> ratingData;
    int orderCount;
    String token;

    User({
        this.id,
        this.type,
        this.username,
        this.email,
        this.active,
        this.resetCode,
        this.phone,
        this.img,
        this.createdAt,
        this.language,
        this.countryId,
        this.cityId,
        this.hayId,
        this.imageUrl,
        this.latitude,
        this.longitude,
        this.sectionId,
        this.subSectionId,
        this.serviceDesc,
        this.rating,
        this.ratingData,
        this.orderCount,
        this.token,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        type: json["type"],
        username: json["username"],
        email: json["email"],
        active: json["active"],
        resetCode: json["reset_code"],
        phone: json["phone"],
        img: json["img"],
        createdAt: DateTime.parse(json["created_at"]),
        language: json["language"],
        countryId: json["country_id"],
        cityId: json["city_id"],
        hayId: json["hay_id"],
        imageUrl: json["image_url"],
        latitude: json["Latitude"],
        longitude: json["longitude"],
        sectionId: json["section_id"],
        subSectionId: json["sub_section_id"],
        serviceDesc: json["service_desc"],
        rating: json["rating"],
        ratingData: List<dynamic>.from(json["rating_data"].map((x) => x)),
        orderCount: json["order_count"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "username": username,
        "email": email,
        "active": active,
        "reset_code": resetCode,
        "phone": phone,
        "img": img,
        "created_at": createdAt.toIso8601String(),
        "language": language,
        "country_id": countryId,
        "city_id": cityId,
        "hay_id": hayId,
        "image_url": imageUrl,
        "Latitude": latitude,
        "longitude": longitude,
        "section_id": sectionId,
        "sub_section_id": subSectionId,
        "service_desc": serviceDesc,
        "rating": rating,
        "rating_data": List<dynamic>.from(ratingData.map((x) => x)),
        "order_count": orderCount,
        "token": token,
    };
}