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
      bottomNavigationBar: Container(
margin: EdgeInsets.symmetric(horizontal: 35),
         decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color(0xFF333333)),
        height:kBottomNavigationBarHeight,
        child:ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 30,),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, currIndex) => Padding(
            padding: const EdgeInsets.only(left: 6.0,right: 10,top: 8,bottom: 8),
            child: InkWell(
              onTap: () {
                setState(() {
                  print("tapped");
                  index = currIndex;
                  BlocProvider.of<CustBottomNavCubit>(context).SelectIndex(index: currIndex);
                });
              },
              child: Icon(BotNavIcons[currIndex],
                color:index == currIndex?
                AppColors.SecondaryColor:Colors.white,),
            ),
          ),
        )


      ),
      body:  BlocProvider.of<CustBottomNavCubit>(context).Screens[
      BlocProvider.of<CustBottomNavCubit>(context).bottomNavIndex],);
  },
);
  }
}
