class AllCartListModel {
  bool status;
  String errNum;
  String msg;
  List<CartItems> cartItems;

  AllCartListModel({this.status, this.errNum, this.msg, this.cartItems});

  AllCartListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['cart-items'] != null) {
      cartItems = new List<CartItems>();
      json['cart-items'].forEach((v) {
        cartItems.add(new CartItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.cartItems != null) {
      data['cart-items'] = this.cartItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItems {
  int id;
  int userId;
  int mealId;
  int quantity;
  Meals meals;

  CartItems({this.id, this.userId, this.mealId, this.quantity, this.meals});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    mealId = json['meal_id'];
    quantity = json['quantity'];
    meals = json['meals'] != null ? new Meals.fromJson(json['meals']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['meal_id'] = this.mealId;
    data['quantity'] = this.quantity;
    if (this.meals != null) {
      data['meals'] = this.meals.toJson();
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
