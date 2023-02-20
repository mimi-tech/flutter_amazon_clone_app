import 'package:amazon_clone_new/Util/colors.dart';
import 'package:amazon_clone_new/screens/loginScreen.dart';
import 'package:amazon_clone_new/screens/splashScreen.dart';
import 'package:amazon_clone_new/themes/light_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

Future<void> main() async {


  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor:kBlackColor));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (BuildContext context, child) => GetMaterialApp(

        useInheritedMediaQuery: true,
          onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.appName,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          title: 'Amazon clone',
          theme: CustomTheme.lightTheme(),
          home:  CustomAnimatedWidget(),


      ),
    );

  }
}
