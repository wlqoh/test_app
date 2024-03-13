import 'package:flutter/material.dart';

import 'package:auth_task/utils/constants.dart';

class DefaultButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String text;
  final void Function() onPressed;
  final double? fontSize;
  final FontWeight? fontWeight;

  const DefaultButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.borderRadius,
    this.foregroundColor,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        // splashFactory: NoSplash.splashFactory,
        elevation: MaterialStateProperty.all<double>(0),
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(double.maxFinite, 60),
        ),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
        )),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontWeight: fontWeight ?? FontWeight.bold,
            color: Colors.white,
            fontSize: fontSize ?? 18,
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
            backgroundColor ?? MyColors.kPrimaryColor),
        foregroundColor:
            MaterialStateProperty.all<Color>(foregroundColor ?? Colors.white),
      ),
      child: Text(text),
    );
  }
}
