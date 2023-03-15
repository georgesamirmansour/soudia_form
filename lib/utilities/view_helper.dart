
import 'package:first_form/ui/home/home_widget.dart';
import 'package:first_form/ui/splash_screen.dart';
import 'package:first_form/utilities/CustomText.dart';
import 'package:first_form/utilities/CustomTextStyle.dart';
import 'package:first_form/utilities/app_colors.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ViewHelper {
  final BuildContext context;
  final bool fullScreen;

  ViewHelper(this.context, {this.fullScreen = false});

  void showDialogWithAnimation(Widget widget) {
    showGeneralDialog(
        context: context,
        transitionDuration: Duration(milliseconds: 300),
        barrierDismissible: false,
        barrierLabel: '',
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(opacity: a1.value, child: widget),
          );
        },
        pageBuilder: (context, animation1, animation2) => widget);
  }

  showSnakeBar(String text,
      {SnackBarAction? action,
        Color snakeColorBackGround = blackColor,
        Color textColor = Colors.white,
        double elevation = 0.0,
        int durationInMilliSeconds = 2000}) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Container(
        alignment: Alignment.center,
        height: 20.h,
        child: CustomText(
          text: text,
          customTextStyle: SemiBoldStyle(fontSize: 14.sp, color: Colors.white),
        ),
      ),
      backgroundColor: snakeColorBackGround,
      elevation: elevation,
      behavior: SnackBarBehavior.floating,
      action: action,
      padding:
      EdgeInsets.only(left: 16.0.w, right: 16.0.w, top: 12.h, bottom: 12.h),
      duration: Duration(milliseconds: durationInMilliSeconds),
    ));
  }

  Future<dynamic> pushScreen(dynamic widget, {bool hasBackStack = false}) {
    // TransitionsPage(
    //     child: widget,
    //     context: context,
    //     animation: AnimationType.fadeIn,
    //     duration: Duration(milliseconds: 100),
    //     replacement: hasBackStack);
    if (!hasBackStack)
      return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget,
          ));
    else
      return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => widget,
          ));
  }

  void openHomeWidgetScreen() {
    pushScreen(SplashScreen());
  }

}
