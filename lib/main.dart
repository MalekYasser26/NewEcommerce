import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:new_ecommerce/Cubit/cust_bottom_nav_cubit.dart';
import 'package:new_ecommerce/Cubit/search_cubit.dart';
import 'package:new_ecommerce/Screens/SplashScreen.dart';
import 'package:new_ecommerce/Shared%20Preferences/SharedPref.dart';

import 'BlocObserver.dart';
import 'Cubit/login_cubit.dart';
import 'Cubit/main_cubit.dart';
import 'Cubit/register_cubit.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await CacheHelper.init();
  bool onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;
  String token = CacheHelper.getData(key: 'token')??"";
  Bloc.observer = MyBlocObserver();
  runApp( MyApp(onBoarding: onBoarding, token: token,));
}

class MyApp extends StatelessWidget {
final bool onBoarding;
final String token;
   MyApp({required this.onBoarding, required this.token,});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider(create: (context) =>LoginCubit(),),
      BlocProvider(create: (context) =>RegisterCubit(),),
      BlocProvider(create: (context) =>CustBottomNavCubit(),),
      BlocProvider(create: (context) =>SearchCubit(),),
      BlocProvider(create: (context) =>MainCubit()..getProducts()..getBanners(),),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
        SplashScreen(onBoarding: onBoarding, token: token,
        )
      ),
    );
  }
}
