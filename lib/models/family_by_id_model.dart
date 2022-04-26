class FamilyByIdModel {
  bool status;
  String errNum;
  String msg;
  ShowFamily showFamily;

  FamilyByIdModel({this.status, this.errNum, this.msg, this.showFamily});

  FamilyByIdModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    showFamily = json['show family'] != null
        ? new ShowFamily.fromJson(json['show family'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.showFamily != null) {
      data['show family'] = this.showFamily.toJson();
    }
    return data;
  }
}

class ShowFamily {
  int id;
  String name;
  String email;
  String phone;
  String image;
  String status;
  List<Meals> meals;

  ShowFamily(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.image,
        this.status,
        this.meals});

  ShowFamily.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    status = json['status'];
    if (json['meals'] != null) {
      meals = new List<Meals>();
      json['meals'].forEach((v) {
        meals.add(new Meals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['status'] = this.status;
    if (this.meals != null) {
      data['meals'] = this.meals.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meals {
  int id;
  String name;
  String price;
  String image;
  String description;
  String numberPersons;
  int familyId;
  int categoryId;

  Meals(
      {this.id,
        this.name,
        this.price,
        this.image,
        this.description,
        this.numberPersons,
        this.familyId,
        this.categoryId});

  Meals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
    numberPersons = json['number_persons'];
    familyId = json['family_id'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['description'] = this.description;
    data['number_persons'] = this.numberPersons;
    data['family_id'] = this.familyId;
    data['category_id'] = this.categoryId;
    return data;
  }
}
