import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import 'colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final bool isLink;
  final Color? color;
  final int? maxLines;
  final double? height;
  final double? fontSize;
  final String? fontFamily;
  final double? wordSpacing;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  const AppText({
    super.key,
    required this.text,
    this.fontSize,
    this.height,
    this.color,
    this.isLink = false,
    this.fontWeight,
    this.fontFamily,
    this.textStyle,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.wordSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          textStyle ??
          TextStyle(
            color: color ?? white,
            fontSize: fontSize ?? 15,
            wordSpacing: wordSpacing,
            decorationThickness: isLink ? 2 : 0,
            fontWeight: fontWeight ?? FontWeight.w400,
            decorationColor: isLink ? blue : transparent,
            fontFamily: fontFamily ?? AppConstants.poppins,
            decoration: isLink ? TextDecoration.underline : TextDecoration.none,
          ),

      overflow: overflow,
      maxLines: maxLines,
      textScaler: _shouldApplyFixedScaler(context) ? const TextScaler.linear(1.0) : MediaQuery.textScalerOf(context),
    );
  }

  bool _shouldApplyFixedScaler(BuildContext context) {
    final textScaler = MediaQuery.textScalerOf(context);
    final double scaleFactor = textScaler.scale(16);

    return scaleFactor > 1.0;
  }
}
