import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({super.key, required this.onPressed, required this.icon});

  final dynamic onPressed;
  final dynamic icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.sp),
      child: IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 50.r,
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 30.sp,
          )),
    );
  }
}
