import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Constants/Constants.dart';
import '../Cubit/register_cubit.dart';


class PhoneWidget extends StatefulWidget {
  PhoneWidget({Key? key}) : super(key: key);

  @override
  State<PhoneWidget> createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget> {

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        onTapOutside: (event) =>
            FocusManager.instance.primaryFocus?.unfocus(),
        controller: BlocProvider.of<RegisterCubit>(context).phoneController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.SecondaryColor)
          ),
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff4a4bb7))),
          hintText: "Please Enter Your Phone",
          prefixIcon: Icon(Icons.phone,color: AppColors.SecondaryColor),),
        keyboardType: TextInputType.phone,

        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter Phone number";
          }
          return null;
        },
      ),
    );
  }
}
/*
* malek
* 123123
* malek@malek.com
* malekmalek
* */