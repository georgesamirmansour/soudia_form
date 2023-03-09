import 'package:first_form/utilities/CustomText.dart';
import 'package:first_form/utilities/CustomTextStyle.dart';
import 'package:first_form/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckBoxWidget extends StatefulWidget {

  final String labelText;
  final bool checked;
  final ValueChanged<bool?>? onChanged;

  const CustomCheckBoxWidget(
      {Key? key, required this.labelText, required this.onChanged, this.checked = false })
      : super(key: key);

  @override
  State<CustomCheckBoxWidget> createState() => _CustomCheckBoxWidgetState();
}

class _CustomCheckBoxWidgetState extends State<CustomCheckBoxWidget> {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: widget.checked, onChanged: widget.onChanged, activeColor: accentColor, checkColor: whiteColor,
        ),
        SizedBox(width: 5.w,),
        CustomText(text: widget.labelText, customTextStyle: MediumStyle(fontSize: 12.sp, color: answerColor)),
      ],
    );
  }
}
