import 'package:flutter/material.dart';
import 'app_text.dart';
import 'colors.dart';
import '../services/app_services.dart'; 

class CustomTextButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomTextButton({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        AppServices.playSoundEffect();
        if (onPressed != null) {
          onPressed!();
        }
      },
      child: AppText(text: '$title >>>', color: grey, fontSize: 14),
    );
  }
}
