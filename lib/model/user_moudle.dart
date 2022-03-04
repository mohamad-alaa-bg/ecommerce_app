class UserModel {
  String userId, email, name, pic;

  UserModel({
    this.userId,
    this.email,
    this.name,
    this.pic,
  });

  UserModel.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
  }

  toJson() {
    return {
      'userId': this.userId,
      'email': this.email,
      'name': this.name,
      'pic': this.pic,
    };
  }
}
