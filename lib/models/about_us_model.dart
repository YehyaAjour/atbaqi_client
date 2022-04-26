class AboutUsModel {
  bool status;
  String errNum;
  String msg;
  List<AboutUs> aboutUs;

  AboutUsModel({this.status, this.errNum, this.msg, this.aboutUs});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['About Us'] != null) {
      aboutUs = <AboutUs>[];
      json['About Us'].forEach((v) {
        aboutUs.add(new AboutUs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.aboutUs != null) {
      data['About Us'] = this.aboutUs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AboutUs {
  String aboutUs;

  AboutUs({this.aboutUs});

  AboutUs.fromJson(Map<String, dynamic> json) {
    aboutUs = json['about_us'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about_us'] = this.aboutUs;
    return data;
  }
}
