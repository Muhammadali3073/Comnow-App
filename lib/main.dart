import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'appLocalization/languages_translation.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  runApp(MyApp(
    selectedLanguage:
        sharedPreferences.getString('selectedLanguageCode') ?? 'en',
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.selectedLanguage});

  final String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          theme: ThemeData(
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          translations: Language(),
          locale: selectedLanguage == 'en'
              ? const Locale('en_US')
              : selectedLanguage == 'de'
                  ? const Locale('de_DE')
                  : selectedLanguage == 'es'
                      ? const Locale('es_ES')
                      : selectedLanguage == 'fr'
                          ? const Locale('fr_FR')
                          : const Locale('it_IT'),
          home: const SplashScreen(),
        );
      },
    );
  }
}
