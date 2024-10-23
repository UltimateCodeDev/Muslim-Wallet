import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:muslim_wallet/core/di/service_lacator.dart';
import 'package:muslim_wallet/core/locale/app_localiztions.dart';
import 'package:muslim_wallet/core/locale/cubit/localizations_cubit.dart';
import 'package:muslim_wallet/core/theme/bloc/theme_bloc.dart';
import 'package:muslim_wallet/core/theme/theme.dart';
import 'package:muslim_wallet/features/onboarding/pre/view/onboarding_screen.dart';
import 'package:path_provider/path_provider.dart';

import 'core/bloc/bloc_observer.dart';
import 'core/routing/app_routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  Bloc.observer = MyBlocObserver();
  ServiceLocator().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appRouter = AppRouter();
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationsCubit, Locale>(
      bloc: getIt<LocalizationsCubit>(),
      builder: (context, locale) {
        return BlocBuilder<ThemeCubit, ThemeMode>(
          bloc: getIt<ThemeCubit>(),
          builder: (_, themeMode) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                locale: locale,
                supportedLocales: const [Locale('en'), Locale('ar')],
                localizationsDelegates: const [
                  AppLocaliztions.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                title: 'Muslim Wallet',
                themeMode: themeMode,
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                home: OnboardingScreen());
          },
        );
      },
    );
  }
}
