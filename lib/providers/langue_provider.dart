import 'package:flutter/material.dart';
import 'package:language_code/language_code.dart';

class LangueProvider extends ChangeNotifier {
  Locale _locale = LanguageCode.locale;
  Locale get locale => _locale;
  void setLocale(Locale newLocal) {
    _locale = newLocal;
    notifyListeners();
  }
}
