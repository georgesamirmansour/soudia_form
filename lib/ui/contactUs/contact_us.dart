import 'package:first_form/utilities/CustomText.dart';
import 'package:first_form/utilities/CustomTextStyle.dart';
import 'package:first_form/utilities/app_colors.dart';
import 'package:first_form/utilities/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:image_loader/image_helper.dart';

class ContactUsWidget extends StatelessWidget {
  ContactUsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getUiColumn();
  }

  Widget _getUiColumn() {
    return Column(
      children: [
        _getContactUsText(),
        const SizedBox(height: 20,),
        _getDescText(),
        const SizedBox(height: 25,),
        _getCard(_getAddressColumn()),
        const SizedBox(height: 30,),
        _getCard(_getEmailColumn()),
        const SizedBox(height: 30,),
        _getCard(_getCallUsColumn()),
        const SizedBox(height: 30,),
      ],
    );
  }

  Widget _getContactUsText(){
    return CustomText(text: "التواصل", customTextStyle: MediumStyle(fontSize: 34, color: blackColor));
}

  Widget _getDescText() {
    return CustomText(text: "نحن معاً نستحق.. فـــلنتشارك", customTextStyle: MediumStyle(fontSize: 20, color: blackColor));
  }

  Widget _getCard(Widget child) {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 24, left: 33, right: 43),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(2.0,2.0),
            blurRadius: 4.0
          )
        ]
      ),
      child: child,
    );
  }

  Widget _getAddressColumn(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(text: "العنوان", customTextStyle: MediumStyle(fontSize: 20, color: descColor)),
            ImageHelper(image: addressIcon, imageType: ImageType.svg, height: 50, width: 50, boxFit: BoxFit.fill,)
          ],
        ),
        const SizedBox(height: 26,),
        CustomText(text: "شارع اسحق التقادي - الشاطئ ، جدة 23613 المملكة العربية السعودية..........", customTextStyle: MediumStyle(fontSize: 14, color: blackColor))
      ],
    );
  }

  Widget _getEmailColumn(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(text: "البريد الإلكتروني", customTextStyle: MediumStyle(fontSize: 20, color: descColor)),
            ImageHelper(image: emailIcon, imageType: ImageType.svg, height: 50, width: 50, boxFit: BoxFit.fill,)
          ],
        ),
        const SizedBox(height: 26,),
        CustomText(text: "info@broadcastmp.com", customTextStyle: MediumStyle(fontSize: 14, color: blackColor))
      ],
    );
  }

  Widget _getCallUsColumn(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(text: "إتصل بنا", customTextStyle: MediumStyle(fontSize: 20, color: descColor)),
            ImageHelper(image: callUsIcon, imageType: ImageType.svg, height: 50, width: 50, boxFit: BoxFit.fill,)
          ],
        ),
        const SizedBox(height: 26,),
        CustomText(text: "+966531556519", customTextStyle: MediumStyle(fontSize: 14, color: blackColor))
      ],
    );
  }
}
