// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) =>
    OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) =>
    json.encode(data.toJson());

class OrderDetailsModel {
  OrderDetailsModel({
    this.status,
    this.errNum,
    this.msg,
    this.orderStatus,
  });

  var status;
  var errNum;
  var msg;
  var orderStatus;

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        status: json["status"],
        errNum: json["errNum"],
        msg: json["msg"],
        orderStatus: OrderStatus.fromJson(json["order-status"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errNum": errNum,
        "msg": msg,
        "order-status": orderStatus.toJson(),
      };
}

class OrderStatus {
  OrderStatus({
    this.id,
    this.userId,
    this.status,
    this.address,
    this.total,
    this.deliveryTime,
    this.deliveryCost,
    this.processingTime,
    this.family,
    this.user,
    this.orderItems,
  });

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
  List<OrderItem> orderItems;

  factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
        id: json["id"],
        userId: json["user_id"],
        status: json["status"],
        address: json["address"],
        total: json["total"],
        deliveryTime: json["DeliveryTime"],
        deliveryCost: json["delivery_cost"],
        processingTime: json["ProcessingTime"],
        family: Family.fromJson(json["family"]),
        user: User.fromJson(json["user"]),
        orderItems: List<OrderItem>.from(
            json["orderItems"].map((x) => OrderItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "status": status,
        "address": address,
        "total": total,
        "DeliveryTime": deliveryTime,
        "delivery_cost": deliveryCost,
        "ProcessingTime": processingTime.toIso8601String(),
        "family": family.toJson(),
        "user": user.toJson(),
        "orderItems": List<dynamic>.from(orderItems.map((x) => x.toJson())),
      };
}

class Family {
  Family({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Family.fromJson(Map<String, dynamic> json) => Family(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class OrderItem {
  OrderItem({
    this.id,
    this.meal,
    this.price,
    this.quantity,
  });

  dynamic id;
  Meal meal;
  String price;
  int quantity;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        meal: Meal.fromJson(json["meal"]),
        price: json["price"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "meal": meal.toJson(),
        "price": price,
        "quantity": quantity,
      };
}

class Meal {
  Meal({
    this.id,
    this.name,
    this.price,
    this.description,
    this.numberPersons,
    this.familyId,
    this.categoryId,
    this.image,
  });

  int id;
  String name;
  String price;
  String description;
  String numberPersons;
  String familyId;
  String categoryId;
  String image;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        numberPersons: json["number_persons"],
        familyId: json["family_id"],
        categoryId: json["category_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "number_persons": numberPersons,
        "family_id": familyId,
        "category_id": categoryId,
        "image": image,
      };
}

class User {
  User({
    this.id,
    this.name,
    this.phone,
    this.totalMeals,
  });

  int id;
  String name;
  String phone;
  int totalMeals;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        totalMeals: json["total_meals"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "total_meals": totalMeals,
      };
}
