class Data {
  Data({
      this.userId,
      this.token,
      this.name,
      this.email,
      this.phone,
      this.refer,});

  Data.fromJson(dynamic json) {
    userId = json['user_id'];
    token = json['token'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    refer = json['refer'];
  }
  int? userId;
  String? token;
  String? name;
  String? email;
  String? phone;
  dynamic refer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['token'] = token;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['refer'] = refer;
    return map;
  }

}