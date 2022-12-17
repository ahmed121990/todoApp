import 'package:flutter/material.dart';

class Mytheme {
  static const Color lightPrimary = Color(0XFF5D9CEC);
  static const Color gray = Color(0XFFC8C9CB);

  static const Color lightScafoldBackground = Color(0XFFDFECDB);
  static final lightTheme = ThemeData(
      primaryColor: lightPrimary,
      appBarTheme:const  AppBarTheme(color: lightPrimary),
      scaffoldBackgroundColor: lightScafoldBackground,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedIconTheme: IconThemeData(
            color: lightPrimary,
            size: 36,
          ),
          unselectedIconTheme: IconThemeData(color: gray, size: 36)),
         bottomSheetTheme: const BottomSheetThemeData (
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.only(
               topLeft: Radius.circular(18),
               topRight: Radius.circular(18)
             )
           )
         ),
     textTheme: const TextTheme(
       headline5:TextStyle(
         fontSize: 20,
         fontWeight: FontWeight.bold,
           color: Colors.black
       ) ,
       headline6: TextStyle(
         fontSize: 18,
           fontWeight: FontWeight.bold,
         color: Colors.black
       ),
     )
  );
}
