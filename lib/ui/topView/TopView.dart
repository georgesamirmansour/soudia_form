import 'package:first_form/ui/contactUs/contact_us.dart';
import 'package:first_form/utilities/CustomText.dart';
import 'package:first_form/utilities/CustomTextStyle.dart';
import 'package:first_form/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/l10n.dart';
import '../../utilities/image_paths.dart';

class TopWidget extends StatefulWidget {
  final Widget formWidget;

  const TopWidget(this.formWidget, {Key? key}) : super(key: key);

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  @override
  Widget build(BuildContext context) {
    return _isMobile()
        ? _getDefaultMobileWidget()
        : _getDefaultWebWidget();
  }

  bool _isMobile() => MediaQuery.of(context).size.width < 1200;

  Widget _getLinearContainer(Widget? child) => Container(
        width: MediaQuery.of(context).size.width,
        height: _isMobile() ? 200.h : 575.h,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 6, 64, 135),
                Color.fromARGB(255, 6, 64, 135),
                Color.fromARGB(255, 6, 64, 219),
                Color.fromARGB(255, 6, 64, 135),
                Color.fromARGB(255, 6, 64, 135),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            image: DecorationImage(
                image: AssetImage(fromBackIcon), opacity: 0.05)),
        child: Center(
          child: child,
        ),
      );

  Widget _getDefaultMobileWidget() => Column(
        children: [
          _getLinearContainer(_getTrustText()),
          SizedBox(
            height: 8.h,
          ),
          widget.formWidget,
          SizedBox(
            height: 8.h,
          ),
          const ContactUsWidget(),
        ],
      );

  Widget _getDefaultWebWidget() => SizedBox(
    height: 2000.h,
    child: Stack(
      children: [
        Positioned(top: 0, right: 0, left: 0,child: _getLinearContainer(null),),
        Positioned(
          top: 89,
          right: 70.w,
          child: _getTrustText(),
        ),
        Positioned(
          top: 55.h,
          left: MediaQuery.of(context).size.width * 0.05,
          child: widget.formWidget,
        ),
        Positioned(
          top: 600.h,
          right: 90,
          child: const ContactUsWidget(),
        )
      ],
    ),
  );

  Widget _getTrustText() => CustomText(
      text: S.of(context).thanksForTrustInUs,
      customTextStyle:
          BoldStyle(color: whiteColor, fontSize: _isMobile() ? 25.sp : 32.sp));
}
