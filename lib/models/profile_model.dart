class ProfileModel {
  bool status;
  String errNum;
  String msg;
  List<Profile> profile;

  ProfileModel({this.status, this.errNum, this.msg, this.profile});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['profile'] != null) {
      profile = <Profile>[];
      json['profile'].forEach((v) {
        profile.add(Profile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['errNum'] = errNum;
    data['msg'] = msg;
    if (profile != null) {
      data['profile'] = profile.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Profile {
  int id;
  String image;
  String name;
  String phone;

  Profile({this.id, this.image, this.name, this.phone});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}
