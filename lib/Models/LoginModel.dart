import 'dart:core';

class LoginModel {
  bool ? status ;
  String? message ;
  UserData ? data ;
  LoginModel.fromJson(Map<String , dynamic> json){
   status = json['status'];
   message = json['message'];
   data = json['data'] != null ? UserData.fromJson(json['data']): null  ;
}
}
class UserData {
  int? id , points , credit ;
  String? name , email , phone , image  , token;
  UserData({
    this.name,
    this.email,
    this.phone,
    this.image,
    this.id,
    this.points,
    this.credit,
    this.token
  });
  UserData.fromJson(Map<dynamic , dynamic> json){
    id = json['id'];
    name= json['name'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];




  }
}