import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:new_ecommerce/Constants/Constants.dart';
import 'package:new_ecommerce/Cubit/cust_bottom_nav_cubit.dart';
import 'package:new_ecommerce/Widgets/BuildNavBarItem.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  var index = 0 ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustBottomNavCubit, CustBottomNavState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      extendBody: true, // Set this property to true to remove the padding between the navigation bar and body
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: index !=0 && index !=1 ? LinearGradient(
            begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
            AppColors.MainColor.withOpacity(0.7),
            AppColors.SecondaryColor.withOpacity(0.3)
          ]) : LinearGradient(colors: [Colors.transparent , Colors.transparent])
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 35),
          padding: EdgeInsets.only(left: 6, right: 6, top: 8, bottom: 8), // Add padding to adjust the content
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              end: Alignment.centerLeft,
              begin: Alignment.centerRight,
              colors: [
                AppColors.SecondaryColor.withOpacity(.3),
                AppColors.MainColor.withOpacity(.7),

              ],
            ),
          ),
          height: kBottomNavigationBarHeight,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(width: 30),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, currIndex) => InkWell(
              onTap: () {
                setState(() {
                  print("tapped");
                  index = currIndex;
                  BlocProvider.of<CustBottomNavCubit>(context).SelectIndex(index: currIndex);
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 6.0, right: 10),
                child: Icon(
                  BotNavIcons[currIndex],
                  color: index == currIndex ? AppColors.SecondaryColor : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      body: BlocProvider.of<CustBottomNavCubit>(context).Screens[BlocProvider.of<CustBottomNavCubit>(context).bottomNavIndex],
    );
  },
);
  }
}
