// To parse this JSON data, do
//
//     final allFamilesModel = allFamilesModelFromJson(jsonString);

import 'dart:convert';

AllFamilesModel allFamilesModelFromJson(String str) =>
    AllFamilesModel.fromJson(json.decode(str));

String allFamilesModelToJson(AllFamilesModel data) =>
    json.encode(data.toJson());

class AllFamilesModel {
  AllFamilesModel({
    this.status,
    this.errNum,
    this.msg,
    this.families,
  });

  bool status;
  String errNum;
  String msg;
  List<Family> families;

  factory AllFamilesModel.fromJson(Map<String, dynamic> json) =>
      AllFamilesModel(
        status: json["status"],
        errNum: json["errNum"],
        msg: json["msg"],
        families:
            List<Family>.from(json["families"].map((x) => Family.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errNum": errNum,
        "msg": msg,
        "families": List<dynamic>.from(families.map((x) => x.toJson())),
      };
}

class Family {
  Family({
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

  factory Family.fromJson(Map<String, dynamic> json) => Family(
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
