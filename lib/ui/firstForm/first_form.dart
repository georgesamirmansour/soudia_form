import 'package:first_form/ui/firstForm/project_language_widget.dart';
import 'package:first_form/utilities/CustomText.dart';
import 'package:first_form/utilities/CustomTextStyle.dart';
import 'package:first_form/utilities/app_colors.dart';
import 'package:first_form/widgets/custom_text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/l10n.dart';

class FirstFormWidget extends StatefulWidget {
  const FirstFormWidget({Key? key}) : super(key: key);

  @override
  State<FirstFormWidget> createState() => _FirstFormWidgetState();
}

class _FirstFormWidgetState extends State<FirstFormWidget> {
  @override
  Widget build(BuildContext context) {
    return _getChildWidget();
  }

  bool _isMobile() => MediaQuery.of(context).size.width < 950;

  Widget _getChildWidget() => Container(
        width: _isMobile()
            ? MediaQuery.of(context).size.width * 0.8
            : MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 10,
                  offset: const Offset(5, 5))
            ]),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getNameTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getMobileTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getProjectTypeTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getLanguageText(),
              ProjectLanguageWidget(onSelectLanguage: (radioMapper) {}),
            ],
          ),
        ),
      );

  Widget _getNameTextFormFiled() => CustomTextFormFiled(
        labelText: S.of(context).name,
      );

  Widget _getMobileTextFormFiled() =>
      CustomTextFormFiled(labelText: S.of(context).mobile);

  Widget _getProjectTypeTextFormFiled() =>
      CustomTextFormFiled(labelText: S.of(context).projectType);

  Widget _getLanguageText() => CustomText(
      text: S.of(context).projectLanguageType,
      customTextStyle: MediumStyle(color: questColor, fontSize: 14.sp));
}
