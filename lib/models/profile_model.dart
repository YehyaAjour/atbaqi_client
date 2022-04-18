 
import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.status,
    this.errNum,
    this.msg,
    this.profile,
  });

  bool status;
  String errNum;
  String msg;
  List<Profile> profile;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        errNum: json["errNum"],
        msg: json["msg"],
        profile:
            List<Profile>.from(json["profile"].map((x) => Profile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errNum": errNum,
        "msg": msg,
        "profile": List<dynamic>.from(profile.map((x) => x.toJson())),
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
  List<dynamic> deviceTokens;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        phone: json["phone"],
        deviceTokens: List<dynamic>.from(json["device_tokens"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "phone": phone,
        "device_tokens": List<dynamic>.from(deviceTokens.map((x) => x)),
      };
}
