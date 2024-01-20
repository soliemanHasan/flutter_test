import 'package:base_project_v2/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDrowpDownFormField extends StatefulWidget {
  final String hint;
  final int? value;
  final List<DropdownMenuItem<int>>? items;
  final Function(int?)? onChanged;
  final Widget? icon;
  final String iconPath;
  const CustomDrowpDownFormField(
      {super.key,
      required this.hint,
      required this.value,
      required this.items,
      required this.onChanged,
      required this.iconPath,
      required this.icon});

  @override
  State<CustomDrowpDownFormField> createState() =>
      _CustomDrowpDownFormFieldState();
}

class _CustomDrowpDownFormFieldState extends State<CustomDrowpDownFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370,
      height: 70,
      child: DropdownButtonFormField<int>(
        hint: Row(
          children: [
            SvgPicture.asset(
              widget.iconPath,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.hint,
              style: const TextStyle(color: AppColors.hintColor, fontSize: 15),
            ),
          ],
        ),
        value: widget.value,
        items: widget.items,
        onChanged: widget.onChanged,
        icon: widget.icon,
        borderRadius: BorderRadius.circular(20),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.textFieldBorderColor),
          ),
          fillColor: AppColors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: AppColors.textFieldBorderColor,
            ),
          ),
        ),
      ),
    );
  }
}
