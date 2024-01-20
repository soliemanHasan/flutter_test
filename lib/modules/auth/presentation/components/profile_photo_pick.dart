import 'dart:io';

import 'package:base_project_v2/core/constants/app_colors.dart';
import 'package:base_project_v2/core/paths/svgs_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePhotoPick extends StatefulWidget {
   final void Function()? uploadImage;
 final XFile? image;
  const ProfilePhotoPick({super.key,required this.image,required this.uploadImage});

  @override
  State<ProfilePhotoPick> createState() => _ProfilePhotoPickState();
}

class _ProfilePhotoPickState extends State<ProfilePhotoPick> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.uploadImage,
      child: Stack(
        children: [
          Container(
            height: 99,
            width: 99,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.imageCircl,
            ),
            child:widget.image==null? const SizedBox():
            ClipOval(
              child: SizedBox.fromSize(
                size:const Size.fromRadius(90),
                child: Image.file(File(widget.image!.path),fit: BoxFit.cover,))),
          ),
          Positioned(
              bottom: 10, right: 0, child: SvgPicture.asset(SvgsPaths.camera)),
        ],
      ),
    );
  }
}
