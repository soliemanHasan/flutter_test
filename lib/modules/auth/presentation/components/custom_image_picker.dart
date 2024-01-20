import 'package:base_project_v2/core/constants/app_colors.dart';
import 'package:base_project_v2/core/paths/svgs_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ImagePicke extends StatefulWidget {
 final void Function()? uploadImage;
 final XFile? image;
  const ImagePicke({
     required this.uploadImage,
     required this.image,
    super.key,
  });

  @override
  State<ImagePicke> createState() => _ImagePickeState();
}

class _ImagePickeState extends State<ImagePicke> {
 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
         const  SizedBox(width: 10,),
          SvgPicture.asset(
            SvgsPaths.imageIcon,
            fit: BoxFit.scaleDown,
          ),
        const  SizedBox(width: 5,),
          const Text(
            'residencyPhoto',
            style: TextStyle(color: AppColors.hintColor, fontSize: 15),
          ),
        ]),
        InkWell(
          onTap:widget.uploadImage ,
          child:widget.image==null? Container(
            width: 370,
            height: 63,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.textFieldBorderColor,
                  width: 1,
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  SvgsPaths.uplodImage,
                  fit: BoxFit.scaleDown,
                ),
              )):Icon(Icons.done),
        ),
      ],
    );
  }
}
