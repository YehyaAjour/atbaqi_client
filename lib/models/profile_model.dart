class ProfileModel {
  bool status;
  String errNum;
  String msg;
  List<Profiles> profiles;

  ProfileModel({this.status, this.errNum, this.msg, this.profiles});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['profiles'] != null) {
      profiles = new List<Profiles>();
      json['profiles'].forEach((v) {
        profiles.add(new Profiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.profiles != null) {
      data['profiles'] = this.profiles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Profiles {
  int id;
  String image;
  String name;
  String phone;
  List<DeviceTokens> deviceTokens;

  Profiles({this.id, this.image, this.name, this.phone, this.deviceTokens});

  Profiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    phone = json['phone'];
    if (json['device_tokens'] != null) {
      deviceTokens = new List<DeviceTokens>();
      json['device_tokens'].forEach((v) {
        deviceTokens.add(new DeviceTokens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['phone'] = this.phone;
    if (this.deviceTokens != null) {
      data['device_tokens'] = this.deviceTokens.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeviceTokens {
  int id;
  int userId;
  String fcm;
  String device;
  String createdAt;
  String updatedAt;

  DeviceTokens(
      {this.id,
        this.userId,
        this.fcm,
        this.device,
        this.createdAt,
        this.updatedAt});

  DeviceTokens.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    fcm = json['fcm'];
    device = json['device'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['fcm'] = this.fcm;
    data['device'] = this.device;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
