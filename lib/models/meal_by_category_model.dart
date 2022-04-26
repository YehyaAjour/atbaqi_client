class MealByCategoryModel {
  bool status;
  dynamic errNum;
  String msg;
  List<MealsByCategory> mealsByCategory;

  MealByCategoryModel(
      {this.status, this.errNum, this.msg, this.mealsByCategory});

  MealByCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['mealsByCategory'] != null) {
      mealsByCategory = <MealsByCategory>[];
      json['mealsByCategory'].forEach((v) {
        mealsByCategory.add(new MealsByCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.mealsByCategory != null) {
      data['mealsByCategory'] =
          this.mealsByCategory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MealsByCategory {
  int id;
  String name;
  String price;
  String image;
  String description;
  String numberPersons;
  int familyId;
  int categoryId;

  MealsByCategory(
      {this.id,
        this.name,
        this.price,
        this.image,
        this.description,
        this.numberPersons,
        this.familyId,
        this.categoryId});

  MealsByCategory.fromJson(Map<String, dynamic> json) {
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
