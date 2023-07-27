import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ecommerce/Constants/Constants.dart';
import 'package:new_ecommerce/Cubit/login_cubit.dart';
import 'package:new_ecommerce/Widgets/CategoryItem.dart';
import 'package:new_ecommerce/Widgets/SuggestionItem.dart';

import '../Cubit/main_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mainCubit = BlocProvider.of<MainCubit>(context) ;
    return BlocConsumer<MainCubit, MainStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
extendBody: true,
      appBar:  AppBar(
        leadingWidth: 73,
        backgroundColor: Colors.white,
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
        leading:
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 15),
              child: Container(

                  child: Image.asset('assets/images/person_placeholder.png',),
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(50), ),clipBehavior: Clip.antiAlias),
            ),
          ],
        ),
        title: Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text("Welcome",style: TextStyle(color: AppColors.SecondaryColor,fontSize: 13)),
            Text("${BlocProvider.of<LoginCubit>(context).loginModel?.data?.name}",style: TextStyle(color: Colors.black,fontSize: 17),)
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0,top: 5),
            child: Icon(Icons.notifications,color: Colors.black,size: 30,),
          )
        ],
      ),



      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.MainColor.withOpacity(.7),
              AppColors.SecondaryColor.withOpacity(.3)
            ] ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(children: [
                Text("|",style: TextStyle(fontSize: 40,color: AppColors.SecondaryColor),),
                Text("  HOT PRODUCTS",style: TextStyle(fontSize: 25,color: AppColors.MainColor),),
              ],),
            ),
            mainCubit.BannersData.isEmpty?
            SizedBox(child: CircularProgressIndicator()) :
            SizedBox(
              height: 200,
              width: double.infinity,
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: mainCubit.BannerController,
                  itemCount: mainCubit.BannersData.length,
                  itemBuilder:(context, index) {
                    final bannerItem = mainCubit.BannersData[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                          child: Stack(children:
                          [
                            Image.network(bannerItem.image!,height: 200,width:400 ,),
                            Positioned(
                              right: 40,
                              bottom: 65,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 15,
                                child: Icon(Icons.arrow_forward_ios,color: AppColors.MainColor),
                              ),
                            )
                          ],
                          )),
                    );
                  }

              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(children: [
                Text("|",style: TextStyle(fontSize: 40,color: AppColors.SecondaryColor),),
                Text("  CATEGORIES",style: TextStyle(fontSize: 25,color: AppColors.MainColor),),
                Expanded(child: SizedBox()),
                Text("See all" , style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.MainColor,fontSize: 18),)
              ],),
            ),
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(width:10),
                  itemCount:Categories.length ,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CategoryItem(catIcon: CatIcons[index], catText: "${Categories[index]}")),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(children: [
                Text("|",style: TextStyle(fontSize: 40,color: AppColors.SecondaryColor),),
                Text("  PERHAPS YOU'LL LIKE IT",style: TextStyle(fontSize: 20,color: AppColors.MainColor),),
              ],),
            ),
            mainCubit.ProductData.isEmpty?
            CircularProgressIndicator():
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>productItem(productText: "${mainCubit.ProductData[index].name}",
                    imgPath:"${mainCubit.ProductData[index].image}",price:"${mainCubit.ProductData[index].price}" ,
                    desc: "${mainCubit.ProductData[index].description}",
                      index: index,
                    )
                    , separatorBuilder: (context, index) => SizedBox(width: 10,), itemCount: 6),
              )


          ],
        ),
      ),

    );
  },
);
  }
}
