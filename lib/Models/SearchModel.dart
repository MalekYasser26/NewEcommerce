class SearchModel{
  bool ? status ;
  String? message ;
  userData ? data;
  List <userData> datalIST = [];
  SearchModel.fromJson(Map<String,dynamic>Json){
    status = Json['status'];
    message = Json['message'];
    for (int index = 0 ; index < Json['data']['data'].length ; index++ ){
      data = Json['data']['data'][index] != null ? userData.fromJson(Json['data']['data'][index]): null;
      datalIST.add(data!);
    }
  }
}
class userData{
  var id , price , image , name , desc ,images , in_fav,in_cart ;
  userData({this.id, this.price, this.image, this.name, this.desc, this.images, this.in_fav, this.in_cart});
  userData.fromJson(Map <dynamic,dynamic> json){
    id = json['id'];
    price = json['price'];
    image = json['image'];
    name = json['name'];
    desc = json['descriptions'];
    images = json['images'];
    in_fav = json['in_favorites'];
    in_cart = json['in_cart'];

  }
}