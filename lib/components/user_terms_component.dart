import 'package:flutter/material.dart';

import '../values/colors.dart';
import '../values/strings.dart';

class UserTermsComponent extends StatelessWidget {
  const UserTermsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: Strings.userTermsPrefix,
        style: TextStyle(
          fontSize: 10,
          color: AppColors.white,
        ),
        children: [
          TextSpan(
            text: ' ',
            style: TextStyle(
              fontSize: 10,
              color: AppColors.white,
            ),
          ),
          TextSpan(
            text: Strings.userTerms,
            style: TextStyle(
              fontSize: 10,
              color: AppColors.white,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ' ',
            style: TextStyle(
              fontSize: 10,
              color: AppColors.white,
            ),
          ),
          TextSpan(
            text: Strings.userTermsSuffix,
            style: TextStyle(
              fontSize: 10,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
