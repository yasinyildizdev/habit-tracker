import 'package:flutter/material.dart';

/* class MyColors {
   static const white = Color(0xffffffff);
   static const black = Color(0xff000000);
   static const blue = Color(0xff2196f3);
   static const red = Color(0xffff0000);
   static const level0Green = Color(0xff16EB38);
   static const level1Green = Color(0xFF5DF475);
   static const level2Green = Color(0xff89FA9B);
   static const level3Green = Color(0xffCBFED3);
   static const level4Green = Color(0xffE9FFED);
  static const shadeBlue = Color(0xff1E2328);
  static const shadeGrey = Color(0xff4D4D4D);
  static const darkBlack = Color(0xff212121);      //dark background
  static const darkLevel0Grey = Color(0xff828282); //dark text2
  static const darkLevel1Grey = Color(0xff9c9c9c); //dark text1 primary
}
 */



class MyColors {
  static const white = Color(0xffffffff);
  static const black = Color(0xff000000);
  static const blue = Color(0xff0B6DFF);
  static const red = Color(0xffff0000);
  static const shadeBlue = Color(0xff1E2328);
  static const shadeGrey = Color(0xff4D4D4D);
  static const darkBlack = Color(0xff212121);      //dark background
  //static const darkLevel0Grey = Color(0xff828282); //dark text2
  //static const darkLevel1Grey = Color(0xff9c9c9c); //dark text1 primary

  //custom green color
  static const MaterialColor5 green = MaterialColor5(
    0xff16EB38,
    <int, Color>{
      100: Color(0xffE9FFED),
      200: Color(0xffCBFED3),
      300: Color(0xff89FA9B),
      400: Color(0xFF5DF475),
      500: Color(0xff16EB38),//primary
    },
  );

 //custom grey color
 static const MaterialColor5 grey = MaterialColor5(
    0xff9c9c9c,
    <int, Color>{
      100: Color(0xffd8d8d8),
      200: Color(0xffbcbcbc),
      300: Color(0xff9c9c9c),//primary 
      400: Color(0xFF828282),
      500: Color(0xff121212),
    },
  );
}






class LightColors{
 static const white = Color(0xffffffff);   //arkaplan   :ffffff :l-bcg
 static const black = Color(0xff000000);   //Siyah metinler: 000000 :l-txt

 static const blue = Color(0xff0B6DFF);    //mavi renk        : 0B6DFF :l-blue
 static const red = Color(0xffff0000);    //kırmızı renk     : ff0000 :l-red
 static const shadeBlue = Color(0xffF2F9FF); //google-face arkaplan : F2F9FF : l-surface-blue 

 static const MaterialColor5 green = MaterialColor5(
    0xff16EB38,
    <int, Color>{
      100: Color(0xffE9FFED),
      200: Color(0xffCBFED3),
      300: Color(0xff89FA9B),
      400: Color(0xFF5DF475),
      500: Color(0xff16EB38), //primary yeşil   : 16EB38 :l-green
    },
  );


  static const MaterialColor4 grey = MaterialColor4(
    0xffbcbcbc,
    <int, Color>{
      100: Color(0xffe9e9e9),   //habits item arkası /about title arkası :e9e9e9 :l-surface
      200: Color(0xffe4e4e4),   //lowbutton color :e4e4e4: l-low-button
      300: Color(0xFFd9d9d9),  //iconların bcg   :d9d9d9 : l-icon-bcg
      400: Color(0xffbcbcbc), //gri metinler/icon/divider/stoke/hint     : bcbcbc :l-use-grey
    },
  );

}





class DarkColors{

static const black = Color(0xff212121);   //arkaplan         : 212121 :d-bcg
 static const white = Color(0xff9c9c9c);  //Siyah metinler: 9c9c9c :d-txt

 static const blue = Color(0xff022f63);    //mavi renk        :022f63 :d-blue
 static const red = Color(0xffaa0000);    //kırmızı renk     :aa0000 :d-red
 static const shadeBlue = Color(0xff011B2F); //google-face arkaplan : 011B2F : d-surface-blue */

 static const MaterialColor5 green = MaterialColor5(
    0xff16EB38,
    <int, Color>{
      100: Color(0xffE9FFED),
      200: Color(0xffCBFED3),
      300: Color(0xff89FA9B),
      400: Color(0xFF5DF475),
      500: Color(0xff00B81D), //primary yeşil   :00B81D :d-green
    },
  );


  static const MaterialColor4 grey = MaterialColor4(
    0xff828282,
    <int, Color>{
      100: Color(0xff828282),      //gri metinler/icon/divider/stoke/hint     : 828282 :d-use-grey
      200: Color(0xff464646),     //lowbutton color :464646 :d-low-button
      300: Color(0xFF252525),     //habits item arkası /about title arkası :252525 :d-surface
      400: Color(0xff1e1e1e),     //iconların bcg       :1e1e1e : d-icon-bcg
    },
  );
}



class MaterialColor5 extends ColorSwatch<int> {
  const MaterialColor5(super.primary, super.swatch);
  Color get shade100 => this[100]!;
  Color get shade200 => this[200]!;
  Color get shade300 => this[300]!;
  Color get shade400 => this[400]!;
  Color get shade500 => this[500]!;
}

class MaterialColor4 extends ColorSwatch<int> {
  const MaterialColor4(super.primary, super.swatch);
  Color get shade100 => this[100]!;
  Color get shade200 => this[200]!;
  Color get shade300 => this[300]!;
  Color get shade400 => this[400]!;
}




