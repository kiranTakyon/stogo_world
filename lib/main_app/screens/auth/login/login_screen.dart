import 'package:flutter/material.dart';

import '../../../constants/asset_resources.dart';
import '../../../reusables/custom_text_field.dart';
import '../../../reusables/sized_box.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(AssetResources.splashBg, fit: BoxFit.fill)),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(controller: emailController),
                  sh10,
                  CustomTextFormField(controller: passwordController),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
