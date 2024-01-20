import 'package:base_project_v2/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AuthTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final Widget? icon;
  final bool isPass;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final BorderRadius? borderRadius;
  final Widget? prefixIcon;
  final EdgeInsets? padding;
  final bool readOnly;
  final void Function(String)? onChanged;

  const AuthTextFormField({
    super.key,
    this.controller,
    this.hint,
    this.icon,
    this.keyboardType,
    this.isPass = false,
    this.validator,
    this.borderRadius,
    this.padding,
    this.prefixIcon,
    this.readOnly = false,
    this.onChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AuthTextFormFieldState createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  bool _hide = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: 370,
        height: 48,
        child: TextFormField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          style: const TextStyle(color: AppColors.black),
          validator: widget.validator,
          decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: const TextStyle(color: AppColors.hintColor),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.icon ??
                  (widget.isPass
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _hide = !_hide;
                            });
                          },
                          icon: _hide
                              ? Icon(
                                  Icons.visibility_off,
                                  size: 18,
                                )
                              : Icon(
                                  Icons.visibility,
                                  size: 18,
                                ))
                      : null),
              isDense: true,
              fillColor: AppColors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AppColors.textFieldBorderColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.focusedCBorderColor),
                  borderRadius: BorderRadius.circular(20))),
          obscureText: widget.isPass && _hide,
          keyboardType: widget.keyboardType,
        ),
      ),
    );
  }
}

      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      //  TextFormField(
       
      //   readOnly: widget.readOnly,
      //   onTapOutside: (event) => FocusScope.of(context).unfocus(),
      //   controller: widget.controller,
      //   decoration: InputDecoration(
          
      //     hintText: widget.hint,
      //     prefixIcon: widget.prefixIcon,
      //     suffixIcon: widget.icon ??
      //         (widget.isPass
      //             ? IconButton(
      //                 onPressed: () {
      //                   setState(() {
      //                     _hide = !_hide;
      //                   });
      //                 },
      //                 icon: _hide
      //                     ? Icon(
      //                         Icons.visibility_off,
      //                         size: 18,
      //                       )
      //                     : Icon(
      //                         Icons.visibility,
      //                         size: 18,
      //                       ))
      //             : null),
      //     isDense: true,
      //   ),
      //   obscureText: widget.isPass && _hide,
      //   keyboardType: widget.keyboardType,
      // ),
 