import 'package:first_form/ui/firstForm/first_form.dart';
import 'package:first_form/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../topView/TopView.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
            children: [
              _getLogoWidget(),
              SizedBox(height: 30.h,),
              _getTopWidget()

            ],
          ),
      ),
    ),
  );


  Widget _getLogoWidget()=> const LogoWidget();

  Widget _getTopWidget()=> const TopWidget(FirstFormWidget());
}
