import 'package:base_project_v2/core/constants/app_colors.dart';
import 'package:base_project_v2/core/constants/app_shadow.dart';
import 'package:flutter/material.dart';

extension CategoryComponentTheme on ThemeData {
  BoxDecoration get categoryDecoration {
    return BoxDecoration(
      color: AppColors.white,
      border: Border.all(width: 1, color: AppColors.darkGrey),
      boxShadow: [AppShadows.normalShadow],
      borderRadius: BorderRadius.circular(10),
    );
  }
}
