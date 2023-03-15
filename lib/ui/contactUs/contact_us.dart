import 'package:BROADCAST/utilities/CustomText.dart';
import 'package:BROADCAST/utilities/CustomTextStyle.dart';
import 'package:BROADCAST/utilities/app_colors.dart';
import 'package:BROADCAST/utilities/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_loader/image_helper.dart';

import '../../generated/l10n.dart';

class ContactUsWidget extends StatefulWidget {
  const ContactUsWidget({Key? key}) : super(key: key);

  @override
  State<ContactUsWidget> createState() => _ContactUsWidgetState();
}

class _ContactUsWidgetState extends State<ContactUsWidget> {
  @override
  Widget build(BuildContext context) {
    return _getUiColumn();
  }

  bool _isMobile() => MediaQuery.of(context).size.width < 1200;

  Widget _getUiColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getContactUsText(),
        SizedBox(
          height: 15.h,
        ),
        _getDescText(),
        SizedBox(
          height: 20.h,
        ),
        _getCard(_getAddressColumn()),
        SizedBox(
          height: 20.h,
        ),
        _getCard(_getEmailColumn()),
        SizedBox(
          height: 20.h,
        ),
        _getCard(_getCallUsColumn()),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }

  Widget _getContactUsText() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w),
        child: CustomText(
            text: S.of(context).contactUs,
            customTextStyle: MediumStyle(fontSize: 34.sp, color: blackColor)));
  }

  Widget _getDescText() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      child: CustomText(
          text: S.of(context).addressHeaderText,
          customTextStyle: MediumStyle(fontSize: 20.sp, color: blackColor)),
    );
  }

  Widget _getCard(Widget child) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      width: _isMobile() ? MediaQuery.of(context).size.width *0.75 : MediaQuery.of(context).size.width *0.35,
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(2.0, 2.0),
                blurRadius: 4.0)
          ]),
      child: child,
    );
  }

  Widget _getAddressColumn() {
    return Container(
      margin: EdgeInsets.only(top: 30.h, bottom: 20.h, left: 30.w, right: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                  text: S.of(context).address,
                  customTextStyle:
                      MediumStyle(fontSize: 20.sp, color: descColor)),
              ImageHelper(
                image: addressIcon,
                imageType: ImageType.svg,
                height: 50.h,
                width: 50.w,
                boxFit: BoxFit.fill,
              )
            ],
          ),
          SizedBox(
            height: 26.h,
          ),
          CustomText(
              text: S.of(context).addressInfo,
              customTextStyle: MediumStyle(fontSize: 14.sp, color: blackColor))
        ],
      ),
    );
  }

  Widget _getEmailColumn() {
    return Container(
      margin: EdgeInsets.only(top: 30.h, bottom: 20.h, left: 30.w, right: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                  text: S.of(context).email,
                  customTextStyle:
                      MediumStyle(fontSize: 20.sp, color: descColor)),
              ImageHelper(
                image: emailIcon,
                imageType: ImageType.svg,
                height: 50.h,
                width: 50.w,
                boxFit: BoxFit.fill,
              )
            ],
          ),
          SizedBox(
            height: 26.h,
          ),
          CustomText(
              text: "info@broadcastmp.com",
              customTextStyle: MediumStyle(fontSize: 14.sp, color: blackColor))
        ],
      ),
    );
  }

  Widget _getCallUsColumn() {
    return Container(
      margin: EdgeInsets.only(top: 30.h, bottom: 20.h, left: 30.w, right: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                  text: S.of(context).callUs,
                  customTextStyle:
                      MediumStyle(fontSize: 20.sp, color: descColor)),
              ImageHelper(
                image: callUsIcon,
                imageType: ImageType.svg,
                height: 50.h,
                width: 50.w,
                boxFit: BoxFit.fill,
              )
            ],
          ),
          SizedBox(
            height: 26.h,
          ),
          CustomText(
              text: "966531556519+",
              customTextStyle: MediumStyle(fontSize: 14.sp, color: blackColor))
        ],
      ),
    );
  }
}
