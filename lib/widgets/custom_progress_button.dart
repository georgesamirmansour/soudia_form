
import 'package:custom_progress_button/custom_icon_button.dart';
import 'package:custom_progress_button/custom_progress.dart';
import 'package:BROADCAST/utilities/CustomTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';

import '../generated/l10n.dart';
import '../utilities/CustomText.dart';
import '../utilities/app_colors.dart';
import 'custom_progress.dart';

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
  final bool iconButton;
  final Widget? icon;

  CustomButton(
      {required this.idleText,
        this.buttonBehaviour,
        this.failedBehaviour,
        required this.onTap,
        this.validateStream,
        this.isAllCaps = false,
        this.enableClick = true,
        this.useGradient = false,
        this.buttonColor = accentColor,
        this.loadingText,
        this.textSize,
        this.elevation,
        this.inLineBackgroundColor,
        this.buttonShapeEnum = ButtonShapeEnum.flat,
        this.textColor = whiteColor,
        this.iconButton = false,
        this.icon});

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
            ? _getWhichButton(
            failedText: '', enable: true, buttonState: snapshot.data!)
            : failedStream(snapshot.data!),
        stream: widget.buttonBehaviour!,
        initialData: ButtonState.idle,
      );

  StreamBuilder<String> failedStream(ButtonState buttonState) =>
      StreamBuilder<String>(
        builder: (context, snapshot) => widget.validateStream == null
            ? _getWhichButton(
            failedText: snapshot.data!,
            enable: true,
            buttonState: buttonState)
            : enableButton(buttonState, snapshot.data!),
        stream: widget.failedBehaviour!,
        initialData: S.of(context).noDataFound,
      );

  StreamBuilder<bool> enableButton(
      ButtonState buttonState, String failedText) =>
      StreamBuilder<bool>(
        builder: (context, snapshot) => _getWhichButton(
            failedText: failedText,
            enable: snapshot.data!,
            buttonState: buttonState),
        initialData: false,
        stream: widget.validateStream!,
      );

  Widget _getWhichButton(
      {ButtonState buttonState = ButtonState.idle,
        String failedText = '',
        bool? enable}) =>
      widget.iconButton
          ? _iconButton(buttonState, enable: enable, failedText: failedText)
          : _button(buttonState, enable: enable, failedText: failedText);

  Widget _iconButton(ButtonState buttonState,
      {String failedText = '', bool? enable}) =>
      ProgressButton.icon(
        iconButtons: {
          ButtonState.idle: _idleIconButton,
          ButtonState.fail: _failedIconButton(failedText),
          ButtonState.loading: _loadingIconButton,
          ButtonState.success: _successIconButton,
        },
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          widget.onTap();
        },
        elevation: widget.elevation == null ? 8 : widget.elevation!,
        progressWidget: CustomProgress(color: Colors.white),
        progressIndicatorSize: 50,
        height: 50,
        maxWidth: 300,
        minWidth: 200,
        enable: widget.enableClick,
        buttonShapeEnum: widget.buttonShapeEnum,
        radius: 50.0,
        state: buttonState,
        inLineBackgroundColor: widget.inLineBackgroundColor ?? whiteColor,
        iconPadding: 10,
        progressIndicatorAlignment: MainAxisAlignment.center,
        textStyle: MediumStyle(
            color: widget.textColor,
            fontSize: widget.textSize == null ? 16.sp : widget.textSize!)
            .getStyle(),
      );

  CustomIconButton get _idleIconButton => CustomIconButton(
      color: widget.buttonColor, icon: widget.icon, text: widget.idleText);

  CustomIconButton _failedIconButton(String failedText) => CustomIconButton(
      color: widget.buttonColor,
      icon: Icon(
        Icons.error_outline_outlined,
        color: widget.textColor,
      ),
      text: failedText);

  CustomIconButton get _loadingIconButton => CustomIconButton(
      color: widget.buttonColor,
      icon: CustomProgress(
        color: widget.textColor,
        size: 15,
      ),
      text: '');

  CustomIconButton get _successIconButton => CustomIconButton(
      color: widget.buttonColor,
      icon: Icon(
        Icons.check,
        color: widget.textColor,
      ),
      text: widget.idleText);

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
          // if(Platform.isIOS || Platform.isAndroid)
          // FocusScope.of(context).requestFocus(FocusNode());
          widget.onTap();
        },

        elevation: widget.elevation == null ? 8 : widget.elevation!,
        progressWidget: CustomProgress(color: Colors.white),
        progressIndicatorSize: 50,
        height: 50,
        // maxWidth: double.infinity,
        // minWidth: MediaQuery.of(context).size.width *0.7,
        enable: widget.enableClick,
        buttonShapeEnum: widget.buttonShapeEnum,
        progressAlignment: MainAxisAlignment.center,
        radius: 8.r,

        state: buttonState,
        shapeDecoration: null,
        inLineBackgroundColor: widget.inLineBackgroundColor ?? whiteColor,
      );

  Widget get _idleText => CustomText(
    text:
    widget.isAllCaps ? widget.idleText.toUpperCase() : widget.idleText,
    customTextStyle: RegularStyle(
        color: widget.textColor,
        fontSize: widget.textSize == null ? 16 : widget.textSize!),
  );

  Widget _failText(String text) => CustomText(
    text: widget.isAllCaps
        ? _failedString(text).toUpperCase()
        : _failedString(text),
    customTextStyle: RegularStyle(
        color: widget.textColor,
        fontSize: widget.textSize == null ? 16 : widget.textSize!),
  );

  String _failedString(String failedText) {
    if (failedText.isEmpty) return S.of(context).noDataFound;
    return failedText;
  }

  Widget get _loadingText => CustomText(
      text: widget.isAllCaps ? loadingString.toUpperCase() : loadingString,
      customTextStyle: RegularStyle(
          color: widget.textColor,
          fontSize: widget.textSize == null ? 16 : widget.textSize!));

  String get loadingString =>
      widget.loadingText == null ? S.of(context).loading : widget.loadingText!;

  Widget get _successText => CustomText(
      text: widget.isAllCaps
          ? S.of(context).success.toUpperCase()
          : S.of(context).success,
      customTextStyle: RegularStyle(
          color: widget.textColor,
          fontSize: widget.textSize == null ? 16 : widget.textSize!));
}
