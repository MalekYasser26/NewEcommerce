import 'package:flutter/material.dart';
import 'package:new_ecommerce/Screens/BoardingScreen.dart';
import 'package:new_ecommerce/Screens/BottomNavBarScreen.dart';
import 'package:new_ecommerce/Screens/LoginScreen.dart';

import '../Constants/Constants.dart';
import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  final bool onBoarding;
 final String token ;
  const SplashScreen({Key? key, required this.onBoarding, required this.token, }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Route route;
      if (widget.onBoarding == false) {
        route = MaterialPageRoute(builder: (context) => BoardingScreen());
      }
      else  if (widget.token==null || widget.token==""){
        route = MaterialPageRoute(builder: (context) => LoginScreen());
      }
      else {
        route = MaterialPageRoute(builder: (context) => BottomNavBarScreen());
      }
      Navigator.pushReplacement(context, route);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColors.MainColor.withOpacity(.7),
                AppColors.SecondaryColor.withOpacity(.3),
              ] ),
        ),

        child: Center(
          child: Image.asset(
            'assets/images/logoblue.png',
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}

