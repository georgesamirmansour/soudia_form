import 'package:first_form/utilities/CustomText.dart';
import 'package:first_form/utilities/CustomTextStyle.dart';
import 'package:first_form/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_loader/image_helper.dart';
import '../generated/l10n.dart';
import '../utilities/image_paths.dart';


class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 15.w, vertical: 3.h),
      child: _logoRow(),
    );
  }

  Widget _logoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // _getWhatsAppImage(),
        _getLogo()
      ],
    );
  }

  Widget _getWhatsAppImage(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImageHelper(image: whatsApp, imageType: ImageType.asset,
        width: 20.w,height: 20.h, boxFit: BoxFit.contain,),
        SizedBox(width: 10.w,),
        CustomText(text: S.current.callUs, customTextStyle: MediumStyle(
          color: blackColor,
          fontSize: 16.sp,
        ))
      ],
    );
  }
  
  Widget _getLogo(){
    return ImageHelper(image: logoImage, imageType: ImageType.asset,
    height: 90.h,
    width: 110.w,
    boxFit: BoxFit.contain,);
  }
}
