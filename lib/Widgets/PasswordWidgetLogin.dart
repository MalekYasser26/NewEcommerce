import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Constants/Constants.dart';
import '../Cubit/login_cubit.dart';

class PassWidgetLogin extends StatefulWidget {
  const PassWidgetLogin({Key? key}) : super(key: key);

  @override
  State<PassWidgetLogin> createState() => _PassWidgetLoginState();
}
bool eyePass = true;

class _PassWidgetLoginState extends State<PassWidgetLogin> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: BlocProvider.of<LoginCubit>(context).passwordController,
        obscureText: eyePass,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
          hintText: "Please Enter Your Password",
          prefixIcon: Icon(Icons.lock_outline_rounded),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.SecondaryColor)
          ),
          prefixIconColor: AppColors.SecondaryColor,
          suffixIconColor: AppColors.SecondaryColor,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.MainColor)),
          suffixIcon: IconButton(
            icon: Icon(
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
