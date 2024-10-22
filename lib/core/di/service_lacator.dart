import 'package:get_it/get_it.dart';
import 'package:muslim_wallet/core/theme/bloc/theme_bloc.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() async {
    getIt.registerLazySingleton(() => ThemeCubit());
  }
}
