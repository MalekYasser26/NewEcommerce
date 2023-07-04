import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppColors {
  static const Color MainColor = Color(0xFF3b3cb0);
  static const Color SecondaryColor = Color(0xffb74a4b);
  static const Color accentColor = Color(0xFFFFCC00);
  late final bool onBoarding;
}
class apiLink{
  static const String baseUrl = "https://student.valuxapps.com/api/";

}

List <String> Categories=[
  "Headphones",
  "Smartphone",
  "Clothes",
  "Games",
  "Laptops",
  "Food",
  "Electronics"
];
List<IconData> CatIcons=[
  Icons.headphones,
  Icons.phone_android,
  FontAwesomeIcons.shirt,
  FontAwesomeIcons.gamepad,
  Icons.laptop_mac,
  Icons.fastfood_rounded,
  Icons.devices
];
List<IconData>BotNavIcons=[
  Icons.home,
  Icons.favorite,
  Icons.search,
  Icons.shopping_cart,
  Icons.person_outline

];

//m@m.mm
//12345678