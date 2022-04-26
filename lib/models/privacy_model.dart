class PrivacyModel {
  bool status;
  String errNum;
  String msg;
  List<Privacy> privacy;

  PrivacyModel({this.status, this.errNum, this.msg, this.privacy});

  PrivacyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['Privacy'] != null) {
      privacy = <Privacy>[];
      json['Privacy'].forEach((v) {
        privacy.add(new Privacy.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.privacy != null) {
      data['Privacy'] = this.privacy.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Privacy {
  String privacy;

  Privacy({this.privacy});

  Privacy.fromJson(Map<String, dynamic> json) {
    privacy = json['privacy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['privacy'] = this.privacy;
    return data;
  }
}
