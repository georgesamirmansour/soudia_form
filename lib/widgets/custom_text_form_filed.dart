import 'package:first_form/utilities/CustomTextStyle.dart';
import 'package:first_form/utilities/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_loader/image_helper.dart';

class CustomTextFormFiled extends StatelessWidget {
  final bool enableInteractiveSelection;
  final Color? borderColor;
  final VoidCallback? onTap;
  final TextEditingController? textEditingController;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final Widget? suffixIcon, prefixIcon;
  final Key? key;
  final Function(bool isDenes)? updatePasswordToggle;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final bool enable;
  final bool expanded;
  final bool isPassword;
  final bool passwordVisibility;
  final String labelText;
  final bool isLabel;
  final bool isDense;
  final bool readOnly;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsets? customContentPadding;
  final bool usedInAppBar;
  final int? minLines, maxLines;
  final bool hasContentPadding;
  final FocusNode? focusNode;
  final bool autoFocus;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLength;
  final bool showCounter;
  final bool enableBorder;
  final String? initialValue;
  final TextCapitalization? textCapitalization;
  final bool enableSuggestions;

  CustomTextFormFiled(
      {required this.labelText,
      this.enableInteractiveSelection = true,
      this.onTap,
      this.textEditingController,
      this.onChanged,
      this.errorText,
      this.prefixIcon,
      this.suffixIcon,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.enable = true,
      this.expanded = false,
      this.isPassword = false,
      this.isLabel = false,
      this.isDense = false,
      this.passwordVisibility = false,
      this.readOnly = false,
      this.updatePasswordToggle,
      this.customContentPadding,
      this.onFieldSubmitted,
      this.validator,
      this.usedInAppBar = false,
      this.minLines,
      this.hasContentPadding = true,
      this.focusNode,
      this.autoFocus = false,
      this.inputFormatter,
      this.borderColor,
      this.showCounter = true,
      this.maxLength,
      this.enableBorder = true,
      this.maxLines,
      this.initialValue,
      this.textCapitalization,
      this.enableSuggestions = false,
      this.key});

  @override
  Widget build(BuildContext context) => _textFormFiled;

  Widget get _textFormFiled => TextFormField(
        onTap: onTap,
        style: _defaultTextStyle,
        initialValue: initialValue,
        textInputAction: textInputAction,
        cursorColor: accentColor,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textCapitalization: textCapitalization == null
            ? TextCapitalization.sentences
            : textCapitalization!,
        showCursor: !readOnly,
        controller: textEditingController,
        keyboardType: textInputType,
        enabled: enable,
        // focusNode: focusNode == null ? FocusNode() : focusNode,
        enableInteractiveSelection: enableInteractiveSelection,
        expands: expanded,
        autofocus: autoFocus,
        maxLength: maxLength,
        inputFormatters: inputFormatter,
        maxLines: isPassword
            ? 1
            : passwordVisibility
                ? 1
                : maxLines,
        validator: (value) => validator == null ? null : validator!(value),
        obscureText: passwordVisibility,
        readOnly: readOnly,
        onChanged: (value) => onChanged != null ? onChanged!(value) : null,
        minLines: isPassword
            ? 1
            : minLines,
        enableSuggestions: enableSuggestions,
        decoration: _inputDecoration,
        toolbarOptions: enable
            ? const ToolbarOptions(
                copy: true, cut: true, paste: true, selectAll: true)
            : const ToolbarOptions(
                selectAll: false, paste: false, cut: false, copy: false),
        selectionControls: CupertinoTextSelectionControls(),
        // onFieldSubmitted: (value) => onFieldSubmitted!(value),
      );

  InputDecoration get _inputDecoration => InputDecoration(
        errorStyle: _errorTextStyle,
        errorMaxLines: 4,
        contentPadding: hasContentPadding
            ? customContentPadding ??
                const EdgeInsets.only(
                    left: 14.0, right: 14.0, top: 14.0, bottom: 14.0)
            : null,
        errorText: errorText,
        enabled: enable,
        counterStyle: _counterTextStyle,
        hintStyle: _hintTextStyle,
        helperStyle: _counterTextStyle,
        labelStyle: _defaultTextStyle,
        isDense: isDense,
        fillColor: Colors.white,
        filled: true,
        // fillColor: usedInAppBar ? Colors.white : Colors.transparent,
        // filled: usedInAppBar,
        suffixIcon: isPassword ? _passwordIcon : suffixIcon,
        prefixIcon: prefixIcon,
        labelText: !isLabel ? labelText : null,
        hintText: isLabel ? labelText : null,
        border: _getBorder(greyColor),
        disabledBorder: _getBorder(greyColor),
        enabledBorder: _getBorder(greyColor),
        errorBorder: _getBorder(Colors.red),
        focusedBorder: _getBorder(greyColor),
        focusedErrorBorder: _getBorder(Colors.red),
      );

  Widget get _passwordIcon => IconButton(
        icon: passwordVisibility ? Container() : Container(),
        onPressed: () {
          updatePasswordToggle!(!passwordVisibility);
        },
      );

  Widget loadVisibilityIcon(String path) => ImageHelper(
        image: path,
        imageType: ImageType.svg,
        boxFit: BoxFit.fill,
      );

  TextStyle get _counterTextStyle =>
      MediumStyle(color: usedInAppBar ? blackColor : blackColor, fontSize: 18)
          .getStyle();

  TextStyle get _errorTextStyle =>
      MediumStyle(color: Colors.red, fontSize: 16).getStyle();

  TextStyle get _hintTextStyle =>
      MediumStyle(color: usedInAppBar ? blackColor : questColor, fontSize: 18)
          .getStyle();

  TextStyle get _defaultTextStyle =>
      MediumStyle(color: blackColor, fontSize: 14).getStyle();

  InputBorder? _getBorder(Color color) => usedInAppBar
      ? UnderlineInputBorder(borderSide: BorderSide(color: color, width: 1.0))
      : getOutLineBorder(color);

  InputBorder getOutLineBorder(Color color) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
          color: borderColor == null ? color : borderColor!, width: 1.0));
}
