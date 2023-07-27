import 'package:flutter/material.dart';
import 'package:new_ecommerce/Constants/Constants.dart';
import 'package:new_ecommerce/Models/BoardingModel.dart';
import 'package:new_ecommerce/Screens/HomeScreen.dart';
import 'package:new_ecommerce/Screens/LoginScreen.dart';
import 'package:new_ecommerce/Shared%20Preferences/SharedPref.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class BoardingScreen extends StatefulWidget {
   BoardingScreen({Key? key}) : super(key: key);

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
final PVController = PageController();

int Bindex = 0 ;
void Submit(){
  CacheHelper.saveData(key: "onBoarding" , value: true).
  then((value) => Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) =>LoginScreen() ,)));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColors.MainColor.withOpacity(.7),
                AppColors.SecondaryColor.withOpacity(.3),
              ] ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (value) {
                    Bindex = value ;
                    setState(() {
                    });
                  },
                  physics: BouncingScrollPhysics(),
                  controller: PVController,
                  itemBuilder: (context, index) {
                    return BoardingItem(BoardingModelItems[index],);
                  },
                itemCount: BoardingModelItems.length,
                ),
              ),
              SizedBox(height: 20,),
              Row(

                children: [
                  Expanded(
                    flex: 2,
                      child: SizedBox(width: 10,)),
                  Expanded(
                    flex: 2,
                    child: SmoothPageIndicator(effect: ColorTransitionEffect(),
                        controller: PVController,
                        count: BoardingModelItems.length),
                  ),

                  FloatingActionButton(
                    backgroundColor: AppColors.MainColor,
                    child: Bindex ==2 ?Icon(Icons.arrow_back_ios_outlined) :
                    Icon(Icons.arrow_forward_ios_outlined),
                    onPressed: () {
                      print(Bindex);
                     Bindex !=2 ? PVController.nextPage(duration: Duration(milliseconds: 1000),
                          curve: Curves.easeInOutCubicEmphasized) :
                     PVController.jumpToPage(0) ;
                    setState(() {
                    });
                    },)

                ],
              ) ,
              ElevatedButton(
                  style:ButtonStyle(
                    backgroundColor: Bindex ==2 ? MaterialStatePropertyAll(AppColors.MainColor) :
                        MaterialStatePropertyAll(Colors.grey)
                  ) ,
                  onPressed: () {
                    if (Bindex==2){
                      Submit();
                  } else {print("Nope");}
                    } ,
                  child:Bindex==2 ? Text("Finished") :
                  const Text("Finished", style: TextStyle(decoration: TextDecoration.lineThrough
                  , decorationThickness: 4
                  ),)
              )
            ],
          ),
        ),
      )

    );
  }

  Widget BoardingItem(BoardingModel model)=> Column(
    children: [
      Expanded(child: Image.asset('${model.image}',)),
      SizedBox(height: 10,),
      Text("${model.title}" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
      , SizedBox(height: 10,),
      Text("${model.body} " , style: TextStyle(fontSize: 15),)
    ],
  ) ;
}
