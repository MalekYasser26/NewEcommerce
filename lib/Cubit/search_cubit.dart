import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../Models/SearchModel.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());
  SearchModel ? searchModel ;
  int dataListLength =0 ;
  final SearchedDATAController = TextEditingController();

  void Search({required String SearchedData}) async {
    emit(SearchLoadingState());
    Response res =await http.post(Uri.parse("https://student.valuxapps.com/api/products/search"),
    body: {
      "text" : SearchedData
        },
      headers: {
      "lang": "en"
      }
    );
    var decodedData = jsonDecode(res.body);
    if (res.statusCode==200){
      print("i am here 1");
      searchModel = SearchModel.fromJson(decodedData);
      if (searchModel?.status == true){
        print("I am here 2 ");
        dataListLength = searchModel!.datalIST.length ;
        print("datalistlength is $dataListLength" );
         for (int index = 0 ; index < dataListLength! ; index ++){
             print("Item name is ${searchModel?.datalIST[index].name}");
      }
        emit(SearchSuccessState());

      }
      else
        {
          emit(SearchFailureState());
        }

    }
  }

}
