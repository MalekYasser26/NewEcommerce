import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_ecommerce/Constants/Constants.dart';
import 'package:new_ecommerce/Cubit/login_cubit.dart';
import 'package:new_ecommerce/Screens/BottomNavBarScreen.dart';
import 'package:new_ecommerce/Screens/HomeScreen.dart';
import 'package:new_ecommerce/Screens/RegisterScreen.dart';
import 'package:new_ecommerce/Widgets/EmailWidgetLogin.dart';
import 'package:new_ecommerce/Widgets/PasswordWidgetLogin.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if (state is LoginFailureState){
      Fluttertoast.showToast(
        toastLength: Toast.LENGTH_LONG,
          backgroundColor: AppColors.SecondaryColor,
          msg: "${BlocProvider.of<LoginCubit>(context).loginModel?.message}");
    }
    if (state is LoginSuccessState){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>BottomNavBarScreen() ,));

    }
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/images/logoblue.png',width: 150,height: 150,))
              ,SizedBox(height: 40,),
              Center(child: Text("Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: AppColors.MainColor))),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Email",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.MainColor)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: EmailWidgetLogin(),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.MainColor)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PassWidgetLogin(),
              ),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: state is! LoginLoadingState ? GestureDetector(
                  onTap: () {
                    if (formkey.currentState!.validate()){
                      BlocProvider.of<LoginCubit>(context).Login(
                          email: BlocProvider.of<LoginCubit>(context).emailController.text,
                          password: BlocProvider.of<LoginCubit>(context).passwordController.text,
                      );
                      print("login success");
                    }
                    else {
                      print("login failure");
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: AppColors.MainColor),
                    width: double.infinity,
                  height: 50,
                    child: Center(child: Text("Login",
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                  ),
                ) : Center(child: CircularProgressIndicator(
                  color: AppColors.MainColor,

                )) ,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Don't have an account ?",style: TextStyle(color: AppColors.SecondaryColor,fontSize: 15,fontWeight: FontWeight.bold),),
                TextButton(onPressed:
                    () {
                      debugPrint("register");
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                    },
                     child: Text("REGISTER",style: TextStyle(color: AppColors.MainColor,fontSize: 18,fontWeight: FontWeight.bold),))
              ],)
            ],

          ),
        ),
      ),
    );
  },
);
  }
}
