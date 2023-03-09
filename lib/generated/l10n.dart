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
