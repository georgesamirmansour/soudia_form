import 'package:BROADCAST/RadioMapper.dart';
import 'package:BROADCAST/utilities/CustomText.dart';
import 'package:BROADCAST/utilities/CustomTextStyle.dart';
import 'package:BROADCAST/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckBoxWidget extends StatefulWidget {
  final String labelText;
  final bool checked;
  final RadioMapper mapper;
  final Function(RadioMapper mapper) onChange;

  const CustomCheckBoxWidget(
      {Key? key,
      required this.labelText,
      required this.onChange,
      required this.mapper,
      this.checked = false})
      : super(key: key);

  @override
  State<CustomCheckBoxWidget> createState() => _CustomCheckBoxWidgetState();
}

class _CustomCheckBoxWidgetState extends State<CustomCheckBoxWidget> {
  @override
  Widget build(BuildContext context) => Row(
      children: [
        Checkbox(
          value: widget.checked,
          onChanged: (value) {
            widget.mapper.checked = !widget.mapper.checked;
            widget.onChange(widget.mapper);
          },
          activeColor: accentColor,
          checkColor: whiteColor,
        ),
        InkWell(
          onTap: (){
            widget.mapper.checked = !widget.mapper.checked;
            widget.onChange(widget.mapper);
          },
          child: CustomText(
              text: widget.labelText,
              softWrap: true,
              customTextStyle: MediumStyle(fontSize: 14.sp, color: answerColor)),
        ),
      ],
    );
}
