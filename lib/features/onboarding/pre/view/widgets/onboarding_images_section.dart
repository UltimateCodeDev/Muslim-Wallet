import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        SizedBox(height: 20.h,),
        Image.asset(AppAssets.textImage)
      ],
    );
  }
}
