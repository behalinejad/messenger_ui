import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppThemes {


  ///  TODO App TextStyle need to be added to the Theme Data



  /// The AppThemes class is implemented to contain the themes related data which used inside the app

  static Color primaryColor = const Color.fromRGBO(226, 243, 245, 1);
  static Color buttonColor = const Color.fromRGBO(34, 209, 238, 1);
  static Color iconsColor = const Color.fromRGBO(0, 122, 255, 1);
  static Color scaffoldBackgroundColor = const Color.fromRGBO(109, 194, 206, 0.25).withOpacity(0.25);




  /// Group Icons Colors
  static Color groupIconBackgroundColor = const Color.fromRGBO(195, 214, 231, 1);
  static Color groupIconColor = const Color.fromRGBO(54, 117, 172, 1);

  /// footer  Color
  static Color footerBackgroundColor =const Color.fromRGBO(53, 83, 115, 1);
  static Color footerTextColor =const Color.fromRGBO(255, 255, 255, 1);

  /// Chat Message color
  static Color chatMessageColor =const Color.fromRGBO(255, 255, 255, 1);
  static Color chatMessageReplyColor =const Color.fromRGBO(34, 56, 75, 0.08);
  static Color chatMessageNotOwnerColor =const Color.fromRGBO(233, 245, 240, 1);



  static final appThemeData = ThemeData(
    primaryColor: Colors.black,
    bottomAppBarColor: Colors.black,
    secondaryHeaderColor: Colors.black54,
    hintColor: Colors.white,

    iconTheme: IconThemeData(
      color: iconsColor,
      size: 10.sp
    ),
    appBarTheme:  const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black54 //here you can give the text color
  ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );




  }





