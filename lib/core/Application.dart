// ignore_for_file: constant_identifier_names, file_names,

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Important: DONT CHANGE THE FILE NAME EVER EVER EVER EVER
import '/router/app_router.gr.dart';
import 'lang/app_localizations.dart';

final appRouterProvider = Provider((ref) => AppRouter());

class Application {
  static final Application _application = Application._internal();
  factory Application() {
    return _application;
  }
  Application._internal();
  late AppLocalizations appTranslations;
  late AppRouter appRouter;
  //function to be invoked when changing the language
  LocaleChangeCallback? onLocaleChanged;

  List<Function(AppLocalizations)> callbaks = <Function(AppLocalizations)>[];
  void notifyOnLocaleChanged(AppLocalizations appTranslations) {
    this.appTranslations = appTranslations;
    // Log.pr("notifyOnLocaleChanged ${appTranslations.currentLanguage}");
    for (final item in callbaks) {
      item(appTranslations);
    }
  }

  void postDelayed({int milliseconds = 500, required VoidCallback callbak}) {
    Future.delayed(Duration(milliseconds: milliseconds), () {
      callbak();
    });
  }
}

Application application = Application();
typedef LocaleChangeCallback = void Function(Locale locale);
