import 'package:flutter/material.dart';
import 'package:new_ecommerce/Constants/Constants.dart';

class SgstItem extends StatelessWidget {
   SgstItem({Key? key, required this.sgstText, required this.imgPath}) : super(key: key);
  final String sgstText ;
  final String imgPath ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            child: Image.network(imgPath,fit: BoxFit.fill),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: AppColors.MainColor)),
          ),
          Text("$sgstText",style: TextStyle(color: Colors.black),overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }
}
