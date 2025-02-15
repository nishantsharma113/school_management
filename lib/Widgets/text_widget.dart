import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;
  final FontStyle fontStyle;
  final TextStyle? textStyle;

  const TextWidget(
       this.text,
      {
    super.key,

    this.fontSize = 14.0,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.fontStyle = FontStyle.normal,
    this.textStyle,

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ?? GoogleFonts.inter(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle
      ),
      

      textAlign: textAlign,
      maxLines: maxLines ?? 5,
      overflow: overflow,
    );
  }
}
