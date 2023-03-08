import 'package:first_form/ui/firstForm/first_form.dart';
import 'package:first_form/utilities/CustomText.dart';
import 'package:first_form/utilities/CustomTextStyle.dart';
import 'package:first_form/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_loader/image_helper.dart';

import '../../utilities/image_paths.dart';

class TopWidget extends StatefulWidget {

  const TopWidget({Key? key}) : super(key: key);

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  @override
  Widget build(BuildContext context) {
    return _isMobile() ? _getDefaultMobileWidget() : _getDefaultWebWidget();
  }

  bool _isMobile() =>
      MediaQuery.of(context).size.width < 750;


  Widget _getDefaultWebWidget(){
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(top: 0, left: 0, right: 0, height: 575, child: _getLinearContainer(),),
        Positioned(top: 89, right: 90,child: _getTrustText(),),
        const Positioned(top: 55, left: 135, child: FirstFormWidget())
      ],
    );
  }

  Widget _getDefaultMobileWidget(){
    return Column(
      children: [
        _getLinearContainer(),
        _getTrustText(),
        // const Positioned(top: 150, right: 20, left: 20,child: FirstFormWidget(),),
      ],
    );
  }
  


  Widget _getLinearContainer()=> Container(
      width: MediaQuery.of(context).size.width,
      height: _isMobile() ? 200 : 575,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255,6, 64, 135),
          Color.fromARGB(255,6, 64, 135),
          Color.fromARGB(255,6, 64, 219),
          Color.fromARGB(255,6, 64, 135),
          Color.fromARGB(255,6, 64, 135),
        ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: ImageHelper(
          image: fromBackIcon,
          imageType: ImageType.asset,
          boxFit: BoxFit.contain,
        ),
      ),
    );


  Widget _getTrustText()=> CustomText(text: "نشكركم على ثقتكم العالية\nونتشرف بتقديم كل ما هو\nمناسب ومميز وعبقري في\nصناعة الهوية المرئية.", customTextStyle: BoldStyle(
      color: _isMobile() ? blackColor : whiteColor, fontSize: _isMobile()? 25: 42
  ));
}
