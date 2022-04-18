// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.status,
    this.errNum,
    this.msg,
    this.familyHome,
  });

  bool status;
  String errNum;
  String msg;
  List<FamilyHome> familyHome;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json["status"],
        errNum: json["errNum"],
        msg: json["msg"],
        familyHome: List<FamilyHome>.from(
            json["family home"].map((x) => FamilyHome.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errNum": errNum,
        "msg": msg,
        "family home": List<dynamic>.from(familyHome.map((x) => x.toJson())),
      };
}

class FamilyHome {
  FamilyHome({
    this.id,
    this.name,
    this.status,
    this.image,
    this.rating,
  });

  int id;
  String name;
  String status;
  String image;
  String rating;

  factory FamilyHome.fromJson(Map<String, dynamic> json) => FamilyHome(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        image: json["image"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "image": image,
        "rating": rating,
      };
}
