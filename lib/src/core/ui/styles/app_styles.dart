import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text_styles.dart';

class AppStyles {
  static AppStyles? _instance;

  AppStyles._();

  static AppStyles get instance {
    _instance ??= AppStyles._();
    return _instance!;
  }

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        backgroundColor: AppColors.instance.primary,
        textStyle: TextStyles.instance.textButtonLabel,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      );
}

extension AppStylesExtension on BuildContext {
  AppStyles get styles => AppStyles.instance;
}
