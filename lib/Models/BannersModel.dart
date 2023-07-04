import 'dart:convert';

class BannersModel {
int ? id  ;
String ? image ;

 BannersModel.fromJson({required Map<String, dynamic> bannersFromAPI}){
     id = bannersFromAPI['id'];
     image = bannersFromAPI['image'];
  }

}


