import 'package:comnow/controller/profileControllers/member_profile_controller.dart';
import 'package:comnow/controller/profileControllers/profile_controller.dart';
import 'package:comnow/utils/constant.dart';
import 'package:comnow/view/navBarScreen/admin_nav_bar_screen.dart';
import 'package:comnow/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'appLocalization/languages_translation.dart';
import 'controller/groupController/get_groups_controller.dart';
import 'utils/color_data.dart';
import 'view/widgets/widget_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  Constants.getRequiredDataForApis();


  ErrorWidget.builder = (FlutterErrorDetails details) => Material(
        color: Colors.red,
        child: Center(
          child: customWhiteMediumText(
            text: '${details.exception}',
            fontSize: 13.sp,
            textAlign: TextAlign.center,
          ),
        ),
      );

  Get.put(GetGroupsController(), tag: 'getGroupsController');
  Get.put(ProfileController(), tag: 'profileController');
  Get.put(MemberProfileController(), tag: 'memberProfileController');
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
            textSelectionTheme: const TextSelectionThemeData(
                cursorColor: CustomColors.blueButtonColor,
                selectionColor: CustomColors.blueButtonColor,
                selectionHandleColor: CustomColors.blueButtonColor),
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
          // home: const AdminBottomNavigationBarScreen(),
          home: const SplashScreen(),
        );
      },
    );
  }
}
