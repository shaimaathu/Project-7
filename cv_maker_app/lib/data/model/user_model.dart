class UserModel {
  UserModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.email,
    required this.password,
  });
  late final String id;
  late final String createdAt;
  late final String name;
  late final String email;
  late final String password;
  
  UserModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    createdAt = json['created_at'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['created_at'] = createdAt;
    _data['name'] = name;
    _data['email'] = email;
    _data['password'] = password;
    return _data;
  }
}