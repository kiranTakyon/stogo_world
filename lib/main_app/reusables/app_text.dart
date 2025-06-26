import 'package:flutter/material.dart';

import 'colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final double? height;
  final Color? color;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool isLink;
  final TextOverflow? overflow;
  final double? wordSpacing;
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
            fontFamily: fontFamily,
            fontSize: fontSize ?? 15,
            wordSpacing: wordSpacing,
            decorationThickness: isLink ? 2 : 0,
            fontWeight: fontWeight ?? FontWeight.w400,
            decorationColor: isLink ? blue : transparent,
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
