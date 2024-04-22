import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class AppTheme {
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color raisinColor = const Color(0xFF272727);
  static Color greyColor = const Color(0xFFEEEEEE);
  static Color blackColor = const Color(0xFF000000);
  static String fontName = 'Barlow Semi Condensed';
  static Color greyShadeColor = const Color(0xFF363636);
  static Color greyishBlue = const Color(0xFF84B2B0);
  static const Color kCustomBorderColor = Color(0xffD1D5DB);

  static const Color kCustomTextFiledHintTextColor = Color(0xff111827);

  static const Color kCustomWalletContainerColor = Color(0xffDEEDE5);

  static const Color kCustomstackedgraphColor = Color(0xff8A80F3);

  static const Color kCustompropertyTextColor = Color(0xffA7AEBF);

  static const Color kCustomAxisTextColor = Color(0xffBFC9D1);
  static const Color kCustomstackedOrangegraphColor = Color(0xffEE7071);
  static const Color kCustomLineargraphColor = Color(0xff41E590);
  static const Color kCustomyellowgraphColor = Color(0xffFF9F43);

  static const Color kCustomgraphLinesColor = Color(0xffEDEDED);
  static const Color kCustomDashgraphColor = Color(0xffBBC6CF);
  static const Color kCustomLinearprogressColor = Color(0xff7467F0);
  static const Color kCustomprogressColor = Color(0xff707070);
  static const Color kCustomRedgraphColor = Color(0xffE65051);
  static const Color kCustomgraphColor = Color(0xffB7B1F7);
  static const Color kCustomWalletTextColor = Color(0xff111827);
  static const Color kCustomButtonColor = Color(0xffEFD488);
  static const Color kCustomButtonColorgreen = Color(0xff445D59);
  static const Color kCustomTextOrColor = Color(0xff6B7280);

  static const Color kCustomProfileTextColor = Color(0xff8B8B8B);

  static const Color kCustomGreyContainerColor = Color(0xffD9D9D9);
  static const Color kCustomnavGrayColor = Color(0xff7D7F88);
  static const Color kCustomSearchBackgroudColor = Color(0xffE3E3E7);

  static const Color kCustomAllTextColor = Color(0xff999B98);

  static const Color kCustomgreyBackgroundColor = Color(0xff4C4C4C);
  static const Color kCustomCryptoTextColor = Color(0xff1A1E25);
  static const Color kCustomDividerColor = Color(0xffEEF2F6);
  static Color primaryColor = const Color(0xFF194F5E);
  static Color grey = const Color(0xAAAAAAAA);
  static Color redColor = const Color(0xFFB82424);
  static Color transparentColor = const Color(0x00FFFFFF);
  static Color greenColor = const Color(0xFF169B00);
  static Color yellowColor = const Color(0xFFFDD128);
  static ThemeData getCurrentTheme(bool isDark) {
    Color inverseBlackOrWhite = isDark ? whiteColor : blackColor;
    return ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,
      brightness: isDark ? Brightness.dark : Brightness.light,
      fontFamily: fontName,
      primarySwatch: generateMaterialColor(primaryColor),
      scaffoldBackgroundColor: isDark ? blackColor : greyColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: isDark ? raisinColor : primaryColor,
        titleTextStyle: TextStyle(
            color: whiteColor,
            fontFamily: fontName,
            fontSize: 20,
            fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: whiteColor),
        actionsIconTheme: IconThemeData(color: whiteColor),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: isDark ? raisinColor : whiteColor,
        indicatorColor: primaryColor,
        elevation: 0,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: isDark ? raisinColor : whiteColor,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: isDark ? raisinColor : whiteColor,
        elevation: 0,
      ),
      cardTheme: CardTheme(
        color: isDark ? raisinColor : whiteColor,
        elevation: 0,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: fontName,
          color: blackColor,
        ),
        displayMedium: TextStyle(
          fontFamily: fontName,
          color: blackColor,
        ),
        displaySmall: TextStyle(
          fontFamily: fontName,
          color: blackColor,
        ),
        headlineLarge: TextStyle(
          fontFamily: fontName,
          color: blackColor,
        ),
        headlineMedium: TextStyle(
          fontFamily: fontName,
          color: blackColor,
        ),
        headlineSmall: TextStyle(
          fontFamily: fontName,
          color: blackColor,
        ),
        labelLarge: TextStyle(
          fontFamily: fontName,
          color: blackColor,
        ),
        labelMedium: TextStyle(
          fontFamily: fontName,
          color: blackColor,
        ),
        labelSmall: TextStyle(
          fontFamily: fontName,
          color: blackColor,
        ),
        titleLarge: TextStyle(
          fontFamily: fontName,
          color: blackColor,
        ),
        titleMedium: TextStyle(
          fontFamily: fontName,
          color: blackColor,
        ),
        titleSmall: TextStyle(
          fontFamily: fontName,
          color: blackColor,
        ),
        bodySmall: TextStyle(
          color: blackColor,
        ),
        bodyMedium: TextStyle(
          color: blackColor,
        ),
        bodyLarge: TextStyle(
          color: blackColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: inverseBlackOrWhite,
        suffixIconColor: inverseBlackOrWhite,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        labelStyle: TextStyle(
            color: isDark ? greyColor : raisinColor,
            fontWeight: FontWeight.bold,
            fontSize: 14),
      ),
      chipTheme: ChipThemeData(
        brightness: isDark ? Brightness.dark : Brightness.light,
        selectedColor: primaryColor,
        iconTheme: IconThemeData(
          color: inverseBlackOrWhite,
        ),
        checkmarkColor: whiteColor,
        labelStyle: TextStyle(
          color: inverseBlackOrWhite,
        ),
        secondaryLabelStyle: TextStyle(
          color: whiteColor,
        ),
        backgroundColor: isDark ? blackColor : greyColor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
      ),
      iconTheme: IconThemeData(
        color: inverseBlackOrWhite,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: whiteColor,
          foregroundColor: Colors.white,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
          surfaceTintColor: whiteColor, backgroundColor: whiteColor),
      listTileTheme: ListTileThemeData(
        titleTextStyle:
            TextStyle(color: AppTheme.blackColor, fontFamily: fontName),
        iconColor: inverseBlackOrWhite,
        visualDensity: VisualDensity.compact,
      ),
      expansionTileTheme: ExpansionTileThemeData(
        tilePadding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        shape: Border.all(
          width: 0,
          color: whiteColor,
        ),
        collapsedShape: Border.all(
          width: 0,
          color: whiteColor,
        ),
        iconColor: inverseBlackOrWhite,
      ),
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (!states.contains(MaterialState.selected)) {
              return isDark ? whiteColor : grey;
            }
            return primaryColor;
          },
        ),
        thumbColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (!states.contains(MaterialState.selected)) {
              return isDark ? whiteColor : whiteColor;
            }
            return whiteColor;
          },
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: isDark ? raisinColor : whiteColor,
        titleTextStyle: TextStyle(
          color: inverseBlackOrWhite,
          fontFamily: fontName,
        ),
        contentTextStyle: TextStyle(
          color: inverseBlackOrWhite,
          fontFamily: fontName,
          decorationColor: Colors.white,
        ),
        surfaceTintColor: isDark ? whiteColor : raisinColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(
            color: primaryColor,
            fontFamily: fontName,
          ),
        ),
      ),
    );
  }

  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  static int tintValue(int value, double factor) =>
      math.max(0, math.min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  static int shadeValue(int value, double factor) =>
      math.max(0, math.min(value - (value * factor).round(), 255));

  static Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);
}
