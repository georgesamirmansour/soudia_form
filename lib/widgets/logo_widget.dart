import 'package:first_form/utilities/CustomText.dart';
import 'package:first_form/utilities/CustomTextStyle.dart';
import 'package:first_form/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_loader/image_helper.dart';
import '../utilities/image_paths.dart';


class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1),
      child: _logoRow(),
    );
  }

  Widget _logoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _getWhatsAppImage(),
        _getLogo()
      ],
    );
  }

  Widget _getWhatsAppImage(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImageHelper(image: whatsApp, imageType: ImageType.asset,
        width: 15,height: 15, boxFit: BoxFit.fill,),
        const SizedBox(width: 17.0,),
        CustomText(text: 'اتصل بنا', customTextStyle: MediumStyle(
          color: blackColor,
          fontSize: 16,
        ))
      ],
    );
  }
  
  Widget _getLogo(){
    return ImageHelper(image: logoImage, imageType: ImageType.asset,
    height: 90,
    width: 110,
    boxFit: BoxFit.fill,);
  }
}
