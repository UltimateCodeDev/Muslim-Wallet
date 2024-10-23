import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:muslim_wallet/core/locale/app_localiztions.dart';

class LocalizationsCubit extends HydratedCubit<Locale> {
  LocalizationsCubit() : super(const Locale("ar")) {
    loadLanguage();
  }

  Future<void> changeLocale(Locale locale) async {
    emit(locale);
    await AppLocaliztions.setLocaleCode(locale.languageCode);
  }

  loadLanguage() async {
    final locale = await AppLocaliztions.getLocaleCode();
    emit(locale);
  }

  @override
  Locale? fromJson(Map<String, dynamic> json) {
    return Locale(json['locale']);
  }

  @override
  Map<String, dynamic>? toJson(Locale state) {
    return {'locale': state.languageCode};
  }
}
