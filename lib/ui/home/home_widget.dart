import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/logo_widget.dart';
import '../secondForm/second_form.dart';
import '../topView/TopView.dart';

class HomeWidget extends StatefulWidget {

  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final ScrollController _scrollBehavior = ScrollController();
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: ListView(
        children: [
          _getLogoWidget(),
          SizedBox(
            height: 30.h,
          ),
          _getTopWidget()
        ],
        shrinkWrap: false,
      ),
    ),
  );

  Widget _getLogoWidget() => const LogoWidget();

  Widget _getTopWidget()=>   TopWidget(SecondFormWidget());
}
