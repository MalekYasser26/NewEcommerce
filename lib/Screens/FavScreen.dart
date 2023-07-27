import 'package:flutter/material.dart';

import '../Constants/Constants.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.MainColor.withOpacity(.7),
              AppColors.SecondaryColor.withOpacity(.3),
            ] ),
      ),

    );
  }
}
