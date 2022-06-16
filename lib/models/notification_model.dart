class NotificationModel {
  bool status;
  String errNum;
  String msg;
  List<Notification> notification;

  NotificationModel({this.status, this.errNum, this.msg, this.notification});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['notification'] != null) {
      notification = new List<Notification>();
      json['notification'].forEach((v) {
        notification.add(new Notification.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.notification != null) {
      data['notification'] = this.notification.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notification {
  int id;
  String type;
  Data data;

  Notification({this.id, this.type, this.data});

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  var title;
  var description;
  var orderId;
  OrderDetails orderDetails;
  var type;
  var message;

  Data(
      {this.title,
        this.description,
        this.orderId,
        this.orderDetails,
        this.type,
        this.message});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    orderId = json['order_id'];
    orderDetails = json['order_details'] != null
        ? new OrderDetails.fromJson(json['order_details'])
        : null;
    type = json['type'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['order_id'] = this.orderId;
    if (this.orderDetails != null) {
      data['order_details'] = this.orderDetails.toJson();
    }
    data['type'] = this.type;
    data['message'] = this.message;
    return data;
  }
}

class OrderDetails {
  var id;
  var userId;
  var status;
  var address;
  var total;
  var deliveryTime;
  var deliveryCost;
  var processingTime;
  Family family;
  User user;
  List<OrderItems> orderItems;

  OrderDetails(
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

  OrderDetails.fromJson(Map<String, dynamic> json) {
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
  var id;
  var name;
  var phone;
  var totalMeals;

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
  var id;
  Meal meal;
  var price;
  var quantity;

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
  var id;
  var name;
  var price;
  var description;
  var numberPersons;
  var familyId;
  var categoryId;
  var image;

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
