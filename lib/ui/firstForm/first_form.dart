import 'package:custom_progress_button/custom_progress.dart';
import 'package:first_form/RadioMapper.dart';
import 'package:first_form/bases/bloc_base.dart';
import 'package:first_form/bases/bloc_base.dart';
import 'package:first_form/ui/firstForm/first_form_bloc.dart';
import 'package:first_form/ui/firstForm/preferredLanguage/project_language_widget.dart';
import 'package:first_form/ui/firstForm/projectIdentity/project_identity_widget.dart';
import 'package:first_form/ui/firstForm/projectIndustry/project_industry_widget.dart';
import 'package:first_form/ui/projectPattern/project_pattern_widget.dart';
import 'package:first_form/utilities/CustomText.dart';
import 'package:first_form/utilities/CustomTextStyle.dart';
import 'package:first_form/utilities/app_colors.dart';
import 'package:first_form/widgets/custom_progress_button.dart';
import 'package:first_form/widgets/custom_text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bases/Validator.dart';
import '../../generated/l10n.dart';

class FirstFormWidget extends StatefulWidget {
  const FirstFormWidget({Key? key}) : super(key: key);

  @override
  State<FirstFormWidget> createState() => _FirstFormWidgetState();
}

class _FirstFormWidgetState extends State<FirstFormWidget> {
  final FirstFormBloc _bloc = FirstFormBloc();

  @override
  Widget build(BuildContext context) => _blocProvider;

  BlocProvider get _blocProvider =>
      BlocProvider(bloc: _bloc, child: _getChildWidget());

  bool _isMobile() => MediaQuery.of(context).size.width < 1200;

  Widget _getChildWidget() => _getFormContainer(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getNameTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getMobileTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getProjectTypeTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getLanguageText(),
              ProjectLanguageWidget(onSelectItem: (radioMapper) {
                _bloc.updatePreferredLanguage(radioMapper);
              }),
              SizedBox(
                height: 10.h,
              ),
              _getProjectTypeText(),
              SizedBox(
                height: 10.h,
              ),
              ProjectIndustryWidget(
                selectedItem: (radioMapper) =>
                    _bloc.updateProjectFiled(radioMapper),
              ),
              SizedBox(
                height: 20.h,
              ),
              _getProjectValuableTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getProjectIdeaTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getProjectImpressionTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getProjectTargetTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getProjectLogoText(),
              SizedBox(
                height: 10.h,
              ),
              ProjectPatternWidget(
                onSelectItem: (radioMapper) =>
                    _bloc.updateProjectPattern(radioMapper),
              ),
              SizedBox(
                height: 10.h,
              ),
              _getProjectIdentityText(),
              SizedBox(
                height: 10.h,
              ),
              ProjectIdentityWidget(
                selectedList: (list) => _bloc.updateProjectIdentityList(list),
              ),
              SizedBox(
                height: 20.h,
              ),
              _getProjectPriceTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getProjectNotesTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getBtn(),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      );

  Widget _getFormContainer({required Widget child}) => Container(
        width: _isMobile()
            ? MediaQuery.of(context).size.width * 0.8
            : MediaQuery.of(context).size.width * 0.45,
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 10,
                  offset: const Offset(5, 5))
            ]),
        child: child,
      );

  StreamBuilder<String> _getNameTextFormFiled() => StreamBuilder(
        builder: (context, snapshot) => CustomTextFormFiled(
          labelText: S.of(context).name,
          onChanged: (value) => _bloc.updateName(value),
          validator: (value) => Validator().emptyValidator(context).call(value),
        ),
        stream: _bloc.nameStream,
      );

  StreamBuilder<String> _getMobileTextFormFiled() => StreamBuilder(
        builder: (context, snapshot) => CustomTextFormFiled(
          labelText: S.of(context).mobile,
          onChanged: (value) => _bloc.updateMobile(value),
          validator: (value) => Validator().emptyValidator(context).call(value),
        ),
        stream: _bloc.mobileStream,
      );

  StreamBuilder<String> _getProjectTypeTextFormFiled() => StreamBuilder(
        builder: (context, snapshot) => CustomTextFormFiled(
          labelText: S.of(context).projectType,
          onChanged: (value) => _bloc.updateProjectType(value),
          validator: (value) => Validator().emptyValidator(context).call(value),
        ),
        stream: _bloc.projectTypeStream,
      );

  Widget _getLanguageText() => CustomText(
      text: S.of(context).projectLanguageType,
      customTextStyle: MediumStyle(color: questColor, fontSize: 14.sp));

  Widget _getProjectTypeText() => CustomText(
      text: S.of(context).projectSubject,
      customTextStyle: MediumStyle(color: questColor, fontSize: 14.sp));

  StreamBuilder<String> _getProjectValuableTextFormFiled() => StreamBuilder(
        builder: (context, snapshot) => CustomTextFormFiled(
          labelText: S.of(context).projectValuable,
          onChanged: (value) => _bloc.updateProjectValuable(value),
          validator: (value) => Validator().emptyValidator(context).call(value),
        ),
        stream: _bloc.projectValuableStream,
      );

  StreamBuilder<String> _getProjectIdeaTextFormFiled() => StreamBuilder(
        builder: (context, snapshot) => CustomTextFormFiled(
          labelText: S.of(context).projectIdea,
          onChanged: (value) => _bloc.updateProjectIdea(value),
          validator: (value) => Validator().emptyValidator(context).call(value),
        ),
        stream: _bloc.projectIdeaStream,
      );

  StreamBuilder<String> _getProjectImpressionTextFormFiled() => StreamBuilder(
        builder: (context, snapshot) => CustomTextFormFiled(
          labelText: S.of(context).projectImpression,
          onChanged: (value) => _bloc.updateProjectImpression(value),
          validator: (value) => Validator().emptyValidator(context).call(value),
        ),
        stream: _bloc.projectImpressionStream,
      );

  StreamBuilder<String> _getProjectTargetTextFormFiled() => StreamBuilder(
        builder: (context, snapshot) => CustomTextFormFiled(
          labelText: S.of(context).projectTarget,
          onChanged: (value) => _bloc.updateProjectTarget(value),
          validator: (value) => Validator().emptyValidator(context).call(value),
        ),
        stream: _bloc.projectTargetStream,
      );

  Widget _getProjectLogoText() => CustomText(
      text: S.of(context).projectLogo,
      customTextStyle: MediumStyle(color: questColor, fontSize: 14.sp));

  Widget _getProjectIdentityText() => CustomText(
      text: S.of(context).projectIdentity,
      customTextStyle: MediumStyle(color: questColor, fontSize: 14.sp));

  StreamBuilder<String> _getProjectPriceTextFormFiled() => StreamBuilder(
        builder: (context, snapshot) => CustomTextFormFiled(
          labelText: S.of(context).projectPrice,
          onChanged: (value) => _bloc.updateProjectPrice(value),
          validator: (value) => Validator().emptyValidator(context).call(value),
        ),
        stream: _bloc.projectPriceStream,
      );

  StreamBuilder<String> _getProjectNotesTextFormFiled() => StreamBuilder(
        builder: (context, snapshot) => CustomTextFormFiled(
          labelText: S.of(context).projectNotes,
          onChanged: (value) => _bloc.updateNotes(value),
          validator: (value) => Validator().emptyValidator(context).call(value),
        ),
        stream: _bloc.projectNotesStream,
      );

  Widget _getBtn() => Center(
        child: CustomButton(
          idleText: S.of(context).send,
          onTap: () {
            _bloc.sendSMTP();
          },
          enableClick: true,
          buttonBehaviour: _bloc.buttonBehaviour,
          validateStream: _bloc.validate,
        ),
      );
}
