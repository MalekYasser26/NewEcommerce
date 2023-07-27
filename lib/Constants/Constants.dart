import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Widgets/CartItemWidgets.dart';

class AppColors {
  static const Color MainColor = Color(0xFF3b3cb0);
  static const Color SecondaryColor = Color(0xffb74a4b);
  static const Color accentColor = Color(0xFFFFCC00);

}
class apiLink{
  static const String baseUr0l = "https://student.valuxapps.com/api/";

}

List <String> Categories=[
  "Headphones",
  "Smartphones",
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
List<String>ProfileText=[
  "Contact Information",
  "Payment Methods",
  "My orders",
  "My reviews",
  "Promocodes",
  "Settings",
  "Logout"
];
List<IconData>ProfileIcons=[
Icons.contact_page_outlined,
Icons.credit_card,
Icons.shopping_cart,
Icons.reviews_outlined,
Icons.discount_outlined,
Icons.settings,
Icons.logout
];
List<String>ProfileSubText=[
  "Phone Number, Email, Address",
  "Visa **85",
  "Have 8 orders",
  "Reviews for 8 items ",
  "You have special promocodes",
  "Notifications, passwords",
  "Logout , change accounts"

];
List cartList = [];
Set<Map<String, dynamic>> favList = {};





//m@m.mm
//12345678
//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    github token
//color: Color(0xFF333333)