// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `إتصل بنا`
  String get callUs {
    return Intl.message(
      'إتصل بنا',
      name: 'callUs',
      desc: '',
      args: [],
    );
  }

  /// `نشكركم على ثقتكم العالية\nونتشرف بتقديم كل ما هو\nمناسب ومميز وعبقري في\nصناعة الهوية المرئية.`
  String get thanksForTrustInUs {
    return Intl.message(
      'نشكركم على ثقتكم العالية\nونتشرف بتقديم كل ما هو\nمناسب ومميز وعبقري في\nصناعة الهوية المرئية.',
      name: 'thanksForTrustInUs',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني`
  String get email {
    return Intl.message(
      'البريد الإلكتروني',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `العنوان`
  String get address {
    return Intl.message(
      'العنوان',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `نحن معاً نستحق.. فـــلنتشارك`
  String get addressHeaderText {
    return Intl.message(
      'نحن معاً نستحق.. فـــلنتشارك',
      name: 'addressHeaderText',
      desc: '',
      args: [],
    );
  }

  /// `التواصل`
  String get contactUs {
    return Intl.message(
      'التواصل',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `شارع اسحق التقادي - الشاطئ ، جدة 23613 المملكة العربية السعودية..........`
  String get addressInfo {
    return Intl.message(
      'شارع اسحق التقادي - الشاطئ ، جدة 23613 المملكة العربية السعودية..........',
      name: 'addressInfo',
      desc: '',
      args: [],
    );
  }

  /// `الاسم`
  String get name {
    return Intl.message(
      'الاسم',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `رقم الجوال`
  String get mobile {
    return Intl.message(
      'رقم الجوال',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `ما هو اسم المشروع الخاص بك؟`
  String get projectType {
    return Intl.message(
      'ما هو اسم المشروع الخاص بك؟',
      name: 'projectType',
      desc: '',
      args: [],
    );
  }

  /// `ما هي اللغة التي ترغب في استخدامها؟`
  String get projectLanguageType {
    return Intl.message(
      'ما هي اللغة التي ترغب في استخدامها؟',
      name: 'projectLanguageType',
      desc: '',
      args: [],
    );
  }

  /// `اللغة العربية`
  String get arabicLanguage {
    return Intl.message(
      'اللغة العربية',
      name: 'arabicLanguage',
      desc: '',
      args: [],
    );
  }

  /// `اللغة الانجليزية`
  String get englishLanguage {
    return Intl.message(
      'اللغة الانجليزية',
      name: 'englishLanguage',
      desc: '',
      args: [],
    );
  }

  /// `لغة أخرى`
  String get otherLanguage {
    return Intl.message(
      'لغة أخرى',
      name: 'otherLanguage',
      desc: '',
      args: [],
    );
  }

  /// `ما هو مجال المشروع الخاص بك؟`
  String get projectSubject {
    return Intl.message(
      'ما هو مجال المشروع الخاص بك؟',
      name: 'projectSubject',
      desc: '',
      args: [],
    );
  }

  /// `يجب ملئ هذه الخانه`
  String get required {
    return Intl.message(
      'يجب ملئ هذه الخانه',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `تجاري`
  String get commercial {
    return Intl.message(
      'تجاري',
      name: 'commercial',
      desc: '',
      args: [],
    );
  }

  /// `صناعي`
  String get industrial {
    return Intl.message(
      'صناعي',
      name: 'industrial',
      desc: '',
      args: [],
    );
  }

  /// `تعليمي`
  String get educational {
    return Intl.message(
      'تعليمي',
      name: 'educational',
      desc: '',
      args: [],
    );
  }

  /// `إعلامي`
  String get informative {
    return Intl.message(
      'إعلامي',
      name: 'informative',
      desc: '',
      args: [],
    );
  }

  /// `تسويقي`
  String get marketing {
    return Intl.message(
      'تسويقي',
      name: 'marketing',
      desc: '',
      args: [],
    );
  }

  /// `خدمي`
  String get servicing {
    return Intl.message(
      'خدمي',
      name: 'servicing',
      desc: '',
      args: [],
    );
  }

  /// `ما هي القيم التي يرتكز عليها المشروع الخاص بك؟`
  String get projectValuable {
    return Intl.message(
      'ما هي القيم التي يرتكز عليها المشروع الخاص بك؟',
      name: 'projectValuable',
      desc: '',
      args: [],
    );
  }

  /// `هل لديك فكرة محددة تريد تطبيقها في علامتك التجارية؟`
  String get projectIdea {
    return Intl.message(
      'هل لديك فكرة محددة تريد تطبيقها في علامتك التجارية؟',
      name: 'projectIdea',
      desc: '',
      args: [],
    );
  }

  /// `ما هو الانطباع الذي تريد أن توصله علامتك التجارية؟`
  String get projectImpression {
    return Intl.message(
      'ما هو الانطباع الذي تريد أن توصله علامتك التجارية؟',
      name: 'projectImpression',
      desc: '',
      args: [],
    );
  }

  /// `ما هي الفئات المستهدفة بالنسبة للمشروع الخاص بك؟`
  String get projectTarget {
    return Intl.message(
      'ما هي الفئات المستهدفة بالنسبة للمشروع الخاص بك؟',
      name: 'projectTarget',
      desc: '',
      args: [],
    );
  }

  /// `ما هو نمط الشعار الذي تفضله؟`
  String get projectLogo {
    return Intl.message(
      'ما هو نمط الشعار الذي تفضله؟',
      name: 'projectLogo',
      desc: '',
      args: [],
    );
  }

  /// `ديناميكي`
  String get dynamic {
    return Intl.message(
      'ديناميكي',
      name: 'dynamic',
      desc: '',
      args: [],
    );
  }

  /// `خطي`
  String get linear {
    return Intl.message(
      'خطي',
      name: 'linear',
      desc: '',
      args: [],
    );
  }

  /// `نصي`
  String get textual {
    return Intl.message(
      'نصي',
      name: 'textual',
      desc: '',
      args: [],
    );
  }

  /// `رمزي – كاركتر`
  String get character {
    return Intl.message(
      'رمزي – كاركتر',
      name: 'character',
      desc: '',
      args: [],
    );
  }

  /// `مزيج – مختلط`
  String get mixed {
    return Intl.message(
      'مزيج – مختلط',
      name: 'mixed',
      desc: '',
      args: [],
    );
  }

  /// `ما هي تطبيقات الهوية التي تحتاجها؟`
  String get projectIdentity {
    return Intl.message(
      'ما هي تطبيقات الهوية التي تحتاجها؟',
      name: 'projectIdentity',
      desc: '',
      args: [],
    );
  }

  /// `الكروت الشخصية`
  String get personalCard {
    return Intl.message(
      'الكروت الشخصية',
      name: 'personalCard',
      desc: '',
      args: [],
    );
  }

  /// `أظرف مختلفة\nالحجم`
  String get envelopesOfDifferentSize {
    return Intl.message(
      'أظرف مختلفة\nالحجم',
      name: 'envelopesOfDifferentSize',
      desc: '',
      args: [],
    );
  }

  /// `ملف الأوراق`
  String get paperFile {
    return Intl.message(
      'ملف الأوراق',
      name: 'paperFile',
      desc: '',
      args: [],
    );
  }

  /// `أكياس ورقية`
  String get paperPages {
    return Intl.message(
      'أكياس ورقية',
      name: 'paperPages',
      desc: '',
      args: [],
    );
  }

  /// `دفتر الملاحظات\nوأقلام`
  String get noteBooksAndPens {
    return Intl.message(
      'دفتر الملاحظات\nوأقلام',
      name: 'noteBooksAndPens',
      desc: '',
      args: [],
    );
  }

  /// `رول آب`
  String get rollUp {
    return Intl.message(
      'رول آب',
      name: 'rollUp',
      desc: '',
      args: [],
    );
  }

  /// `الملف التعريفي`
  String get profile {
    return Intl.message(
      'الملف التعريفي',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `كتيب دليل\nالهوي التجارية`
  String get businessIdentityHandBook {
    return Intl.message(
      'كتيب دليل\nالهوي التجارية',
      name: 'businessIdentityHandBook',
      desc: '',
      args: [],
    );
  }

  /// `قوالب عروض\nالبوربوينت`
  String get powerPointPresentationTemplates {
    return Intl.message(
      'قوالب عروض\nالبوربوينت',
      name: 'powerPointPresentationTemplates',
      desc: '',
      args: [],
    );
  }

  /// `تصميم مواقع\nالتواصل الاجتماعي`
  String get designOfCommunicationSitesSocial {
    return Intl.message(
      'تصميم مواقع\nالتواصل الاجتماعي',
      name: 'designOfCommunicationSitesSocial',
      desc: '',
      args: [],
    );
  }

  /// `تصميم الموقع\nالإلكتروني`
  String get webSiteDesign {
    return Intl.message(
      'تصميم الموقع\nالإلكتروني',
      name: 'webSiteDesign',
      desc: '',
      args: [],
    );
  }

  /// `تصميم اللافتات`
  String get signageDesign {
    return Intl.message(
      'تصميم اللافتات',
      name: 'signageDesign',
      desc: '',
      args: [],
    );
  }

  /// `الملابس`
  String get clothes {
    return Intl.message(
      'الملابس',
      name: 'clothes',
      desc: '',
      args: [],
    );
  }

  /// `السيارات`
  String get cars {
    return Intl.message(
      'السيارات',
      name: 'cars',
      desc: '',
      args: [],
    );
  }

  /// `ما هي الميزانية المخصصة لصناعة هوية مشروعك؟`
  String get projectPrice {
    return Intl.message(
      'ما هي الميزانية المخصصة لصناعة هوية مشروعك؟',
      name: 'projectPrice',
      desc: '',
      args: [],
    );
  }

  /// `في حالة وجود معلومات أخرى عن مشروعك ، يرجى ذكرها هنا.`
  String get projectNotes {
    return Intl.message(
      'في حالة وجود معلومات أخرى عن مشروعك ، يرجى ذكرها هنا.',
      name: 'projectNotes',
      desc: '',
      args: [],
    );
  }

  /// `تم`
  String get success {
    return Intl.message(
      'تم',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `جاري الارسال`
  String get loading {
    return Intl.message(
      'جاري الارسال',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد بيانات`
  String get noDataFound {
    return Intl.message(
      'لا توجد بيانات',
      name: 'noDataFound',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل`
  String get send {
    return Intl.message(
      'تسجيل',
      name: 'send',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
