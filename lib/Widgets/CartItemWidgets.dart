import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Constants/Constants.dart';

class CartItem extends StatefulWidget {
  var img , name , desc , price , index ;
  CartItem({Key? key, required this.img, required  this.name, required this.desc,required  this.price, required this.index}) : super(key: key);
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int numItems = 1 ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
        ),
        width: 330,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.MainColor)
              ),
              child: FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                image: "${widget.img}",height: 130,width: 100,placeholder: "assets/images/imgplaceholder.png",
              ),
            ) , // Image
            SizedBox(width: 15,),
            SizedBox(
              width: 110,
              child: Column(
                children: [
                  SizedBox(
                      width: 100,
                      child: Text("${widget.name}",maxLines: 2,overflow: TextOverflow.ellipsis,)),
                  SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.only(left :8.0 , bottom: 8),
                    child: SizedBox(
                        width: 100,
                        child: Text("${widget.desc}",maxLines: 4,overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black45,fontSize: 13),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        InkWell(

                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    AppColors.MainColor.withOpacity(.7),
                                    AppColors.SecondaryColor.withOpacity(.3)
                                  ] ),
                            ),
                            child: Center(child: Text("-",style: TextStyle(color: Colors.white,fontSize: 25),)),
                          ),
                          onTap: () {
                          numItems >1 ?  numItems-- : Fluttertoast.showToast(
                              msg: "You can't order zero items !",
                              toastLength: Toast.LENGTH_SHORT,
                              timeInSecForIosWeb: 1,
                              backgroundColor: AppColors.MainColor.withOpacity(0.7) ,
                              textColor: Colors.white,
                              fontSize: 16.0,
                              gravity: ToastGravity.CENTER,

                          );
                            print(numItems);
                            setState(() {
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text("$numItems",style: TextStyle(fontSize: 20)),
                        ),
                        InkWell(

                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    AppColors.MainColor.withOpacity(.7),
                                    AppColors.SecondaryColor.withOpacity(.3)
                                  ] ),
                            ),
                            child: Center(child: Text("+",style: TextStyle(color: Colors.white,fontSize: 25),)),
                          ),
                          onTap: () {
                            numItems++;
                            print(numItems);
                            setState(() {
                            });
                          },
                        ),
                        Spacer(),

                      ],
                    ),
                  ),
                ],
              ),
            ), // Name , desc , no.Items
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 110,),
                widget.price is String ? Text("${double.parse(widget.price)*numItems} L.E",style: TextStyle(color: AppColors.MainColor),) :
                Text("${widget.price*numItems} L.E",style: TextStyle(color: AppColors.MainColor),)
              ],
            )

          ],
        ),
      ),
    );
  }
}
