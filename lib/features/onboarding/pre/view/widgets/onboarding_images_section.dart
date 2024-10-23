import 'package:flutter/material.dart';

import '../../../../../core/const/assets.dart';

class OnboardingImagesSction extends StatelessWidget {
  const OnboardingImagesSction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.onboardingImage),
        SizedBox(
          height: 20,
        ),
        Image.asset(AppAssets.textImage)
      ],
    );
  }
}
