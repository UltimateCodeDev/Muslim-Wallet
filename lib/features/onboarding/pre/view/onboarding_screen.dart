import 'package:flutter/material.dart';
import 'package:muslim_wallet/core/const/colors.dart';
import 'package:muslim_wallet/features/onboarding/pre/view/widgets/onboarding_button.dart';
import 'package:muslim_wallet/features/onboarding/pre/view/widgets/onboarding_images_section.dart';
import 'package:muslim_wallet/features/onboarding/pre/view/widgets/onboarding_text_section.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppLightColors.background,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: const Column(
            children: [
              OnboardingImagesSction(),
              OnboardingTextSection(),
              OnboardingButton()
            ],
          ),
        ),
      )),
    );
  }
}
