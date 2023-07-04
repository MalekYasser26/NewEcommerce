import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Constants/Constants.dart';
import '../Cubit/register_cubit.dart';

class EmailWidgetRegister extends StatefulWidget {
   EmailWidgetRegister({Key? key}) : super(key: key);

  @override
  State<EmailWidgetRegister> createState() => _EmailWidgetRegisterState();
}

class _EmailWidgetRegisterState extends State<EmailWidgetRegister> {

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
textDirection: TextDirection.ltr,
        onTapOutside: (event) =>
            FocusManager.instance.primaryFocus?.unfocus(),
        controller: BlocProvider.of<RegisterCubit>(context).emailController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.SecondaryColor)
          ),
          border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(10),
        ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff4a4bb7))),
          hintText: "Please Enter Your Email",
          prefixIcon: Icon(Icons.email_outlined,color: AppColors.SecondaryColor),),
        keyboardType: TextInputType.emailAddress,


        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter Email";
          } else if (
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(BlocProvider.of<RegisterCubit>(context).emailController.text!)==false)
          {
            return "Enter a correct email form";
          }
          return null;
        },

      ),
    );
  }
}
