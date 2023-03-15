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

  /// `يرجى إرسال كافة البيانات والمعلومات الخاصة بالمصنع من`
  String get allDataAndInfo {
    return Intl.message(
      'يرجى إرسال كافة البيانات والمعلومات الخاصة بالمصنع من',
      name: 'allDataAndInfo',
      desc: '',
      args: [],
    );
  }

  /// `اللوجو والشعار اللفظي`
  String get logo {
    return Intl.message(
      'اللوجو والشعار اللفظي',
      name: 'logo',
      desc: '',
      args: [],
    );
  }

  /// `المواقع الالكترونيه الخاصه بالموقع`
  String get websiteSite {
    return Intl.message(
      'المواقع الالكترونيه الخاصه بالموقع',
      name: 'websiteSite',
      desc: '',
      args: [],
    );
  }

  /// `بيانات التواصل`
  String get contactInformation {
    return Intl.message(
      'بيانات التواصل',
      name: 'contactInformation',
      desc: '',
      args: [],
    );
  }

  /// `الرؤيه المستقبليه`
  String get futureVision {
    return Intl.message(
      'الرؤيه المستقبليه',
      name: 'futureVision',
      desc: '',
      args: [],
    );
  }

  /// `ما السبب فى تسمية هذا البراند(ان وجد)؟`
  String get namingBrand {
    return Intl.message(
      'ما السبب فى تسمية هذا البراند(ان وجد)؟',
      name: 'namingBrand',
      desc: '',
      args: [],
    );
  }

  /// `ماهى المشكلات التى تعتبر الخدمه/المنتج وسيله لحلها ؟`
  String get problemsSolve {
    return Intl.message(
      'ماهى المشكلات التى تعتبر الخدمه/المنتج وسيله لحلها ؟',
      name: 'problemsSolve',
      desc: '',
      args: [],
    );
  }

  /// `ماهى الميزه التنافسيه للمصنع؟`
  String get advantageFactory {
    return Intl.message(
      'ماهى الميزه التنافسيه للمصنع؟',
      name: 'advantageFactory',
      desc: '',
      args: [],
    );
  }

  /// `اسماء خمسة منافسين؟`
  String get fiveCompetitors {
    return Intl.message(
      'اسماء خمسة منافسين؟',
      name: 'fiveCompetitors',
      desc: '',
      args: [],
    );
  }

  /// `ماهى الاهداف الرئيسيه المراد تحقيقها من الحملات التسويقيه؟`
  String get mainGoals {
    return Intl.message(
      'ماهى الاهداف الرئيسيه المراد تحقيقها من الحملات التسويقيه؟',
      name: 'mainGoals',
      desc: '',
      args: [],
    );
  }

  /// `كيف كانت تجربة التعامل مع المؤسسات من حيث (نقاط القوه والضعف والتاثير على العلامه التجاريه بالايجاب او السلب)؟`
  String get brandPositivelyNegatively {
    return Intl.message(
      'كيف كانت تجربة التعامل مع المؤسسات من حيث (نقاط القوه والضعف والتاثير على العلامه التجاريه بالايجاب او السلب)؟',
      name: 'brandPositivelyNegatively',
      desc: '',
      args: [],
    );
  }

  /// `ماهى مخاوف العميل عند شراء هذا النوع من الخدمات/المنتجات؟`
  String get customerConcerns {
    return Intl.message(
      'ماهى مخاوف العميل عند شراء هذا النوع من الخدمات/المنتجات؟',
      name: 'customerConcerns',
      desc: '',
      args: [],
    );
  }

  /// `ماهى احتياجات العميل عند شراء هذا النوع من الخدمات/المنتجات؟`
  String get customerNeeds {
    return Intl.message(
      'ماهى احتياجات العميل عند شراء هذا النوع من الخدمات/المنتجات؟',
      name: 'customerNeeds',
      desc: '',
      args: [],
    );
  }

  /// `وصف مختصر للشريحه العملاء الرئيسيه التى اشترت الخدمه/المنتج فعلياً من قبل؟`
  String get briefDescription {
    return Intl.message(
      'وصف مختصر للشريحه العملاء الرئيسيه التى اشترت الخدمه/المنتج فعلياً من قبل؟',
      name: 'briefDescription',
      desc: '',
      args: [],
    );
  }

  /// `ماهى نقاط القوه الخاصه بالمصنع؟`
  String get strengthsFactory {
    return Intl.message(
      'ماهى نقاط القوه الخاصه بالمصنع؟',
      name: 'strengthsFactory',
      desc: '',
      args: [],
    );
  }

  /// `ماهى نقاط الضعف الخاصه بالمصنع؟`
  String get weaknessesFactory {
    return Intl.message(
      'ماهى نقاط الضعف الخاصه بالمصنع؟',
      name: 'weaknessesFactory',
      desc: '',
      args: [],
    );
  }

  /// `سحب و افلات`
  String get dragOrDrop {
    return Intl.message(
      'سحب و افلات',
      name: 'dragOrDrop',
      desc: '',
      args: [],
    );
  }

  /// `أو`
  String get or {
    return Intl.message(
      'أو',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `تصفح ملفات`
  String get browse {
    return Intl.message(
      'تصفح ملفات',
      name: 'browse',
      desc: '',
      args: [],
    );
  }

  /// `الملف التعريفي أو البروشور الخاص بالشركة إن وجد`
  String get profile {
    return Intl.message(
      'الملف التعريفي أو البروشور الخاص بالشركة إن وجد',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `كافة الصور الخاصة بالمنتجات`
  String get productsPhotos {
    return Intl.message(
      'كافة الصور الخاصة بالمنتجات',
      name: 'productsPhotos',
      desc: '',
      args: [],
    );
  }

  /// `الشركاء – العملاء`
  String get clients {
    return Intl.message(
      'الشركاء – العملاء',
      name: 'clients',
      desc: '',
      args: [],
    );
  }

  /// `هل تعاملت مع مؤسسات/ أفراد للتسويق من قبل؟`
  String get foundation {
    return Intl.message(
      'هل تعاملت مع مؤسسات/ أفراد للتسويق من قبل؟',
      name: 'foundation',
      desc: '',
      args: [],
    );
  }

  /// `نعم`
  String get yes {
    return Intl.message(
      'نعم',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `لا`
  String get no {
    return Intl.message(
      'لا',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `تحميل`
  String get loading {
    return Intl.message(
      'تحميل',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `لاتوجد بيانات`
  String get noDataFound {
    return Intl.message(
      'لاتوجد بيانات',
      name: 'noDataFound',
      desc: '',
      args: [],
    );
  }

  /// `النجاح`
  String get success {
    return Intl.message(
      'النجاح',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل`
  String get register {
    return Intl.message(
      'تسجيل',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `مطلوب`
  String get required {
    return Intl.message(
      'مطلوب',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `موافق`
  String get ok {
    return Intl.message(
      'موافق',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `خطأ`
  String get error {
    return Intl.message(
      'خطأ',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `تم التسجيل بنجاح`
  String get registerDone {
    return Intl.message(
      'تم التسجيل بنجاح',
      name: 'registerDone',
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
