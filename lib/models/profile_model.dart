// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.status,
    this.errNum,
    this.msg,
    this.profiles,
  });

  bool status;
  String errNum;
  String msg;
  List<Profile> profiles;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        errNum: json["errNum"],
        msg: json["msg"],
        profiles: List<Profile>.from(
            json["profiles"].map((x) => Profile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errNum": errNum,
        "msg": msg,
        "profiles": List<dynamic>.from(profiles.map((x) => x.toJson())),
      };
}

class Profile {
  Profile({
    this.id,
    this.image,
    this.name,
    this.phone,
    this.deviceTokens,
  });

  int id;
  String image;
  String name;
  String phone;
  List<DeviceToken> deviceTokens;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        phone: json["phone"],
        deviceTokens: List<DeviceToken>.from(
            json["device_tokens"].map((x) => DeviceToken.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "phone": phone,
        "device_tokens":
            List<dynamic>.from(deviceTokens.map((x) => x.toJson())),
      };
}

class DeviceToken {
  DeviceToken({
    this.id,
    this.userId,
    this.fcm,
    this.device,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int userId;
  String fcm;
  String device;
  DateTime createdAt;
  DateTime updatedAt;

  factory DeviceToken.fromJson(Map<String, dynamic> json) => DeviceToken(
        id: json["id"],
        userId: json["user_id"],
        fcm: json["fcm"],
        device: json["device"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "fcm": fcm,
        "device": device,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
