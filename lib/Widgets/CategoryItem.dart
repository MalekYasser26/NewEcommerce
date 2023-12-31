import 'package:flutter/material.dart';
import 'package:new_ecommerce/Constants/Constants.dart';
import 'package:new_ecommerce/Screens/ItemScreen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.catIcon, required this.catText}) : super(key: key);
  final IconData catIcon ;
  final String catText ;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(

          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.MainColor.withOpacity(.7),
                AppColors.SecondaryColor.withOpacity(.3)
              ] ),
          ),
          height: 50,
          width: 50,
          child: Icon(catIcon,color: Colors.white),
        ),
        SizedBox(height: 10,),
        Text("${catText}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),

      ],
    );
  }
}
