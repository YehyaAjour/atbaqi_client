class TermsModel {
  bool status;
  String errNum;
  String msg;
  List<Terms> terms;

  TermsModel({this.status, this.errNum, this.msg, this.terms});

  TermsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['Terms'] != null) {
      terms = <Terms>[];
      json['Terms'].forEach((v) {
        terms.add(new Terms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.terms != null) {
      data['Terms'] = this.terms.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Terms {
  String terms;

  Terms({this.terms});

  Terms.fromJson(Map<String, dynamic> json) {
    terms = json['terms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['terms'] = this.terms;
    return data;
  }
}
