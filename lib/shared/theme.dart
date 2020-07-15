part of 'shared.dart';

const double defaultMargin = 24;

Color mainColor = const Color(0xFFFFD527);
Color accentColor = const Color(0xffffba04);
Color blackColor = const Color(0xff252b40);
Color whiteColor = const Color(0xfff4f5f9);

TextStyle logoText = GoogleFonts.raleway()
    .copyWith(color: blackColor, fontWeight: FontWeight.bold);

TextStyle blackTextFont = GoogleFonts.raleway()
    .copyWith(color: blackColor, fontWeight: FontWeight.w500);
TextStyle yellowTextFont = GoogleFonts.raleway()
    .copyWith(color: accentColor, fontWeight: FontWeight.w500);
TextStyle whiteTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);

TextStyle yellowNumberFont = GoogleFonts.openSans().copyWith(color: mainColor);
TextStyle blackNumberFont = GoogleFonts.raleway()
    .copyWith(color: blackColor, fontWeight: FontWeight.w500);
