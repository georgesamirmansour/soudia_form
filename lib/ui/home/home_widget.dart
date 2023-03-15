import 'package:BROADCAST/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../firstForm/first_form.dart';
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
          child: LayoutBuilder(
            builder: (context, boxConstraints) => ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: boxConstraints.maxHeight,
                    minHeight: boxConstraints.minHeight,
                    maxWidth: boxConstraints.maxWidth,
                    minWidth: boxConstraints.minWidth),
                child: SingleChildScrollView(
                  controller: _scrollBehavior,
                  child: Column(
                    children: [
                      _getLogoWidget(),
                      SizedBox(
                        height: 30.h,
                      ),
                      _getTopWidget()
                    ],
                  ),
                )),
          ),
        ),
      );

  Widget _getLogoWidget() => const LogoWidget();

  Widget _getTopWidget() => TopWidget(FirstFormWidget(
        scrollController: _scrollBehavior,
      ));
}
