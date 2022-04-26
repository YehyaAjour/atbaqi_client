class AllFavouriteModel {
  bool status;
  String errNum;
  String msg;
  List<FavoriteList> favoriteList;

  AllFavouriteModel({this.status, this.errNum, this.msg, this.favoriteList});

  AllFavouriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['favorite-list'] != null) {
      favoriteList = new List<FavoriteList>();
      json['favorite-list'].forEach((v) {
        favoriteList.add(new FavoriteList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.favoriteList != null) {
      data['favorite-list'] = this.favoriteList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FavoriteList {
  int id;
  String name;
  String rating;

  FavoriteList({this.id, this.name, this.rating});

  FavoriteList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['rating'] = this.rating;
    return data;
  }
}
