import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Loaders{

  static Flushbar showErrorMessage({
    String title = "Oh Snap!",
    required String message,
    required BuildContext context,
    int durationSeconds = 3,
  }){
    return Flushbar(
      title: title,
      message: message,
      margin: REdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8.r),
      duration: Duration(seconds: durationSeconds),
      backgroundColor: Colors.red,
      icon: Icon(
        Icons.info_outline,
        size: 28.0.r,
        color: Colors.white,
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.red[800]!,
          offset: const Offset(0.0, 2.0),
          blurRadius: 3.0,)
      ],
    )..show(context);
  }

  static Flushbar showSuccessMessage({
    String title = "Note!",
    required String message,
    required BuildContext context,
    int durationSeconds = 3,
  }){
    return Flushbar(
      title: title,
      message: message,
      margin: REdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8.r),
      duration: Duration(seconds: durationSeconds),
      icon: Icon(
        Icons.info_outline,
        size: 28.0.r,
        color: Colors.white,
      ),
      backgroundGradient: const LinearGradient(
          colors: [
            Colors.blue,
            Colors.teal
          ]
      ),
      backgroundColor: Colors.red,
      boxShadows: [
        BoxShadow(
          color: Colors.blue[800]!,
          offset: const Offset(0.0, 2.0),
          blurRadius: 3.0,)
      ],
    )..show(context);
  }
}