import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_ecommerce/Cubit/search_cubit.dart';
import 'package:new_ecommerce/Widgets/CartItemWidgets.dart';

import '../Constants/Constants.dart';

class ItemScreen extends StatefulWidget {
   ItemScreen({Key? key, required this.index, required this.img, required this.desc, required this.text, required this.price}) : super(key: key);
   var index , img , desc , text , price ;

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
   var x = cartList.length ;

   @override
  Widget build(BuildContext context) {
     var searchCubit = BlocProvider.of<SearchCubit>(context);
     return Scaffold(
          extendBody: true,
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.SecondaryColor.withOpacity(.3),
                    AppColors.MainColor.withOpacity(.7),
                  ] ),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios,color: AppColors.MainColor,size: 30)),
                ),
                Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 350,
                width: 400,
                child: Image.network("${widget.img}",fit: BoxFit.fill),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: AppColors.MainColor)),
              ),
            ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0 , left: 35 , right: 35),
                  child: Divider(
                    thickness: 2,

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0,left: 37),
                  child: Text("${widget.text}",
                    maxLines: 1,
                    style: TextStyle(
                    color: Colors.black,fontWeight: FontWeight.bold,
                    fontSize: 25,overflow: TextOverflow.clip,),),
                ), // Text
                Padding(
                  padding: const EdgeInsets.only(top: 8.0,left: 37,right: 5,bottom: 7),
                  child: Text("${widget.desc}",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 14),maxLines: 4,overflow: TextOverflow.ellipsis),
                ), // SUBTEXT
                Padding(
                  padding: const EdgeInsets.only(left: 37.0,top: 8,right: 45),
                  child: Row(
                    children: [
                      Text("${widget.price} L.E" , style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text("4.7" , style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold)),
                      Icon(Icons.star,color: AppColors.SecondaryColor,)
                    ],



                  ),
                ), // PRICE AND RATING
                Padding(
                  padding: const EdgeInsets.only(left: 25.0,right: 25,top: 2,),
                  child: Row(

                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Icon(FontAwesomeIcons.truck , color: Colors.yellow,),
                          ),
                          Text("    Free \n Shipping",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300))
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (favList.any((item) => item['id'] == searchCubit.searchModel?.datalIST[widget.index].id)) {
                              favList.removeWhere((item) => item['id'] == searchCubit.searchModel?.datalIST[widget.index].id);
                              print("Removed item from the set: $favList");
                            } else {
                              favList.add({
                                'id': searchCubit.searchModel?.datalIST[widget.index].id,
                                'name': searchCubit.searchModel?.datalIST[widget.index].name,
                                'price': searchCubit.searchModel?.datalIST[widget.index].price,
                                'image': searchCubit.searchModel?.datalIST[widget.index].image,
                              });
                              print("Added item to the set: $favList");
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child:
                          favList.any((item) => item['id'] == searchCubit.searchModel?.datalIST[widget.index].id)
                                ? Icon(Icons.favorite, color: AppColors.SecondaryColor,size: 40,)
                                : Icon(Icons.favorite_border, color: AppColors.SecondaryColor,size:40,),

                          ),
                      ),

                      Spacer(),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0 ,right: 11,bottom: 8,),
                            child: Icon(FontAwesomeIcons.moneyBills,color: Colors.green.shade300,),
                          ),
                          Text("Cash on  \n Delivery",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),)
                        ],
                      ),



                    ],
                  ),
                ), // Icons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 17),
                  child: InkWell(
                    onTap: () {
                      cartList.add(CartItem(img: widget.img, name: widget.text, desc: widget.desc, price: widget.price ,index: cartList.length,));
                      print("addded");
                      Fluttertoast.showToast(
                        msg: "Item added",
                        toastLength: Toast.LENGTH_SHORT,
                        timeInSecForIosWeb: 1,
                        backgroundColor: AppColors.MainColor.withOpacity(0.7) ,
                        textColor: Colors.white,
                        fontSize: 16.0,
                        gravity: ToastGravity.BOTTOM,

                      );

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(30),
                         ),
                      width: double.infinity,
                      height: 30,
                      child: Center(child: Text("Add to cart",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
