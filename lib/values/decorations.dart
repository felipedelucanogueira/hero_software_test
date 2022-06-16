import 'package:flutter/material.dart';

import 'colors.dart';

abstract class Decorations {
  static InputDecoration inputDecoration(
      {String? hintText, IconData? sufixIcon, VoidCallback? onPressed}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: AppColors.white),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.white),
      ),
    );
  }
}
