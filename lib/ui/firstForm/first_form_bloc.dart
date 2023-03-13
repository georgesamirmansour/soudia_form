import 'dart:convert';

import 'package:custom_progress_button/custom_progress.dart';
import 'package:dio/dio.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:first_form/RadioMapper.dart';
import 'package:first_form/bases/bloc_base.dart';
import 'package:first_form/ui/network/api_client.dart';
import 'package:first_form/ui/network/send_email_request.dart';
import 'package:flutter_mail_server/flutter_mail_server.dart';
import 'package:rxdart/rxdart.dart';

class FirstFormBloc extends BlocBase {
  final _nameBehaviour = BehaviorSubject<String>();
  final _mobileBehaviour = BehaviorSubject<String>();
  final _projectTypeBehaviour = BehaviorSubject<String>();
  final _selectedPreferredLanguageBehaviour = BehaviorSubject<RadioMapper>();
  final _selectedProjectFiledBehaviour = BehaviorSubject<RadioMapper>();
  final _projectValuableBehaviour = BehaviorSubject<String>();
  final _projectIdeaBehaviour = BehaviorSubject<String>();
  final _projectImpressionBehaviour = BehaviorSubject<String>();
  final _projectTargetBehaviour = BehaviorSubject<String>();
  final _projectPatterBehaviour = BehaviorSubject<RadioMapper>();
  final _projectIdentityBehaviour = BehaviorSubject<List<RadioMapper>>();
  final _projectPriceBehaviour = BehaviorSubject<String>();
  final _projectNotesBehaviour = BehaviorSubject<String>();
  final buttonBehaviour = BehaviorSubject<ButtonState>();
  String _basicAuth = 'Basic ${base64.encode(utf8.encode('Sadek:123'))}';
  final Dio _dio = Dio(BaseOptions(
    connectTimeout: const Duration(minutes: 3),
    receiveTimeout: const Duration(minutes: 3),
    sendTimeout: const Duration(minutes: 3),
    validateStatus: (status) => status == 200,
  ));

  Stream<String> get nameStream => _nameBehaviour.stream;

  Stream<String> get mobileStream => _mobileBehaviour.stream;

  Stream<String> get projectTypeStream => _projectTypeBehaviour.stream;

  Stream<String> get projectValuableStream => _projectValuableBehaviour.stream;

  Stream<String> get projectIdeaStream => _projectIdeaBehaviour.stream;

  Stream<String> get projectImpressionStream =>
      _projectImpressionBehaviour.stream;

  Stream<String> get projectTargetStream => _projectTargetBehaviour.stream;

  Stream<String> get projectPriceStream => _projectPriceBehaviour.stream;

  Stream<String> get projectNotesStream => _projectNotesBehaviour.stream;

  Function(String) get updateName => _nameBehaviour.sink.add;

  Function(String) get updateMobile => _mobileBehaviour.sink.add;

  Function(String) get updateProjectType => _projectTypeBehaviour.sink.add;

  Function(String) get updateProjectValuable =>
      _projectValuableBehaviour.sink.add;

  Function(String) get updateProjectIdea => _projectIdeaBehaviour.sink.add;

  Function(String) get updateProjectImpression =>
      _projectImpressionBehaviour.sink.add;

  Function(String) get updateProjectTarget => _projectTargetBehaviour.sink.add;

  Function(String) get updateProjectPrice => _projectPriceBehaviour.sink.add;

  Function(String) get updateNotes => _projectNotesBehaviour.sink.add;

  void updatePreferredLanguage(RadioMapper item) =>
      _selectedPreferredLanguageBehaviour.sink.add(item);

  void updateProjectFiled(RadioMapper item) =>
      _selectedProjectFiledBehaviour.sink.add(item);

  void updateProjectPattern(RadioMapper item) =>
      _projectPatterBehaviour.sink.add(item);

  void updateProjectIdentityList(List<RadioMapper> list) =>
      _projectIdentityBehaviour.sink.add(list);

  Stream<bool> get validate => Rx.combineLatest9(
      nameStream,
      mobileStream,
      projectTypeStream,
      projectValuableStream,
      projectIdeaStream,
      projectImpressionStream,
      projectTargetStream,
      projectPriceStream,
      _projectIdentityBehaviour.stream,
      (name, mobile, type, valuable, idea, impression, target, price,
              identities) =>
          name.isNotEmpty &&
          mobile.isNotEmpty &&
          type.isNotEmpty &&
          valuable.isNotEmpty &&
          idea.isNotEmpty &&
          impression.isNotEmpty &&
          target.isNotEmpty &&
          price.isNotEmpty &&
          identities.isNotEmpty);

  @override
  void dispose() {
    _nameBehaviour.close();
    _mobileBehaviour.close();
    _projectTypeBehaviour.close();
    _selectedPreferredLanguageBehaviour.close();
    _selectedProjectFiledBehaviour.close();
    _projectValuableBehaviour.close();
    _projectIdeaBehaviour.close();
    _projectImpressionBehaviour.close();
    _projectTargetBehaviour.close();
    _projectPatterBehaviour.close();
    _projectIdentityBehaviour.close();
    _projectPriceBehaviour.close();
    _projectNotesBehaviour.close();
    buttonBehaviour.close();
  }

  void sendSMTP() async {
    // buttonBehaviour.sink.add(ButtonState.loading);
    // print(_getMailMessage());
    // buttonBehaviour.sink.add(ButtonState.success);
    try{
      buttonBehaviour.sink.add(ButtonState.loading);
      addHeaderToDio();
      await ApiClient(_dio).sendEmailFirstForm(SendEmailRequest(_getMailMessage()));
      buttonBehaviour.sink.add(ButtonState.success);
    }catch(e){
      print(e);
      buttonBehaviour.sink.add(ButtonState.fail);
    }
  }

  void addHeaderToDio() {
    _dio.options.headers["Authorization"] = _basicAuth;
  }

  String _getProjectIdentities() {
    String identities = "";
    for (var element in _projectIdentityBehaviour.valueOrNull!) {
      if (identities.isEmpty) {
        identities = "${element.label} - ";
      } else {
        identities += ' ${element.label} - ';
      }
    }
    return identities;
  }

  MimeMessage buildMessage() {
    final builder = MessageBuilder.prepareMultipartAlternativeMessage(
        plainText: _getMailMessage());
    return builder.buildMimeMessage();
  }

  String _getMailMessage() {
    return '$_nameText'
        '$_mobile'
        '$_projectType'
        '$_language'
        '$_projectFiled'
        '$_projectValuable'
        '$_projectIdea'
        '$_projectImpression'
        '$_projectTarget'
        '$_projectPattern'
        '$_projectIdentitiesText'
        '$_price'
        '$notes';
  }

  String get _nameText => 'الاسم: ${_nameBehaviour.value} \n';

  String get _mobile => 'رقم الجوال: ${_mobileBehaviour.valueOrNull} \n';

  String get _projectType =>
      ' اسم المشروع الخاص بي: ${_projectTypeBehaviour.valueOrNull} \n';

  String get _language =>
      'اللغة التي ارغب في استخدامها: ${_selectedPreferredLanguageBehaviour.valueOrNull!.label} \n';

  String get _projectFiled =>
      'مجال المشروع: ${_selectedProjectFiledBehaviour.valueOrNull!.label} \n';

  String get _projectValuable =>
      'القيم التي يتركز عليها المشروع الخاص بي: ${_projectValuableBehaviour.valueOrNull} \n';

  String get _projectIdea =>
      'فكره محدده اريد تطبيقها في علامتي التجارية: ${_projectIdeaBehaviour.valueOrNull} \n';

  String get _projectImpression =>
      'الانطباع الذي اريد ان توصلة العلامة التجارية: ${_projectImpressionBehaviour.valueOrNull} \n';

  String get _projectTarget =>
      'الفئات المستهدفة بالنسبة للمشروع الخاص بي: ${_projectTargetBehaviour.valueOrNull} \n';

  String get _projectPattern =>
      'نمط الشعار الذي افضلة: ${_projectPatterBehaviour.valueOrNull!.label} \n';

  String get _projectIdentitiesText =>
      'تطبيقات الهوية التي احتاجها: ${_getProjectIdentities()} \n';

  String get _price =>
      'الميزانية المخصصة لصناعة هوية مشروعي: ${_projectPriceBehaviour.valueOrNull} \n';

  String get notes =>
      'معلومات أخرى عن مشروعي: ${_projectNotesBehaviour.valueOrNull} \n';
}
