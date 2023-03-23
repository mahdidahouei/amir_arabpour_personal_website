import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

part 'app_localizations_delegate.dart';
part 'app_localizations_impl.dart';
part 'app_supported_locales.dart';

abstract class AppLocalizations {
  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations) ??
      _EmptyAppLocalizations();

  Locale get locale;

  /// Loads all of the translated strings from json file to dart map. it's called by flutter
  Future<void> load();

  /// Returns the translated string of given key.
  String translate(String key);

  String formatNumber(int number, [bool treeDigitsDivision = true]);

  Future<Map<String, String>> get richStringsFuture;

  Future<String> get privacyPolicyFuture;

  Future<String> get termsAndConditionsFuture;

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static Locale? localeResolutionCallback(
      Locale? locale, Iterable<Locale>? supportedLocales) {
    if (supportedLocales != null) {
      for (var supportedLocale in supportedLocales) {
        if (locale?.languageCode == supportedLocale.languageCode &&
            locale?.countryCode == supportedLocale.countryCode) {
          return supportedLocale;
        }
      }
    }
    return supportedLocales?.first;
  }

  /// All the required delegates for app
  static const delegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
}

class _EmptyAppLocalizations extends AppLocalizations {
  @override
  String translate(String key) => "NA";

  @override
  Future<void> load() {
    return Future(() {});
  }

  @override
  Locale get locale => Locale("", "");

  @override
  Future<Map<String, String>> get richStringsFuture =>
      Future<Map<String, String>>(
        () async => {},
      );

  @override
  String formatNumber(int number, [bool treeDigitsDivision = true]) {
    throw UnimplementedError();
  }

  @override
  Future<String> get privacyPolicyFuture => Future<String>(
        () async => "",
      );

  @override
  Future<String> get termsAndConditionsFuture => Future<String>(
        () async => "",
      );
}
