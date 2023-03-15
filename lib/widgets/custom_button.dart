
import 'package:custom_progress_button/custom_progress.dart';
import 'package:first_form/generated/l10n.dart';
import 'package:first_form/utilities/CustomText.dart';
import 'package:first_form/utilities/CustomTextStyle.dart';
import 'package:first_form/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';


class CustomButton extends StatefulWidget {
  final BehaviorSubject<ButtonState>? buttonBehaviour;
  final BehaviorSubject<String>? failedBehaviour;
  final Stream<bool>? validateStream;
  final String idleText;
  final VoidCallback onTap;
  final bool enableClick;
  final bool isAllCaps;
  final bool useGradient;
  final Color buttonColor;
  final String? loadingText;
  final double? textSize;
  final ButtonShapeEnum buttonShapeEnum;
  final Color textColor;
  final Color? inLineBackgroundColor;
  final double? elevation;

  CustomButton(
      {required this.idleText,
      this.buttonBehaviour,
      this.failedBehaviour,
      required this.onTap,
      this.validateStream,
      this.isAllCaps = false,
      this.enableClick = true,
      this.useGradient = false,
      this.buttonColor = blackColor,
      this.loadingText,
      this.textSize,
      this.elevation,
      this.inLineBackgroundColor,
      this.buttonShapeEnum = ButtonShapeEnum.flat,
      this.textColor = whiteColor});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.buttonBehaviour == null)
      return _button(ButtonState.idle);
    else
      return _buttonStateStream;
  }

  StreamBuilder<ButtonState> get _buttonStateStream =>
      StreamBuilder<ButtonState>(
        builder: (context, snapshot) => widget.failedBehaviour == null
            ? _button(snapshot.data!)
            : failedStream(snapshot.data!),
        stream: widget.buttonBehaviour!,
        initialData: ButtonState.idle,
      );

  StreamBuilder<String> failedStream(ButtonState buttonState) =>
      StreamBuilder<String>(
        builder: (context, snapshot) => widget.validateStream == null
            ? _button(buttonState, failedText: snapshot.data!)
            : enableButton(buttonState, snapshot.data!),
        stream: widget.failedBehaviour!,
        initialData: S.of(context).noDataFound,
      );

  StreamBuilder<bool> enableButton(
          ButtonState buttonState, String failedText) =>
      StreamBuilder<bool>(
        builder: (context, snapshot) => _button(buttonState,
            enable: snapshot.data == null ? false : snapshot.data,
            failedText: failedText),
        initialData: false,
        stream: widget.validateStream!,
      );

  Widget _button(ButtonState buttonState,
          {String failedText = '', bool? enable}) =>
      ProgressButton(
        stateWidgets: {
          ButtonState.idle: _idleText,
          ButtonState.fail: _failText(failedText),
          ButtonState.loading: _loadingText,
          ButtonState.success: _successText,
        },

        stateColors: {
          ButtonState.idle: enable == null
              ? widget.buttonColor
              : enable
                  ? widget.buttonColor
                  : greyColor,
          ButtonState.fail: blackColor,
          ButtonState.loading: widget.buttonColor,
          ButtonState.success: widget.buttonColor,
        },
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          widget.onTap();
        },
        elevation: widget.elevation == null ? 8.r : widget.elevation!,

        progressIndicatorSize: 60.h,
        height: 60.h,
        enable: widget.enableClick,
        buttonShapeEnum: widget.buttonShapeEnum,
        progressAlignment: MainAxisAlignment.center,

        radius: 10.0,
        state: buttonState,
        shapeDecoration: null,
        inLineBackgroundColor: widget.inLineBackgroundColor ?? whiteColor,
      );

  Widget get _idleText => CustomText(
        text:
            widget.isAllCaps ? widget.idleText.toUpperCase() : widget.idleText,
        customTextStyle: RegularStyle(
            color: widget.textColor,
            fontSize: widget.textSize == null ? 16.sp : widget.textSize!),
      );

  Widget _failText(String text) => CustomText(
        text: widget.isAllCaps
            ? _failedString(text).toUpperCase()
            : _failedString(text),
        customTextStyle: RegularStyle(
            color: widget.textColor,
            fontSize: widget.textSize == null ? 16.sp : widget.textSize!),
      );

  String _failedString(String failedText) {
    if (failedText.isEmpty) return S.of(context).noDataFound;
    return failedText;
  }

  Widget get _loadingText => CustomText(
      text: widget.isAllCaps ? loadingString.toUpperCase() : loadingString,
      customTextStyle: RegularStyle(
          color: widget.textColor,
          fontSize: widget.textSize == null ? 16.sp : widget.textSize!));

  String get loadingString =>
      widget.loadingText == null ? S.of(context).loading : widget.loadingText!;

  Widget get _successText => CustomText(
      text: widget.isAllCaps
          ? S.of(context).success.toUpperCase()
          : S.of(context).success,
      customTextStyle: RegularStyle(
          color: widget.textColor,
          fontSize: widget.textSize == null ? 16.sp : widget.textSize!));
}
