import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:muslim_wallet/core/di/service_lacator.dart';
import 'package:muslim_wallet/core/theme/bloc/theme_bloc.dart';
import 'package:muslim_wallet/core/theme/theme.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      bloc: getIt<ThemeCubit>(),
      builder: (_, themeMode) {
        return MaterialApp(
          title: 'Muslim Wallet',
          themeMode: themeMode,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          home: MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final List<(String, ThemeMode)> _themes = const [
    ('Dark', ThemeMode.dark),
    ('Light', ThemeMode.light),
    ('System', ThemeMode.system),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change Theme')),
      body: Center(
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          bloc: getIt<ThemeCubit>(),
          builder: (context, selectedTheme) {
            return Column(
              children: List.generate(
                _themes.length,
                (index) {
                  final String label = _themes[index].$1;
                  final ThemeMode theme = _themes[index].$2;
                  return ListTile(
                    title: Text(label),
                    onTap: () => getIt<ThemeCubit>().updateTheme(theme),
                    trailing:
                        selectedTheme == theme ? const Icon(Icons.check) : null,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
