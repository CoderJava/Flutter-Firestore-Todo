import 'package:flutter/material.dart';
import 'package:flutter_firestore_todo/app_color.dart';

class WidgetBackground extends StatelessWidget {
  final AppColor appColor = AppColor();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -64,
          right: -128,
          child: Container(
            width: 256.0,
            height: 256.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9000),
              color: appColor.colorTertiary,
            ),
          ),
        ),
        Positioned(
          top: -164,
          right: -8.0,
          child: Container(
            width: 256.0,
            height: 256.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9000),
              backgroundBlendMode: BlendMode.hardLight,
              color: Colors.redAccent.withOpacity(0.8),
            ),
          ),
        )
      ],
    );
  }
}
