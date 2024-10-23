import 'package:flutter/material.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/const/styles.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(color: AppLightColors.black, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: MaterialButton(
          onPressed: () {},
          child: Text(
            "ابدأ الآن",
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
