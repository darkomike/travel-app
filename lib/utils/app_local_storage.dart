import 'package:flutter/material.dart';

class AppLocalStorage {
  static AppLocalStorage _instance = AppLocalStorage._();
  AppLocalStorage._();

  factory AppLocalStorage() => _instance;

  @visibleForTesting
  static void reset() => _instance = AppLocalStorage._();
}
