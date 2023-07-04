class ProductModel{
  var id,price ;
  String ?  image,name,description ;

  ProductModel.fromJson({required Map <String,dynamic> productsFromAPI}){
    id = productsFromAPI['id'];
    price = productsFromAPI['price'];
    image = productsFromAPI['image'];
    name = productsFromAPI['name'];
    description = productsFromAPI['description'];

  }
}