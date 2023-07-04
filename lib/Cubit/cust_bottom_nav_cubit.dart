import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:new_ecommerce/Screens/CartScreen.dart';
import 'package:new_ecommerce/Screens/HomeScreen.dart';
import 'package:new_ecommerce/Screens/ProfileScreen.dart';

import '../Screens/FavScreen.dart';
import '../Screens/SearchScreen.dart';

part 'cust_bottom_nav_state.dart';

class CustBottomNavCubit extends Cubit<CustBottomNavState> {
  CustBottomNavCubit() : super(CustBotNavChangeState());
  int bottomNavIndex = 0 ;
   SelectIndex({required int index}){
    bottomNavIndex = index;
  }
  List<Widget>Screens = [
    HomeScreen(),
    FavScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen()
  ];

}
