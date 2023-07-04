import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ecommerce/Constants/Constants.dart';

import '../Cubit/register_cubit.dart';

class PasswordWidgetRegister extends StatefulWidget {
  PasswordWidgetRegister({Key? key}) : super(key: key);

  @override
  State<PasswordWidgetRegister> createState() => _PasswordWidgetRegisterState();
}

class _PasswordWidgetRegisterState extends State<PasswordWidgetRegister> {

  bool eyePass = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: BlocProvider.of<RegisterCubit>(context).passwordController,
        obscureText: eyePass,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.SecondaryColor)
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
          hintText: "Please Enter Your Password",
          prefixIcon: Icon(Icons.lock_outline_rounded,color: AppColors.SecondaryColor),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.MainColor)),
          suffixIcon: IconButton(
            icon: Icon(
              color: AppColors.SecondaryColor,
              eyePass ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                eyePass = !eyePass;
              });
            },
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter Password";
          } else if (value.length < 8) {
            return "Password must be 8 or more";
          }
          return null;
        },

      ),
    );
  }
}