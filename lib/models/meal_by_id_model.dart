class MealByIdModel {
  bool status;
  String errNum;
  String msg;
  ShowMeal showMeal;

  MealByIdModel({this.status, this.errNum, this.msg, this.showMeal});

  MealByIdModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    showMeal = json['show meal'] != null
        ? new ShowMeal.fromJson(json['show meal'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.showMeal != null) {
      data['show meal'] = this.showMeal.toJson();
    }
    return data;
  }
}

class ShowMeal {
  int id;
  String name;
  String description;
  String price;
  String image;

  ShowMeal({this.id, this.name, this.description, this.price, this.image});

  ShowMeal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}
