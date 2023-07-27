import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_ecommerce/Constants/Constants.dart';
import 'package:new_ecommerce/Cubit/login_cubit.dart';
import 'package:new_ecommerce/Widgets/EmailWidgetRegister.dart';
import 'package:new_ecommerce/Widgets/NameWidget.dart';
import 'package:new_ecommerce/Widgets/PasswordWidgetRegister.dart';
import 'package:new_ecommerce/Widgets/PhoneWidget.dart';

import '../Cubit/register_cubit.dart';
import 'LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
  listener: (context, state) {
    if (state is RegisterFailureState){
      Fluttertoast.showToast(
          backgroundColor: AppColors.SecondaryColor,
          msg: "${BlocProvider.of<RegisterCubit>(context).loginModel?.message}");
    }
    if (state is RegisterSuccessState){
      Fluttertoast.showToast(
          backgroundColor: AppColors.SecondaryColor,
          msg: "REGISTER SUCCESSFUL");
      Fluttertoast.showToast(
          backgroundColor: AppColors.SecondaryColor,
          msg: "Please Go To The Login Page And Login ");
    }
    }

    // TODO: implement listener
  ,
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formkey,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.MainColor.withOpacity(.7),
                  AppColors.SecondaryColor.withOpacity(.3),

                ] ),
          ),

          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Center(child: Image.asset('assets/images/logoblue.png',width: 150,height: 150,)),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.MainColor)),
                ),
                NameWidget(),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Phone",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.MainColor)),
                ),
                PhoneWidget(),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Email",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.MainColor)),
                ),
                EmailWidgetRegister(),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.MainColor)),
                ),
                PasswordWidgetRegister(),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: state is! RegisterLoadingState ? GestureDetector(
                    onTap: () {
                      if (formkey.currentState!.validate()){
                        BlocProvider.of<RegisterCubit>(context).Register(
                          email: BlocProvider.of<RegisterCubit>(context).emailController.text,
                          password: BlocProvider.of<RegisterCubit>(context).passwordController.text,
                          name: BlocProvider.of<RegisterCubit>(context).nameController.text,
                          phone: BlocProvider.of<RegisterCubit>(context).phoneController.text,
                        );


                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: AppColors.MainColor),
                      width: double.infinity,
                      height: 50,
                      child: Center(child: Text("Register",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                    ),
                  ) : Center(
                    child: CircularProgressIndicator(
                      color: AppColors.MainColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account ?",style: TextStyle(color: AppColors.SecondaryColor,fontSize: 15,fontWeight: FontWeight.bold),),
                    TextButton(onPressed:
                        () {
                      debugPrint("register");
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                    },
                        child: Text("Login",style: TextStyle(color: AppColors.MainColor,fontSize: 18,fontWeight: FontWeight.bold),))
                  ],)


              ],
            ),
          ),
        ),
      ),


    );
  },
);
  }
}
