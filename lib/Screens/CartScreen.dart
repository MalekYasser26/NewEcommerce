import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Constants/Constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.SecondaryColor.withOpacity(.3),
                    AppColors.MainColor.withOpacity(.7),
                  ] ),
            ),

          ),
          //  elevation: 0,
          centerTitle: true,
          title: Text("Cart" , style: TextStyle(color: Colors.black,fontSize: 30,)),
          backgroundColor: Colors.white,
        ),
        extendBody: true,
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.MainColor.withOpacity(.7),
                  AppColors.SecondaryColor.withOpacity(.3),
                ] ),
          ),
          child: cartList.isEmpty? Center(
            child: Text("Add items to your cart !",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,
               color: Colors.black.withOpacity(.5) ),),
          )  : ListView.separated(
            physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {

            return Stack(children:[
              Positioned(
                  top: 0,
                  right: 10,
                  child: InkWell(
                      onTap: () {
                      setState(() {
                        print("closed");
                        cartList.removeAt(index);
                        Fluttertoast.showToast(
                          msg: "Item removed",
                          toastLength: Toast.LENGTH_SHORT,
                          timeInSecForIosWeb: 1,
                          backgroundColor: AppColors.MainColor.withOpacity(0.7) ,
                          textColor: Colors.white,
                          fontSize: 16.0,
                          gravity: ToastGravity.CENTER,

                        );
                      });
                      },
                      child: Icon(Icons.close,color: AppColors.SecondaryColor,size: 40,))),
              cartList[index]]);
          } ,
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 8),
                child: Divider(thickness: 2,),
              ), itemCount: cartList.length),

        ),
      ),
    );
  }
}
