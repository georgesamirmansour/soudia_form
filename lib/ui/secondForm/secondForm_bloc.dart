import 'dart:convert';

import 'package:custom_progress_button/custom_progress.dart';
import 'package:dio/dio.dart';
import 'package:first_form/Network/api_client.dart';
import 'package:first_form/bases/button_bloc.dart';
import 'package:first_form/bases/validator.dart';
import 'package:first_form/generated/l10n.dart';
import 'package:first_form/models/api_state.dart';
import 'package:first_form/models/sendEmail_response.dart';
import 'package:first_form/repository/sendSMTP_repository.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SecondFormBloc extends ButtonBloc {
  final _radioBoxBehaviour = BehaviorSubject<String>();
  final _uploadImageLogoBehaviour = BehaviorSubject<List<Map>>();
  final _uploadImageProfileBehaviour = BehaviorSubject<List<Map>>();
  final _uploadImageProductsBehaviour = BehaviorSubject<List<Map>>();
  final _uploadImageClientsBehaviour = BehaviorSubject<List<Map>>();
  final _websiteSiteBehaviour = BehaviorSubject<String>();
  final _contactInformationBehaviour = BehaviorSubject<String>();
  final _futureVisionBehaviour = BehaviorSubject<String>();
  final _namingBrandBehaviour = BehaviorSubject<String>();
  final _problemsSolveBehaviour = BehaviorSubject<String>();
  final _advantageFactoryBehaviour = BehaviorSubject<String>();
  final _fiveCompetitorsBehaviour = BehaviorSubject<String>();
  final _mainGoalsBehaviour = BehaviorSubject<String>();
  final _brandPositivelyNegativelyBehaviour = BehaviorSubject<String>();
  final _customerConcernsBehaviour = BehaviorSubject<String>();
  final _customerNeedsBehaviour = BehaviorSubject<String>();
  final _briefDescriptionBehaviour = BehaviorSubject<String>();
  final _strengthsFactoryBehaviour = BehaviorSubject<String>();
  final _weaknessesFactoryBehaviour = BehaviorSubject<String>();
  final _validateBehaviour = BehaviorSubject<bool>();
  final Validator _validator = Validator();

  Stream<String> get radioBox => _radioBoxBehaviour.stream;

  Stream<bool> get validateBehaviour => _validateBehaviour.stream;

  Stream<String> get websiteSite => _websiteSiteBehaviour.stream;

  Stream<String> get contactInformation => _contactInformationBehaviour.stream;

  Stream<String> get futureVision => _futureVisionBehaviour.stream;

  Stream<String> get namingBrand => _futureVisionBehaviour.stream;

  Stream<String> get problemsSolve => _problemsSolveBehaviour.stream;

  Stream<String> get advantageFactory => _advantageFactoryBehaviour.stream;

  Stream<String> get fiveCompetitors => _fiveCompetitorsBehaviour.stream;

  Stream<String> get mainGoals => _mainGoalsBehaviour.stream;

  Stream<String> get brandPositivelyNegatively =>
      _brandPositivelyNegativelyBehaviour.stream;

  Stream<String> get customerConcerns => _customerConcernsBehaviour.stream;

  Stream<String> get customerNeeds => _customerNeedsBehaviour.stream;

  Stream<String> get briefDescription => _briefDescriptionBehaviour.stream;

  Stream<String> get strengthsFactory => _strengthsFactoryBehaviour.stream;

  Stream<String> get weaknessesFactory => _weaknessesFactoryBehaviour.stream;

  Stream<List<Map>> get uploadLogoImage => _uploadImageLogoBehaviour.stream;

  Stream<List<Map>> get uploadProductsImage =>
      _uploadImageProductsBehaviour.stream;

  Stream<List<Map>> get uploadClientsImage =>
      _uploadImageClientsBehaviour.stream;

  Stream<List<Map>> get uploadProfileImage =>
      _uploadImageProfileBehaviour.stream;

  Function(String) get updateRadioBox => _radioBoxBehaviour.sink.add;

  Function(bool) get updateValidate => _validateBehaviour.sink.add;

  Function(String) get updateWebsiteSite => _websiteSiteBehaviour.sink.add;

  Function(String) get updateContactInformation =>
      _contactInformationBehaviour.sink.add;

  Function(String) get updateFutureVision => _futureVisionBehaviour.sink.add;

  Function(String) get updateNamingBrand => _namingBrandBehaviour.sink.add;

  Function(String) get updateProblemsSolve => _problemsSolveBehaviour.sink.add;

  Function(String) get updateAdvantageFactory =>
      _advantageFactoryBehaviour.sink.add;

  Function(String) get updateFiveCompetitors =>
      _fiveCompetitorsBehaviour.sink.add;

  Function(String) get updateMainGoals => _mainGoalsBehaviour.sink.add;

  Function(String) get updateBrandPositivelyNegatively =>
      _brandPositivelyNegativelyBehaviour.sink.add;

  Function(String) get updateCustomerConcerns =>
      _customerConcernsBehaviour.sink.add;

  Function(String) get updateCustomerNeeds => _customerNeedsBehaviour.sink.add;

  Function(String) get updateBriefDescription =>
      _briefDescriptionBehaviour.sink.add;

  Function(String) get updateStrengthsFactory =>
      _strengthsFactoryBehaviour.sink.add;

  Function(String) get updateWeaknessesFactory =>
      _weaknessesFactoryBehaviour.sink.add;

  Function(List<Map>) get updateUploadProductsImage =>
      _uploadImageProductsBehaviour.sink.add;

  Function(List<Map>) get updateUploadClientsImage =>
      _uploadImageClientsBehaviour.sink.add;

  Function(List<Map>) get updateUploadLogoImage =>
      _uploadImageLogoBehaviour.sink.add;

  Function(List<Map>) get updateUploadProfileImage =>
      _uploadImageProfileBehaviour.sink.add;

  getImages(index) {
    if (index == 0) {
      return _uploadImageLogoBehaviour.value;
    } else if (index == 1) {
      return _uploadImageProfileBehaviour.value;
    } else if (index == 2) {
      return _uploadImageProductsBehaviour.value;
    } else if (index == 3) {
      return _uploadImageClientsBehaviour.value;
    }
  }

  deleteImages(index, removeIndex, List<Map> photos) {
    photos.removeAt(removeIndex);
    if (index == 0) {
      updateUploadLogoImage(photos);
    } else if (index == 1) {
      updateUploadProfileImage(photos);
    } else if (index == 2) {
      updateUploadProductsImage(photos);
    } else if (index == 3) {
      updateUploadClientsImage(photos);
    }
  }

  getStream(index) {
    if (index == 0) {
      return uploadLogoImage;
    } else if (index == 1) {
      return uploadProfileImage;
    } else if (index == 2) {
      return uploadProductsImage;
    } else if (index == 3) {
      return uploadClientsImage;
    }
  }

  getRadioValue() {
    return _radioBoxBehaviour.value;
  }

  @override
  void init() {
    super.init();
    _radioBoxBehaviour.sink.add(S.current.no);
    _uploadImageLogoBehaviour.sink.add([]);
    _uploadImageProfileBehaviour.sink.add([]);
    _uploadImageProductsBehaviour.sink.add([]);
    _uploadImageClientsBehaviour.sink.add([]);
    _validateBehaviour.sink.add(false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool validate() {
    try {
      updateValidate(true);
      if (_uploadImageLogoBehaviour.value[0].isNotEmpty &&
          _uploadImageProductsBehaviour.value[0].isNotEmpty &&
          _uploadImageClientsBehaviour.value[0].isNotEmpty &&
          _websiteSiteBehaviour.value.isNotEmpty &&
          _contactInformationBehaviour.value.isNotEmpty &&
          _futureVisionBehaviour.value.isNotEmpty &&
          _namingBrandBehaviour.value.isNotEmpty &&
          _problemsSolveBehaviour.value.isNotEmpty &&
          _advantageFactoryBehaviour.value.isNotEmpty &&
          _fiveCompetitorsBehaviour.value.isNotEmpty &&
          _mainGoalsBehaviour.value.isNotEmpty &&
          _brandPositivelyNegativelyBehaviour.value.isNotEmpty &&
          _customerConcernsBehaviour.value.isNotEmpty &&
          _customerNeedsBehaviour.value.isNotEmpty &&
          _briefDescriptionBehaviour.value.isNotEmpty &&
          _strengthsFactoryBehaviour.value.isNotEmpty &&
          _weaknessesFactoryBehaviour.value.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Stream<ApiState> sendSMTP() {
    List arr = [];
    for (int i = 0; i < 4; i++) {
      var getData= convertFiles(i == 0
          ? _uploadImageLogoBehaviour.value
          : i == 1
              ? _uploadImageProfileBehaviour.value
              : i == 2
                  ? _uploadImageProductsBehaviour.value
                  : _uploadImageClientsBehaviour.value);
      if(getData.isNotEmpty)
        arr+=getData;
    }
    print(arr);
    FormData formData = FormData.fromMap({
      "Body": '${S.current.websiteSite} : ${_websiteSiteBehaviour.value}\n'
          '${S.current.contactInformation} : ${_contactInformationBehaviour.value}\n'
          '${S.current.futureVision} : ${_futureVisionBehaviour.value}\n'
          '${S.current.namingBrand} : ${_namingBrandBehaviour.value}\n'
          '${S.current.problemsSolve} : ${_problemsSolveBehaviour.value}\n'
          '${S.current.advantageFactory} : ${_advantageFactoryBehaviour.value}\n'
          '${S.current.fiveCompetitors} : ${_fiveCompetitorsBehaviour.value}\n'
          '${S.current.mainGoals} : ${_mainGoalsBehaviour.value}\n'
          '${S.current.foundation} : ${_radioBoxBehaviour.value}\n'
          '${S.current.brandPositivelyNegatively} : ${_brandPositivelyNegativelyBehaviour.value}\n'
          '${S.current.customerConcerns} : ${_customerConcernsBehaviour.value}\n'
          '${S.current.customerNeeds} : ${_customerNeedsBehaviour.value}\n'
          '${S.current.briefDescription} : ${_briefDescriptionBehaviour.value}\n'
          '${S.current.strengthsFactory} : ${_strengthsFactoryBehaviour.value}\n'
          '${S.current.weaknessesFactory} : ${_weaknessesFactoryBehaviour.value}\n',
      "Files": arr,
    });
    return sendSMTPRepository().sendSMTP(formData: formData);
  }

  void checkResponseStateForButton(ApiState apiState, BuildContext context,
      {VoidCallback? onSuccess,
      required BehaviorSubject<String> failedBehaviour,
      required BehaviorSubject<ButtonState> buttonBehaviour}) {
    if (apiState is LoadingState)
      buttonBehaviour.sink.add(ButtonState.loading);
    else if (apiState is SuccessState) {
      buttonBehaviour.sink.add(ButtonState.success);
      onSuccess!();
    } else if (apiState is ErrorState) {
      buttonBehaviour.sink.add(ButtonState.idle);
    } else {
      buttonBehaviour.sink.add(ButtonState.idle);
    }
  }

  List convertFiles(data) {
    List arr = [];
    for (var i = 0; i < data.length; i++) {
      arr.add(
          MultipartFile.fromBytes(data[i]['path'], filename: data[i]['name']));
    }
    return arr;
  }
}
