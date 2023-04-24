import 'package:flutter/material.dart';
import 'package:flutter_firebase_project/product/constants/color_constants.dart';
import 'package:kartal/kartal.dart';

@immutable
class AppTheme {
  const AppTheme(this.context);

  final BuildContext context;

  ThemeData get theme => ThemeData.light().copyWith(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(16),
            ),
            textStyle: MaterialStateProperty.all<TextStyle?>(
              context.textTheme.titleLarge,
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorConstants.purplePrimary),
            foregroundColor:
                MaterialStateProperty.all<Color>(ColorConstants.white),
          ),
        ),
      );
}
