
import 'package:base_project_v2/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RegiseterButton extends StatelessWidget {
  final void Function()? onPressed;
   RegiseterButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
        width: 370,
        height: 52,
        child: ElevatedButton(
          onPressed:onPressed,
          style:
              ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
          child: const Text(
            'Login',
            style: TextStyle(color: AppColors.white),
          ),
        ));
  }
}


