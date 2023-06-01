import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_shop/styles/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class MonieTheme {
  // static Future initialize() async =>
  //     _prefs = await SharedPreferences.getInstance();
  // static ThemeMode get themeMode {
  //   final darkMode = _prefs?.getBool(kThemeModeKey);
  //   return darkMode == null
  //       ? ThemeMode.system
  //       : darkMode
  //           ? ThemeMode.dark
  //           : ThemeMode.light;
  // }

  // static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
  //     ? _prefs?.remove(kThemeModeKey)
  //     : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static MonieTheme of(BuildContext context) {
    return LightModeTheme();
    // final darkMode = _prefs?.getBool(kThemeModeKey);
    // final brightness =
    //     WidgetsBinding.instance.platformDispatcher.platformBrightness;
    // return darkMode == null
    //     ? brightness == Brightness.dark
    //         ? DarkModeTheme()
    //         : LightModeTheme()
    //     : darkMode
    //         ? DarkModeTheme()
    //         : LightModeTheme();
  }

  Color? primaryColor;
  Color? secondaryColor;
  Color? alternate;
  Color? primaryBackground;
  Color? secondaryBackground;
  Color? primaryText;
  Color? secondaryText;

  Color? primaryBtnText;
  Color? lineColor;

  TextStyle get title1 => TextStyle(
        fontFamily: monieFontFamily,
        color: primaryText,
        fontWeight: FontWeight.w800,
        fontSize: 24.sp,
      );
  TextStyle get title2 => TextStyle(
        fontFamily: monieFontFamily,
        color: primaryText,
        fontWeight: FontWeight.w800,
        fontSize: 18.sp,
      );

  TextStyle get bodyText1 => TextStyle(
        fontFamily: monieFontFamily,
        color: primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.sp,
      );
  TextStyle get bodyText2 => TextStyle(
        fontFamily: monieFontFamily,
        color: secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      );
  TextStyle get bodyText3 => TextStyle(
        fontFamily: monieFontFamily,
        color: secondaryText,
        fontWeight: FontWeight.w300,
        fontSize: 12.sp,
      );
}

class LightModeTheme extends MonieTheme {
  @override
  Color? primaryColor = moniePrimaryColor;
  @override
  Color? secondaryColor = monieSecondaryColor;
  @override
  Color? alternate = alternateColor;
  @override
  Color? primaryBackground = lightBackgroundColor;
  @override
  Color? secondaryBackground = lightSecondaryBackgroundColor;
  @override
  Color? primaryText = lightPrimaryText;
  @override
  Color? secondaryText = lightSecondaryText;

  @override
  Color? primaryBtnText = const Color(0xFFFFFFFF);
  @override
  Color? lineColor = monieLineColor;
  Color? white = const Color(0xFFFFFFFF);
}

ThemeData lightTheme(context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: monieSecondaryColor,
      primary: moniePrimaryColor,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  ).copyWith(
    scaffoldBackgroundColor: MonieTheme.of(context).primaryBackground,
    primaryColor: MonieTheme.of(context).primaryColor,
    textTheme: TextTheme(
      bodyLarge: MonieTheme.of(context).bodyText1,
      bodyMedium: MonieTheme.of(context).bodyText2,
      bodySmall: MonieTheme.of(context).bodyText3,
      titleLarge: MonieTheme.of(context).title1,
      titleMedium: MonieTheme.of(context).title2,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      iconTheme: const IconThemeData(
        color: monieSecondaryColor,
      ),
      titleTextStyle: MonieTheme.of(context).bodyText2.copyWith(
            color: MonieTheme.of(context).primaryText,
          ),
      backgroundColor: MonieTheme.of(context).primaryBackground,
    ),
    iconTheme: IconThemeData(
      color: MonieTheme.of(context).secondaryColor,
    ),
    dividerTheme: DividerThemeData(color: Colors.grey[200]),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(6),
      hintStyle: MonieTheme.of(context).bodyText2,
      errorStyle: MonieTheme.of(context).bodyText2.copyWith(color: danger),
      filled: true,
      fillColor: lightFormFillColor,
      // borders
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: lightFormBorderColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: lightFormBorderColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: lightFormBorderColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: danger,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: danger,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      prefixIconColor: Colors.grey,
      // prefixStyle: MonieTheme.of(context).bodyText1.copyWith(
      //       fontSize: 18,
      //       color: MonieTheme.of(context).ghostWhite,
      //     ),
      // suffixIconColor: MonieTheme.of(context).secondaryColor,
    ),
  );
}
