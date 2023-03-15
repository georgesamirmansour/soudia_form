import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:first_form/ui/secondForm/secondForm_bloc.dart';
import 'package:first_form/utilities/CustomText.dart';
import 'package:first_form/utilities/CustomTextStyle.dart';
import 'package:first_form/utilities/app_colors.dart';
import 'package:first_form/utilities/image_paths.dart';
import 'package:first_form/utilities/view_helper.dart';
import 'package:first_form/widgets/custom_button.dart';
import 'package:first_form/widgets/custom_text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_loader/image_helper.dart';

import '../../generated/l10n.dart';

class SecondFormWidget extends StatefulWidget {
  const SecondFormWidget({Key? key}) : super(key: key);

  @override
  State<SecondFormWidget> createState() => _SecondFormWidgetState();
}

class _SecondFormWidgetState extends State<SecondFormWidget> {
  SecondFormBloc secondFormBloc = SecondFormBloc();
  late DropzoneViewController controller1,
      controller2,
      controller3,
      controller4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secondFormBloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return _getChildWidget();
  }

  bool _isMobile() => MediaQuery.of(context).size.width < 950;

  Widget _getChildWidget() => Container(
        width: _isMobile()
            ? MediaQuery.of(context).size.width * 0.8
            : MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 10,
                  offset: const Offset(5, 5))
            ]),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _formText(S.of(context).allDataAndInfo, questColor, 18.sp, true),
              SizedBox(
                height: 20.h,
              ),
              _formText(S.of(context).logo, questColor, 16.sp, true),
              logoAttachment(0),
              SizedBox(
                height: 20.h,
              ),
              _formText(S.of(context).profile, questColor, 16.sp, true),
              Row(
                children: [uploadWidget(1), attachmentWidget(1)],
              ),
              SizedBox(
                height: 20.h,
              ),
              _getWebsiteSiteTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _formText(S.of(context).productsPhotos, questColor, 16.sp, true),
              Row(
                children: [uploadWidget(2), attachmentWidget(2)],
              ),
              SizedBox(
                height: 20.h,
              ),
              _getContactInformationTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _formText(S.of(context).clients, questColor, 16.sp, true),
              Row(
                children: [uploadWidget(3), attachmentWidget(3)],
              ),
              SizedBox(
                height: 20.h,
              ),
              _getFutureVisionTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getNamingBrandTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getProblemsSolveTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getAdvantageFactoryTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getFiveCompetitorsTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getMainGoalsTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _formText(S.of(context).foundation, questColor, 16.sp, true),
              radioWidget([S.of(context).yes, S.of(context).no]),
              SizedBox(
                height: 20.h,
              ),
              _getBrandPositivelyNegativelyTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getCustomerConcernsTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getCustomerNeedsTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getBriefDescriptionTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getStrengthsFactoryTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              _getWeaknessesFactoryTextFormFiled(),
              SizedBox(
                height: 20.h,
              ),
              registerButton()
            ],
          ),
        ),
      );

  Widget _formText(text, color, fontSize, isBold) {
    return CustomText(
        text: text,
        customTextStyle: isBold
            ? BoldStyle(color: color, fontSize: fontSize)
            : LightStyle(color: color, fontSize: fontSize));
  }

  Widget logoAttachment(index) {
    return Row(
      children: [uploadWidget(index), attachmentWidget(index)],
    );
  }

  Widget uploadWidget(index) {
    return DottedBorder(
        color: borderColor,
        strokeWidth: 1,
        padding: EdgeInsets.only(left: 1.w, right: 1.w),
        child: Container(
            alignment: Alignment.center,
            height: 94.h,
            width: 80.w,
            padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                DropzoneView(
                  operation: DragOperation.copy,
                  cursor: CursorType.grab,
                  onLoaded: () => print('Zone loaded'),
                  onError: (String? ev) => print('Error: $ev'),
                  onCreated: (ctrl) => index == 0
                      ? controller1= ctrl
                      : index == 1
                          ? controller2= ctrl
                          : index == 2
                              ? controller3= ctrl
                              : controller4 = ctrl,
                  onHover: () => print('Zone hovered'),
                  onDrop: (ev) async {
                    List<Map> photos = [];
                    photos = secondFormBloc.getImages(index);
                    final bytes;
                    index == 0
                        ? bytes = await controller1.getFileData(ev)
                        : index == 1
                            ? bytes = await controller1.getFileData(ev)
                            : index == 2
                                ? bytes = await controller1.getFileData(ev)
                                : bytes = await controller1.getFileData(ev);

                    photos.add({'path': bytes, 'name': ev.name});
                    print(ev.name);
                    updatePhotos(index, photos);
                  },
                  onLeave: () => print('Zone left'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageHelper(
                      image: uploadIcon,
                      width: 18.w,
                      height: 16.h,
                      imageType: ImageType.svg,
                      boxFit: BoxFit.fill,
                    ),
                    _formText(
                        S.of(context).dragOrDrop, blackColor, 13.sp, true),
                    _formText(S.of(context).or, blackColor, 13.sp, true),
                    InkWell(
                      child: _formText(
                          S.of(context).browse, accentColor, 13.sp, true),
                      onTap: () async {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(allowMultiple: true);

                        List<Map> photos = [];
                        result!.files.first.bytes;
                        photos = secondFormBloc.getImages(index);
                        for (int i = 0; i < result.files.length; i++) {
                          photos.add({
                            'path': result.files.elementAt(i).bytes,
                            'name': result.files.elementAt(i).name
                          });
                        }

                        updatePhotos(index, photos);
                      },
                    )
                  ],
                ),
              ],
            )));
  }

  updatePhotos(index, photos) {
    if (index == 0) {
      secondFormBloc.updateUploadLogoImage(photos);
    } else if (index == 1) {
      secondFormBloc.updateUploadProfileImage(photos);
    } else if (index == 2) {
      secondFormBloc.updateUploadProductsImage(photos);
    } else if (index == 3) {
      secondFormBloc.updateUploadClientsImage(photos);
    }
  }

  StreamBuilder<List<Map>> attachmentWidget(index) {
    return StreamBuilder(
      builder: (context, snapshot) => Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        height: 80.h,
        width: 80.w,
        child: ListView(
          children: [
            for (int i = 0; i < secondFormBloc.getImages(index).length; i++)
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 55.w,
                      child: _formText(
                          '${secondFormBloc.getImages(index)[i]['name']}',
                          hintColor,
                          14.sp,
                          false),
                    ),
                    InkWell(
                      child: Icon(
                        Icons.close,
                        color: accentColor,
                        size: 13.sp,
                      ),
                      onTap: () {
                        secondFormBloc.deleteImages(
                            index, i, secondFormBloc.getImages(index));
                      },
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
      stream: secondFormBloc.getStream(index),
    );
  }

  Widget _getWebsiteSiteTextFormFiled() => CustomTextFormFiled(
        labelText: S.of(context).websiteSite,
        onChanged: (value) {
          secondFormBloc.updateWebsiteSite(value);
        },
      );

  StreamBuilder<String> radioWidget(List data) {
    return StreamBuilder(
      builder: (context, snapshot) => Row(
        children: [
          for (int i = 0; i < data.length; i++)
            Row(
              children: [
                Radio(
                  value: data[i],
                  groupValue: secondFormBloc.getRadioValue(),
                  onChanged: (value) {
                    secondFormBloc.updateRadioBox(value);
                  },
                  activeColor: accentColor,
                ),
                SizedBox(
                  width: 5.0.w,
                ),
                CustomText(
                    text: data[i],
                    customTextStyle:
                        MediumStyle(fontSize: 12.sp, color: answerColor)),
              ],
            )
        ],
      ),
      stream: secondFormBloc.radioBox,
    );
  }

  Widget _getContactInformationTextFormFiled() => CustomTextFormFiled(
      labelText: S.of(context).contactInformation,
      onChanged: (value) {
        secondFormBloc.updateContactInformation(value);
      });

  Widget _getFutureVisionTextFormFiled() => CustomTextFormFiled(
      labelText: S.of(context).futureVision,
      onChanged: (value) {
        secondFormBloc.updateFutureVision(value);
      });

  Widget _getNamingBrandTextFormFiled() => CustomTextFormFiled(
      labelText: S.of(context).namingBrand,
      onChanged: (value) {
        secondFormBloc.updateNamingBrand(value);
      });

  Widget _getProblemsSolveTextFormFiled() => CustomTextFormFiled(
      labelText: S.of(context).problemsSolve,
      onChanged: (value) {
        secondFormBloc.updateProblemsSolve(value);
      });

  Widget _getAdvantageFactoryTextFormFiled() => CustomTextFormFiled(
      labelText: S.of(context).advantageFactory,
      onChanged: (value) {
        secondFormBloc.updateAdvantageFactory(value);
      });

  Widget _getFiveCompetitorsTextFormFiled() => CustomTextFormFiled(
      labelText: S.of(context).fiveCompetitors,
      onChanged: (value) {
        secondFormBloc.updateFiveCompetitors(value);
      });

  Widget _getMainGoalsTextFormFiled() => CustomTextFormFiled(
      labelText: S.of(context).mainGoals,
      onChanged: (value) {
        secondFormBloc.updateMainGoals(value);
      });

  Widget _getBrandPositivelyNegativelyTextFormFiled() => CustomTextFormFiled(
      labelText: S.of(context).brandPositivelyNegatively,
      onChanged: (value) {
        secondFormBloc.updateBrandPositivelyNegatively(value);
      });

  Widget _getCustomerConcernsTextFormFiled() => CustomTextFormFiled(
      labelText: S.of(context).customerConcerns,
      onChanged: (value) {
        secondFormBloc.updateCustomerConcerns(value);
      });

  Widget _getCustomerNeedsTextFormFiled() => CustomTextFormFiled(
      labelText: S.of(context).customerNeeds,
      onChanged: (value) {
        secondFormBloc.updateCustomerNeeds(value);
      });

  Widget _getBriefDescriptionTextFormFiled() => CustomTextFormFiled(
      labelText: S.of(context).briefDescription,
      onChanged: (value) {
        secondFormBloc.updateBriefDescription(value);
      });

  Widget _getStrengthsFactoryTextFormFiled() => CustomTextFormFiled(
      labelText: S.of(context).strengthsFactory,
      onChanged: (value) {
        secondFormBloc.updateStrengthsFactory(value);
      });

  Widget _getWeaknessesFactoryTextFormFiled() => CustomTextFormFiled(
      labelText: S.of(context).weaknessesFactory,
      onChanged: (value) {
        secondFormBloc.updateWeaknessesFactory(value);
      });

  StreamBuilder<bool> registerButton() {
    return StreamBuilder(
      builder: (context, snapshot) => Padding(
          padding: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
          child: Center(
            child: CustomButton(
              idleText: S.of(context).register,
              textSize: 16.sp,
              textColor: whiteColor,
              buttonBehaviour: secondFormBloc.buttonBehavior,
              failedBehaviour: secondFormBloc.failedBehaviour,
              onTap: secondFormBloc.validate() ? callSendSTMP : () {},
              buttonColor: secondFormBloc.validate() ? accentColor : greyColor,
            ),
          )),
      stream: secondFormBloc.validateBehaviour,
    );
  }

  Future<void> callSendSTMP() async {
    await secondFormBloc.sendSMTP().listen((value) {
      secondFormBloc.checkResponseStateForButton(value, context,
          failedBehaviour: secondFormBloc.failedBehaviour,
          buttonBehaviour: secondFormBloc.buttonBehavior, onSuccess: () {
        ViewHelper(context).showSnakeBar(S.current.registerDone);

        ViewHelper(context).openHomeWidgetScreen();
      });
    });
  }
}
