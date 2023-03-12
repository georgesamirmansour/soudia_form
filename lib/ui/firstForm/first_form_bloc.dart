import 'package:custom_progress_button/custom_progress.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:first_form/RadioMapper.dart';
import 'package:first_form/bases/bloc_base.dart';
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


  FirstFormBloc(){
    _nameBehaviour.sink.add("");
    _mobileBehaviour.sink.add("");
    _projectTypeBehaviour.sink.add("");
    _projectValuableBehaviour.sink.add('');
    _projectIdeaBehaviour.sink.add('');
    _projectImpressionBehaviour.sink.add('');
    _projectTargetBehaviour.sink.add('');
    _projectIdentityBehaviour.sink.add([]);
    _projectPriceBehaviour.sink.add('');
    _projectNotesBehaviour.sink.add('');
  }

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

   void sendSMTP() async{
    try{
      buttonBehaviour.sink.add(ButtonState.loading);
      await Mailer().sendEmail(_emailUserName, _emailUserName, _getMailMessage(), _emailUserName, '', 'errorMsg', 'successMsg');
      buttonBehaviour.sink.add(ButtonState.success);
    }catch(e){
      print(e);
      buttonBehaviour.sink.add(ButtonState.fail);
    }
  }
  Future<void> mailExample() async {
    print('discovering settings for  $_emailUserName...');
    final config = await Discover.discover(_emailUserName, forceSslConnection: false, isLogEnabled: false);
    if (config == null) {
      // note that you can also directly create an account when
      // you cannot auto-discover the settings:
      // Compare the [MailAccount.fromManualSettings]
      // and [MailAccount.fromManualSettingsWithAuth]
      // methods for details.
      print('Unable to auto-discover settings for $_emailUserName');
      return;
    }
    print('connecting to ${config.displayName}.');
    final account =
    MailAccount.fromDiscoveredSettings('my account', _emailUserName, "@#Apocalypse99", config);
    final mailClient = MailClient(account, isLogEnabled: true);
    try {
      await mailClient.connect();
      print('connected');
      // generate and send email:
      final mimeMessage = buildMessage();
      await mailClient.sendMessage(mimeMessage);
    } on MailException catch (e) {
      print('High level API failed with $e');
    }
  }


  final String _emailUserName = "george.samir.mansour@gmail.com";

  String _getProjectIdentities(){
    String identities = "";
    for (var element in _projectIdentityBehaviour.value) {
      if(identities.isNotEmpty) {
        identities = "${element.label}\n";
      }else {
        identities = element.label;
      }
    }
    return identities;
  }

  MimeMessage buildMessage() {
    final builder = MessageBuilder.prepareMultipartAlternativeMessage(
        plainText: _getMailMessage()
    );
    return builder.buildMimeMessage();

  }

  String _getMailMessage() {
    return '${_nameBehaviour.value}الاسم: '
          '${_mobileBehaviour.value}رقم الجوال: '
          '${_projectTypeBehaviour.value}المشروع الخاص بي: '
          '${_selectedPreferredLanguageBehaviour.value}اللغة التي ارغب في استخدامها: '
          '${_selectedProjectFiledBehaviour.value.label}مجال المشروع: '
          '${_projectValuableBehaviour.value}القيم التي يتركز عليها المشروع الخاص بي: '
          '${_projectIdeaBehaviour.value}فكره محدده اريد تطبيقها في علامتي التجارية: '
          '${_projectImpressionBehaviour.value}الانطباع الذي اريد ان توصلة العلامة التجارية: '
          '${_projectValuableBehaviour.value}الفئات المستهدفة بالنسبة للمشروع الخاص بي: '
          '${_projectPatterBehaviour.value.label}نمط الشعار الذي افضلة: '
          '${_getProjectIdentities()}تطبيقات الهوية التي احتاجها: '
          '${_projectPriceBehaviour.value}الميزانية المخصصة لصناعة هوية مشروعي: '
          '${_projectNotesBehaviour.value}معلومات أخرى عن مشروعك: ';
  }
}
