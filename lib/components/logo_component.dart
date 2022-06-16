import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../values/colors.dart';
import '../values/strings.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/images/logo.svg',
          height: MediaQuery.of(context).size.height * 0.065,
        ),
        RichText(
          text: TextSpan(
            text: Strings.chronos.toUpperCase(),
            children: [
              const TextSpan(
                text: ' ',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.white,
                ),
              ),
              TextSpan(
                text: Strings.partners.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ],
            style: const TextStyle(color: AppColors.white, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
