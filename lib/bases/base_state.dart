
import 'package:flutter/material.dart';

export 'package:flutter/material.dart';

typedef RefreshCallback = Future<void> Function();

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({Key? key}) : super(key: key);
}

abstract class BaseState<T extends BaseStatefulWidget> extends State<T>
    with RouteAware {
  bool useCustomScaffold = false;
  Color? customBackgroundColor;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // late ProgressDialog _progressDialog;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _initProgressDialog();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body:_defaultBody,
      // )
    );
  }

  Widget get _defaultBody => GestureDetector(
    child: getBody(context),
    onTap: () => hideKeyboard(context),
  );

  Widget getBody(BuildContext context);

  void hideKeyboard(BuildContext context) {
    // if (Platform.isIOS || Platform.isAndroid)
    //   FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Future<dynamic> pushScreen(dynamic widget, {bool hasBackStack = false}) {
  //   FocusScope.of(context).requestFocus(FocusNode());
  //   return ViewHelper(context).pushScreen(widget, hasBackStack: hasBackStack);
  // }

  void popBack({dynamic result}) {
    hideKeyboard(context);
    Navigator.pop(context, result);
  }

// showSnakeBar(String text,
//     {SnackBarAction? action,
//       Color snakeColorBackGround = primaryColor,
//       Color textColor = Colors.white,
//       double elevation = 0.0,
//       int durationInSecond = 2}) {
//   ViewHelper(context).showSnakeBar(text,
//       elevation: elevation,
//       action: action,
//       durationInMilliSeconds: durationInSecond,
//       snakeColorBackGround: snakeColorBackGround,
//       textColor: textColor);
// }
//
// void showCustomBottomSheet(Widget child,
//     {Function(dynamic result)? onUpdate}) {
//   // ViewHelper(context).showCustomBottomSheet(child, onUpdate: onUpdate);
// }
//
// Widget getDataContainer(
//     {required Widget child, Color containerColor = whiteColor}) =>
//     Container(
//       // margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
//       width: MediaQuery
//           .of(context)
//           .size
//           .width,
//       decoration: BoxDecoration(
//         color: containerColor,
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30), topRight: Radius.circular(30)),
//       ),
//       child: child,
//     );

// Widget getDataCard(
//     {required Widget child, Color containerColor = whiteColor}) =>
//     Card(
//       color: whiteColor,
//       elevation: 4,
//       shadowColor: lightGreyColor10Percent,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: child,
//     );

// Widget get coPolitanImageBlack =>
//     Center(
//       child: ImageHelper(
//         image: coPolitanBlockLogo,
//         imageType: ImageType.svg,
//         boxFit: BoxFit.fill,
//       ),
//     );
//
// Widget getAnimatedSwitcher(Widget child, bool showed) =>
//     AnimatedSwitcher(
//       child: showed ? child : Container(),
//       duration: Duration(milliseconds: 200),
//       transitionBuilder: (child, animation) {
//         var begin = Offset(0.0, 1.0);
//         var end = Offset.zero;
//         var tween = Tween(begin: begin, end: end);
//         var offsetAnimation = animation.drive(tween);
//         return SlideTransition(
//           position: offsetAnimation,
//           child: child,
//         );
//       },
//     );
}
// void _initProgressDialog() {
//   _progressDialog = ProgressDialog(context,
//       showLogs: true, isDismissible: true, type: ProgressDialogType.normal);
//   _initProgressDialogStyle();
// }
//
// void _initProgressDialogStyle() {
//   _progressDialog.style(
//       progressWidget: CustomProgress(
//         size: 50.r,
//       ),
//       elevation: 3.r,
//       borderRadius: 5.r,
//       insetAnimCurve: Curves.fastLinearToSlowEaseIn,
//       backgroundColor: whiteColor,
//       message: S.of(context).pleaseWait,
//       padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
//       messageTextStyle:
//           SemiBoldStyle(color: blackColor70Percent, fontSize: 18.sp)
//               .getStyle(),
//       progressTextStyle:
//           SemiBoldStyle(color: blackColor70Percent, fontSize: 18.sp)
//               .getStyle(),
//       progressWidgetAlignment: Alignment.center,
//       widgetAboveTheDialog: CustomText(
//         text: S.of(context).loading,
//         customTextStyle: SemiBoldStyle(color: accentColor, fontSize: 18.sp),
//       ),
//       textAlign: TextAlign.center);
// }
//
// void showProgressDialog() {
//   if (!_progressDialog.isShowing()) _progressDialog.show();
// }
//
// void hideProgress() {
//   if (_progressDialog.isShowing()) _progressDialog.hide();
// }
//
// Widget getRefreshedWidget(
//         {required Widget child, required RefreshCallback onRefresh}) =>
//     LiquidPullToRefresh(
//         onRefresh: onRefresh,
//         color: accentColor,
//         backgroundColor: primaryColor,
//         showChildOpacityTransition: true,
//         height: 100.h,
//         springAnimationDurationInMilliseconds: 450,
//         child: child);
// }
