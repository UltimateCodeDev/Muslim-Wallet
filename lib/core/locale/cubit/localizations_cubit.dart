import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:muslim_wallet/core/locale/app_localiztions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'localizations_state.dart';
part 'localizations_cubit.freezed.dart';

class LocalizationsCubit extends Cubit<LocalizationsState> {
  LocalizationsCubit() : super(LocalizationsState.initial()) {
    loadLanguage();
  }

  Future<void> changeLocale(Locale locale) async {
    emit(state.copyWith(locale: locale));
    await AppLocaliztions.setLocaleCode(locale.languageCode);
  }

  loadLanguage() async {
    final locale = await AppLocaliztions.getLocaleCode();
    emit(state.copyWith(locale: locale));
  }
}
