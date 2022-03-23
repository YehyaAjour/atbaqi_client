class ForgetPasswordModel {
  bool status;
  String errNum;
  String msg;
  int code;

  ForgetPasswordModel({this.status, this.errNum, this.msg, this.code});

  ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    data['code'] = this.code;
    return data;
  }
}
