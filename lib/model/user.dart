class User {
  User({
    required this.success,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final String message;
  late final Data data;
  
  User.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.countryCode,
    required this.phone,
    required this.email,
    required this.token,
    required this.tokenExpiry,
  });
  late final String id;
  late  String name;
  late  String countryCode;
  late  String phone;
  late  String email;
  late final String token;
  late final String tokenExpiry;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    countryCode = json['country_code'];
    phone = json['phone'];
    email = json['email'];
    token = json['token'];
    tokenExpiry = json['token_expiry'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['country_code'] = countryCode;
    _data['phone'] = phone;
    _data['email'] = email;
    _data['token'] = token;
    _data['token_expiry'] = tokenExpiry;
    return _data;
  }
}