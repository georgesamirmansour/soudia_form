import 'package:flutter/material.dart';

import 'CustomTextStyle.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final bool softWrap;
  final CustomTextStyle customTextStyle;
  final int? maxLines;

  const CustomText(
      {required this.text,
        required this.customTextStyle,
        this.textAlign = TextAlign.start,
        this.softWrap = true,
        this.maxLines});

  @override
  Widget build(BuildContext context) => customText;

  Text get customText => Text(
    text,
    textAlign: textAlign,
    style: customTextStyle.getStyle(),
    softWrap: softWrap,
    maxLines: maxLines,
  );
}