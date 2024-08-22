import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:profile_task/provider/setting_provider.dart';
import 'package:profile_task/ui/screens/person_screen/person_screen.dart';
import 'package:profile_task/ui/uitiles/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => SettingProvider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget {
  MyApp({super.key});
  late SettingProvider provider;
  @override
  Widget build(BuildContext context) {
    provider= Provider.of(context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("en"), Locale("ar")],
      locale: Locale(provider.currentLocale),
      themeMode: provider.currentMode,
      /// تبع light mode
      theme:AppTheme.lightTheme,
      /// تبع dark mode
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        PerSonScreen.routeName:(_)=> PerSonScreen()
      },
      initialRoute: PerSonScreen.routeName,
    );
  }
}


