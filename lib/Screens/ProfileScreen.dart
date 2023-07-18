import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ecommerce/Constants/Constants.dart';

import '../Cubit/login_cubit.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
          leading: Icon(Icons.arrow_back_ios,color: AppColors.MainColor),
        //  elevation: 0,
          centerTitle: true,
          title: Text("Profile" , style: TextStyle(color: Colors.black,fontSize: 30,)),
          backgroundColor: Colors.white,
        ),
        body: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColors.MainColor.withOpacity(.7),
                AppColors.SecondaryColor.withOpacity(.3)
              ] ),
        ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical:10 ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      AppColors.MainColor.withOpacity(.7),
                      AppColors.SecondaryColor.withOpacity(.3)
                    ] ),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(child: Image.asset('assets/images/person_placeholder.png' ,height: 60,width: 60,),
                            decoration: BoxDecoration(borderRadius:BorderRadius.circular(50) ),clipBehavior: Clip.antiAlias),
                      ),
                      SizedBox(width: 20,),
                      Padding(
                        padding: const EdgeInsets.only(top :25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${BlocProvider.of<LoginCubit>(context).loginModel?.data?.name}",style: TextStyle(
                                fontSize: 20,fontWeight: FontWeight.bold ,
                            color: Colors.white),),
                            SizedBox(height: 5,),
                            Text("${BlocProvider.of<LoginCubit>(context).loginModel?.data?.email}" , style: TextStyle(fontSize: 15,
                                color: Colors.white),),
                          ],
                        ),
                      )

                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.MainColor
                    ),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.MainColor.withOpacity(.4),
                            AppColors.SecondaryColor.withOpacity(.15)
                          ] ),
                      borderRadius: BorderRadius.circular(15)
                  ),

                  width: double.infinity,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: ProfileText.length,
                      separatorBuilder: (context, index) => SizedBox(height: 0,),
                      itemBuilder:(context, index) => ListTile(
                        leading: Icon(ProfileIcons[index]),
                        title: Text("${ProfileText[index]}",style: TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text("${ProfileSubText[index]}"),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                      )  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*Row(
                      children:[
                        Expanded(child: Icon(Icons.add_circle)),
                        Column(
                          children: [
                            Text("Text",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                            Text("SubtextSubtext",),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_outlined),
                      ]
                    ),*/
