import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:new_ecommerce/Models/ProductModel.dart';

import '../Models/BannersModel.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(BannerInitialState());
  List <BannersModel> BannersData= [];
  List <ProductModel> ProductData= [];
  final BannerController = PageController();

  void getBanners() async {
    emit(BannerLoadingState());
    Response BannersRes = await http.get(Uri.parse("https://student.valuxapps.com/api/banners"));
    var decodedData = jsonDecode(BannersRes.body);
    if (BannersRes.statusCode==200){
      if (decodedData['status']==true) {
        for (var item in decodedData['data']) {
          BannersData.add(BannersModel.fromJson(bannersFromAPI: item));
        }
          debugPrint('${BannersData.length}');
          emit(BannerSuccessState());
      }
    } else{
      BannersData=[];
      emit(BannerFailureState());
      throw Exception("Failed to get banners");
    }
  }
  void getProducts() async{
    emit(ProductLoadingState());
    Response prodRes = await http.get(Uri.parse("https://student.valuxapps.com/api/products"),headers: {
      "lang":"en"
    });
    var decodedData = jsonDecode(prodRes.body);
    if (prodRes.statusCode==200){
      print("1 here");
      if(decodedData['status']==true){
        print("2 here");
        print(decodedData['data']['data']);
        for (var item in decodedData['data']['data']) {
          print("3 here");
          ProductData.add(ProductModel.fromJson(productsFromAPI: item));
        }
        print(ProductData);
       // print("PRODUCTS LENGTH IS ${ProductData.length}");
        emit(ProductSuccessState());
      }
      else {
        ProductData = [];
        emit(ProductFailureState());
        throw Exception("Failed to get products");
      }
    }
  }
}