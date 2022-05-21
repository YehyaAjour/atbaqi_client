class AllOrderModel {
  bool status;
  String errNum;
  String msg;
  List<Order> order;

  AllOrderModel({this.status, this.errNum, this.msg, this.order});

  AllOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['order'] != null) {
      order = new List<Order>();
      json['order'].forEach((v) {
        order.add(new Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.order != null) {
      data['order'] = this.order.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Order {
  var id;
  var userId;
  var status;
  var address;
  var total;
  var deliveryTime;
  var deliveryCost;
  var processingTime;
  var family;
  var user;
  List<OrderItems> orderItems;

  Order(
      {this.id,
      this.userId,
      this.status,
      this.address,
      this.total,
      this.deliveryTime,
      this.deliveryCost,
      this.processingTime,
      this.family,
      this.user,
      this.orderItems});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    status = json['status'];
    address = json['address'];
    total = json['total'];
    deliveryTime = json['DeliveryTime'];
    deliveryCost = json['delivery_cost'];
    processingTime = json['ProcessingTime'];
    family =
        json['family'] != null ? new Family.fromJson(json['family']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['orderItems'] != null) {
      orderItems = new List<OrderItems>();
      json['orderItems'].forEach((v) {
        orderItems.add(new OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['address'] = this.address;
    data['total'] = this.total;
    data['DeliveryTime'] = this.deliveryTime;
    data['delivery_cost'] = this.deliveryCost;
    data['ProcessingTime'] = this.processingTime;
    if (this.family != null) {
      data['family'] = this.family.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.orderItems != null) {
      data['orderItems'] = this.orderItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Family {
  int id;
  String name;

  Family({this.id, this.name});

  Family.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class User {
  int id;
  String name;
  String phone;
  int totalMeals;

  User({this.id, this.name, this.phone, this.totalMeals});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    totalMeals = json['total_meals'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['total_meals'] = this.totalMeals;
    return data;
  }
}

class OrderItems {
  int id;
  Meal meal;
  String price;
  int quantity;

  OrderItems({this.id, this.meal, this.price, this.quantity});

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    meal = json['meal'] != null ? new Meal.fromJson(json['meal']) : null;
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.meal != null) {
      data['meal'] = this.meal.toJson();
    }
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    return data;
  }
}

class Meal {
  int id;
  String name;
  String price;
  String description;
  String numberPersons;
  String familyId;
  String categoryId;
  String image;

  Meal(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.numberPersons,
      this.familyId,
      this.categoryId,
      this.image});

  Meal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    numberPersons = json['number_persons'];
    familyId = json['family_id'];
    categoryId = json['category_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['number_persons'] = this.numberPersons;
    data['family_id'] = this.familyId;
    data['category_id'] = this.categoryId;
    data['image'] = this.image;
    return data;
  }
}
