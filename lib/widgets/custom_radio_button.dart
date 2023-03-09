import 'package:first_form/RadioMapper.dart';
import 'package:first_form/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/CustomText.dart';
import '../utilities/CustomTextStyle.dart';

class CustomRadioButtonWidget extends StatefulWidget {
  final String labelText;
  final RadioMapper mapper;
  final ValueChanged<RadioMapper?>? onChanged;

  const CustomRadioButtonWidget(
      {Key? key,
      required this.labelText,
      required this.onChanged,
      required this.mapper})
      : super(key: key);

  @override
  State<CustomRadioButtonWidget> createState() =>
      _CustomRadioButtonWidgetState();
}

class _CustomRadioButtonWidgetState extends State<CustomRadioButtonWidget> {
  @override
  Widget build(BuildContext context) {
    // return Row(
    //   children: [
    //     Radio<RadioMapper>(
    //       value: widget.mapper,
    //       groupValue: widget.mapper,
    //       onChanged: widget.onChanged,
    //       activeColor: accentColor,
    //     ),
    //     SizedBox(
    //       width: 5.0.w,
    //     ),
    //     CustomText(
    //         text: widget.labelText,
    //         customTextStyle: MediumStyle(fontSize: 12.sp, color: answerColor)),
    //   ],
    // );
    return Container(color: Colors.black,);
  }
}
