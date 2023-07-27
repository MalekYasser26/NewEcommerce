import 'package:flutter/material.dart';
import 'package:new_ecommerce/Constants/Constants.dart';
import 'package:new_ecommerce/Screens/ItemScreen.dart';
import 'package:new_ecommerce/Screens/SearchScreen.dart';

class productItem extends StatelessWidget {
   productItem({Key? key, required this.productText, required this.imgPath, required this.price, required this.desc , required this.index}) : super(key: key);
  final String productText ;
  final String imgPath ;
  final String price ;
  final String desc ;
  final int index  ;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ItemScreen(index: index ,
        desc: desc,
        price: price,
        img: imgPath,
        text: productText,
        ),)),
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.network(imgPath,fit: BoxFit.fill),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: AppColors.MainColor)),
            ),
            Text("$productText",style: TextStyle(color: Colors.black),overflow: TextOverflow.ellipsis,)
          ],
        ),
      ),
    );
  }
}
