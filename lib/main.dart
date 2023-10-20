import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mai_jo/model/station_model.dart';
import 'package:mai_jo/packages/views/cart/cart_page.dart';
import 'package:mai_jo/packages/views/favorites/favorites.dart';
import 'package:mai_jo/packages/views/home_page/homepage.dart';
import 'package:mai_jo/packages/views/all_station/nearby_station.dart';
import 'package:mai_jo/packages/views/more/more.dart';
import 'package:mai_jo/packages/views/spalash_screen/splash_screen.dart';
import 'package:mai_jo/packages/views/station_page/station_page.dart';
import 'package:mai_jo/packages/views/station_profile/station_proofile.dart';
import 'package:mai_jo/provider/authprovider.dart';
import 'package:mai_jo/provider/item_provider.dart';
import 'package:mai_jo/services/language/config/config_lang.dart';
import 'package:mai_jo/services/restart/restart_app.dart';
import 'package:mai_jo/services/routes/approutes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [ConfigLang.enLocale, ConfigLang.arLocale],
        path: ConfigLang.langPath,
        fallbackLocale: ConfigLang.enLocale,
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RestartApp(
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (ctx) => AuthProvider()),
                ChangeNotifierProvider(
                  create: (ctx) => DataProvider(),
                  child:
                      ChangeNotifierProvider(create: (ctx) => ItemProvider()),
                ), // هنا تم إضافة FavoritesModel
              ],
              child: MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                initialRoute: HomePageScreen.routename,
                routes: AppRoutes.routes,
                // home: MorePage(),
              ),
            );
          }),
    );
  }
}
