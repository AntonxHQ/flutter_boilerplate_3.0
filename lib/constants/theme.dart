import 'package:antonx_flutter_boilerplate_3/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  ///LIGHT THEME
  ThemeData lightTheme = ThemeData(
    ///
    fontFamily: "inter",
    cardColor: kcWhiteColor,
    hintColor: kcPrimaryColor,
    canvasColor: kcWhiteColor,
    focusColor: kcPrimaryColor,
    hoverColor: kcPrimaryColor,
    splashColor: kcPrimaryColor,
    brightness: Brightness.light,
    dividerColor: kcPrimaryColor,
    disabledColor: kcPrimaryColor,
    indicatorColor: kcPrimaryColor,
    primaryColor: kcBackgroundColor,
    dialogBackgroundColor: kcWhiteColor,
    scaffoldBackgroundColor: kcGreyColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,

    ///TEXT FIELD THEME
    inputDecorationTheme: InputDecorationTheme(
      fillColor: kcWhiteColor,
      hintStyle: const TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.3,
        color: kcGreyColor,
      ),
      enabledBorder: outlineBorder,
      border: outlineBorder,
      focusedBorder: outlineBorder.copyWith(
        borderSide: const BorderSide(color: kcPrimaryColor),
      ),
    ),

    ///COLOR SCHEME
    colorScheme:
        const ColorScheme.light(background: kcLightGrey, error: kcPrimaryColor),

    ///FLOATING ACTION BUTTON THEME
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kcLightGrey,
      foregroundColor: kcMediumGrey,
    ),

    ///DIALOG THEME
    dialogTheme: const DialogTheme(
      backgroundColor: kcPrimaryColor,
      iconColor: kcPrimaryColor,
      shadowColor: kcPrimaryColor,
      contentTextStyle: TextStyle(),
      titleTextStyle: TextStyle(),
    ),

    ///TEXT THEME
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: kcPrimaryColor, fontSize: 14),
      bodySmall: TextStyle(color: kcPrimaryColor, fontSize: 14),
      bodyLarge: TextStyle(color: kcPrimaryColor, fontSize: 14),

      ///
      headlineMedium: TextStyle(color: kcPrimaryColor, fontSize: 14),
      headlineLarge: TextStyle(
          fontSize: 35, fontWeight: FontWeight.w900, color: kcWhiteColor),
      headlineSmall: TextStyle(color: kcPrimaryColor, fontSize: 14),

      ///
      titleSmall: TextStyle(color: kcPrimaryColor, fontSize: 14),
      titleMedium: TextStyle(color: kcPrimaryColor, fontSize: 14),
      titleLarge: TextStyle(color: kcPrimaryColor, fontSize: 14),

      ///
      labelLarge: TextStyle(color: kcPrimaryColor, fontSize: 14),
      labelMedium: TextStyle(color: kcPrimaryColor, fontSize: 14),
      labelSmall: TextStyle(color: kcPrimaryColor, fontSize: 14),
    ),

    ///CARD THEME
    cardTheme: const CardTheme(
      color: kcPrimaryColor,
      margin: EdgeInsets.all(8),
      clipBehavior: Clip.none,
    ),

    ///SNACKBAR THEME
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: kcPrimaryColor,
      closeIconColor: kcBackgroundColor,
      behavior: SnackBarBehavior.floating,
    ),

    ///BUTTON THEME
    buttonTheme: const ButtonThemeData(
      buttonColor: kcPrimaryColor,
      focusColor: kcLightGrey,
      disabledColor: kcGreyColor,
      splashColor: kcMediumGrey,
      padding: EdgeInsets.all(8),
      height: 40,
      minWidth: 200,
    ),
  );

  ///DARK THEME
  ThemeData darkTheme = ThemeData(
      fontFamily: "inter",
      cardColor: kcWhiteColor,
      hintColor: kcPrimaryColor,
      canvasColor: kcWhiteColor,
      focusColor: kcPrimaryColor,
      hoverColor: kcPrimaryColor,
      splashColor: kcPrimaryColor,
      brightness: Brightness.light,
      dividerColor: kcPrimaryColor,
      disabledColor: kcPrimaryColor,
      indicatorColor: kcPrimaryColor,
      primaryColor: kcBackgroundColor,
      dialogBackgroundColor: kcWhiteColor,
      scaffoldBackgroundColor: kcGreyColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: const ColorScheme.dark(background: kcLightGrey),

      ///TEXT FIELD THEME
      inputDecorationTheme: InputDecorationTheme(
        fillColor: kcWhiteColor,
        hintStyle: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.3,
          color: kcGreyColor,
        ),
        enabledBorder: outlineBorder,
        border: outlineBorder,
        focusedBorder: outlineBorder.copyWith(
          borderSide: const BorderSide(color: kcPrimaryColor),
        ),
      ),

      ///TEXT THEME
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: kcPrimaryColor, fontSize: 14),
        bodySmall: TextStyle(color: kcPrimaryColor, fontSize: 14),
        bodyLarge: TextStyle(color: kcPrimaryColor, fontSize: 14),

        ///
        headlineMedium: TextStyle(color: kcPrimaryColor, fontSize: 14),
        headlineLarge: TextStyle(color: kcPrimaryColor, fontSize: 14),
        headlineSmall: TextStyle(color: kcPrimaryColor, fontSize: 14),

        ///
        titleSmall: TextStyle(color: kcPrimaryColor, fontSize: 14),
        titleMedium: TextStyle(color: kcPrimaryColor, fontSize: 14),
        titleLarge: TextStyle(color: kcPrimaryColor, fontSize: 14),

        ///
        labelLarge: TextStyle(color: kcPrimaryColor, fontSize: 14),
        labelMedium: TextStyle(color: kcPrimaryColor, fontSize: 14),
        labelSmall: TextStyle(color: kcPrimaryColor, fontSize: 14),
      ),

      ///FLOATING ACTION BUTTON THEME
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: kcLightGrey,
        foregroundColor: kcMediumGrey,
      ),

      ///DIALOG THEME
      dialogTheme: const DialogTheme(
        backgroundColor: kcPrimaryColor,
        iconColor: kcPrimaryColor,
        shadowColor: kcPrimaryColor,
        contentTextStyle: TextStyle(),
        titleTextStyle: TextStyle(),
      ),

      ///CARD THEME
      cardTheme: const CardTheme(
        color: kcPrimaryColor,
        margin: EdgeInsets.all(8),
        clipBehavior: Clip.none,
      ),

      ///SNACKBAR THEME
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: kcPrimaryColor,
        closeIconColor: kcBackgroundColor,
        behavior: SnackBarBehavior.floating,
      ),

      ///BUTTON THEME
      buttonTheme: const ButtonThemeData(
        buttonColor: kcPrimaryColor,
        focusColor: kcLightGrey,
        disabledColor: kcGreyColor,
        splashColor: kcMediumGrey,
        padding: EdgeInsets.all(8),
        height: 40,
        minWidth: 200,
      ));
}

final OutlineInputBorder outlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(color: kcGreyColor, width: 1),
);
