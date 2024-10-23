import 'package:flutter/material.dart';

import '../../../../../core/const/styles.dart';

class OnboardingTextSection extends StatelessWidget {
  const OnboardingTextSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              "تطبيق العبادات",
              style: Styles.textStyle27,
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "تعلم الدين الاسلامي عن طريق تصنيفات وملفات وشروحات ومحاضرات ٫٫الخ , يوفر أوقات الصلاة وخطب والقرآن الكريم كامل مع توفير تفسير وقراءة بالصوت ٫٫ اكتشف المزيد بنفسك ",
            style: Styles.textStyle16,
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
