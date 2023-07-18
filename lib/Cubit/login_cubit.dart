import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:new_ecommerce/Shared%20Preferences/SharedPref.dart';

import '../Models/LoginModel.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  final  emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginModel ? loginModel ;

  void Login({required String email, required String password}) async {
      emit(LoginLoadingState());
      Response LoginResponse = await http.post(Uri.parse('https://student.valuxapps.com/api/login'),
          body: {'email': email, 'password': password} ,
           headers: {
        'lang' : "en" ,
           }

      );
     var data = jsonDecode(LoginResponse.body);
      if (LoginResponse.statusCode == 200) {
        loginModel = LoginModel.fromJson(data);
        if (loginModel?.status == true) {
          CacheHelper.saveData(key: 'token', value: loginModel?.data?.token);
          print(loginModel?.data?.token);
          print("hereeeeeeeee");
          emit(LoginSuccessState());
        } else {
          emit(LoginFailureState());
        }
      }
    }

  @override
  LoginState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(LoginState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }

}
