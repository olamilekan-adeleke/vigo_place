import '../constants/color.dart';
import '../constants/font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    Key? key,
    this.fontSize = kfsMedium,
    this.textColor = kcTextColor,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.justify,
    this.maxLines,
    this.overflow,
    this.decoration,
  }) : super(key: key);

  final String text;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.dmSans(
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
      textAlign: textAlign,
      overflow: overflow,
      softWrap: true,
      maxLines: maxLines,
      textScaleFactor: 0.8,
    );
  }
}

class TwoSpanTextWidget extends StatelessWidget {
  const TwoSpanTextWidget(
    this.text,
    this.text2, {
    Key? key,
    this.fontSize = kfsMedium,
    this.textColor = kcTextColor,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.justify,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.firstFontWeight,
    this.useColor = false,
  }) : super(key: key);

  final String text;
  final String text2;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? firstFontWeight;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final bool useColor;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          color: textColor,
          fontWeight: firstFontWeight ?? fontWeight,
          decoration: decoration,
        ),
        children: <InlineSpan>[
          TextSpan(
            text: text2,
            style: GoogleFonts.poppins(
              fontSize: fontSize,
              color: useColor ? textColor : kcPrimaryColor,
              fontWeight: fontWeight,
              decoration: decoration,
            ),
          )
        ],
      ),
    );
  }
}
