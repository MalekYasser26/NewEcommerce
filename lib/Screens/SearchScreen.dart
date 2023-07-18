import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ecommerce/Constants/Constants.dart';
import 'package:new_ecommerce/Cubit/login_cubit.dart';
import 'package:new_ecommerce/Cubit/search_cubit.dart';


class SearchScreen extends StatefulWidget {
   SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
bool loveIcon = true ;
int currentIndex = 0 ;
Set favList = {};
class _SearchScreenState extends State<SearchScreen> {
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var searchCubit = BlocProvider.of<SearchCubit>(context) ;
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(

          child: Scaffold(
            extendBody: true,
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: 75,
              backgroundColor: Colors.transparent,
              flexibleSpace:                 Container(
                height: 100,
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
                  padding: const EdgeInsets.only( left:  8.0,right: 8,top: 8),
                  child: TextFormField(
                    controller: BlocProvider.of<SearchCubit>(context).SearchedDATAController,
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        label: Text("Search",style: TextStyle(color: AppColors.SecondaryColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: AppColors.MainColor)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: AppColors.SecondaryColor)
                        ),
                        labelStyle: TextStyle(color: AppColors.MainColor),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              print("reached here");

                              BlocProvider.of<SearchCubit>(context).Search(
                                  SearchedData: BlocProvider.of<SearchCubit>(context).SearchedDATAController.text );
                              print("Searched success");

                            }
                            ,
                            child: Icon(Icons.search_rounded,color: AppColors.SecondaryColor,))
                    ),

                  ),

                ),
              ),

            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      AppColors.MainColor.withOpacity(.7),
                      AppColors.SecondaryColor.withOpacity(.3),

                    ] ),
              ),
              child: ListView(
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          separatorBuilder: (context, index) => Divider(
                            thickness: 2,
                          ),
                          itemCount:searchCubit.dataListLength ,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FadeInImage.assetNetwork(placeholder: "assets/images/imgplaceholder.png",
                                    image: searchCubit.searchModel?.datalIST[index].image
                                , height: 100, width: 100,
                                ),
                                Expanded(
                                  child: Column(
                                    children : [ Text(searchCubit.searchModel?.datalIST[index].name ,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children:[ Text("${searchCubit.searchModel?.datalIST[index].price.toString()} LE",style: TextStyle(
                                          color: AppColors.MainColor
                                        ),),
                                        Spacer(),
                                          IconButton(
                                            icon:favList.contains(searchCubit.searchModel?.datalIST[index].id) ?
                                            Icon(Icons.favorite,color: AppColors.SecondaryColor,) :
                                            Icon(Icons.favorite_border , color: AppColors.SecondaryColor,),
                                            onPressed: () {
                                              setState(() {
                                                if (favList.contains(searchCubit.searchModel?.datalIST[index].id)) {
                                                  favList.remove(searchCubit.searchModel?.datalIST[index].id);
                                                  print("Removed item from the set: $favList");
                                                  print("${BlocProvider.of<LoginCubit>(context).loginModel?.data?.name}");
                                                } else {
                                                  favList.add(searchCubit.searchModel?.datalIST[index].id);
                                                  print("Added item to the set: $favList");
                                                }
                                              });
                                            },
                                          ),

                                        ]
                                      ),
                                    ),

                                    ]
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
