import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Constants/Constants.dart';
import '../Cubit/register_cubit.dart';


class NameWidget extends StatefulWidget {
  NameWidget({Key? key}) : super(key: key);

  @override
  State<NameWidget> createState() => _NameWidgetState();
}

class _NameWidgetState extends State<NameWidget> {

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        onTapOutside: (event) =>
            FocusManager.instance.primaryFocus?.unfocus(),
        controller: BlocProvider.of<RegisterCubit>(context).nameController,
        decoration: InputDecoration(border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff4a4bb7))),
        //  labelText: "Name",
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.SecondaryColor)
          ),
          hintText: "Please Enter Your Name",
          prefixIcon: Icon(Icons.person_outline),
          prefixIconColor: AppColors.SecondaryColor,
        ),
        keyboardType: TextInputType.name,

        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter Name";
          }
          return null;
        },
      ),
    );
  }
}