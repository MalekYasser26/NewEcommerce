import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:new_ecommerce/Models/LoginModel.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  RegisterCubit() : super(RegisterInitialState());
  LoginModel ? loginModel ;
  void Register ({required String name , required String email , required String phone , required String password}) async{
    emit(RegisterLoadingState());

    Response RgstRes = await http.post(Uri.parse('https://student.valuxapps.com/api/register'),
    body: {
        'name': name ,
        'email' : email ,
        'phone' : phone ,
        'password': password
    },
    headers: {
      "lang" : "en"
        }
    );

    var data = jsonDecode(RgstRes.body);
    if (RgstRes.statusCode ==200){
      loginModel = LoginModel.fromJson(data);
      if(loginModel?.status == true){
        emit(RegisterSuccessState());
        print("HEREEEEE");
        print(loginModel?.message);
      }
      else {
        emit(RegisterFailureState());
        print("register failure");

      }

    }
    
    
  }
  
}
