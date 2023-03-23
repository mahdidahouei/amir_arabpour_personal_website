import 'package:amirarabpour/src/ui/global/bloc/theme_switcher_cubit/theme_switcher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/global/localizations/app_localizations.dart';
import 'ui/global/themes/themes.dart';
import 'ui/pages/landing_page/landing_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeSwitcherCubit _themeSwitcherCubit;

  @override
  void initState() {
    super.initState();
    _themeSwitcherCubit = ThemeSwitcherCubit();
  }

  @override
  void dispose() {
    _themeSwitcherCubit.close();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _themeSwitcherCubit,
      child: BlocBuilder<ThemeSwitcherCubit, ThemeSwitcherState>(
        bloc: _themeSwitcherCubit,
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            builder: (context, app) {
              return app!;
            },
            theme: state.appTheme == MyAppThemes.light
                ? AppThemes.light
                : AppThemes.dark,
            supportedLocales: AppSupportedLocales.all,
            localizationsDelegates: AppLocalizations.delegates,
            localeResolutionCallback: AppLocalizations.localeResolutionCallback,
            home: const LandingPage(),
          );
        },
      ),
    );
  }
}
