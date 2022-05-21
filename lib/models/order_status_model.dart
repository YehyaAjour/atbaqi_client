class OrderStatusModel {
  bool status;
  String errNum;
  String msg;
  String orderStatus;

  OrderStatusModel({this.status, this.errNum, this.msg, this.orderStatus});

  OrderStatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    orderStatus = json['order-status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    data['order-status'] = this.orderStatus;
    return data;
  }
}
