
import 'dart:typed_data';

import 'package:base_project_v2/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MapScreenShot extends StatelessWidget {
 const  MapScreenShot({
    super.key,
    required this.snapshotImage,
  });

  final Uint8List? snapshotImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.fromLTRB(0, 10, 0, 20),
              height: 143,
              width: 370,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1, color: AppColors.textFieldBorderColor),
              ),
              child: snapshotImage == null
                  ? const Text(
                      'No Location Chosen',
                      textAlign: TextAlign.center,
                    )
                  : ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.memory(
                       snapshotImage !,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        
                      ),
                  ),
            );
  }
}


