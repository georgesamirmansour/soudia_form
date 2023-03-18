import 'package:BROADCAST/RadioMapper.dart';
import 'package:BROADCAST/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/CustomText.dart';
import '../utilities/CustomTextStyle.dart';

class CustomRadioButtonWidget extends StatefulWidget {
  final String labelText;
  final RadioMapper mapper;
  final RadioMapper selectedItem;
  final Function(RadioMapper selectedItem) onChanged;

  const CustomRadioButtonWidget(
      {Key? key,
      required this.labelText,
      required this.onChanged,
      required this.mapper,
      required this.selectedItem})
      : super(key: key);

  @override
  State<CustomRadioButtonWidget> createState() =>
      _CustomRadioButtonWidgetState();
}

class _CustomRadioButtonWidgetState extends State<CustomRadioButtonWidget> {
  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () {
      widget.mapper.checked = !widget.mapper.checked;
      widget.onChanged(widget.mapper);
    },
    child: Row(
        children: [
          Radio<RadioMapper>(
            value: widget.selectedItem,
            groupValue: widget.mapper,
            onChanged: (value) {
              widget.mapper.checked = !widget.mapper.checked;
              widget.onChanged(widget.mapper);
            },
            activeColor: accentColor,
          ),
          CustomText(
              text: widget.labelText,
              softWrap: true,
              customTextStyle: MediumStyle(fontSize: 14.sp, color: answerColor)),
        ],
      ),
  );
}
