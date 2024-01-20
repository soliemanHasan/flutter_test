import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:base_project_v2/core/extensions/language_extensions/app_languages_extenstion.dart';
import 'package:base_project_v2/core/routes/app_routes.dart';
import 'package:base_project_v2/core/services/cache_storage_services.dart';
import 'package:base_project_v2/core/services/service_locator.dart';
import 'package:base_project_v2/core/themes/app_theme.dart';
import 'package:base_project_v2/core/translations/app_local.dart';
import 'package:base_project_v2/generated/l10n.dart';
import 'package:base_project_v2/modules/auth/presentation/blocs/app_config_bloc/app_config_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  ///todo: reject bad certificate
  WidgetsFlutterBinding.ensureInitialized();
  await CacheStorageServices.init();
  await ScreenUtil.ensureScreenSize();
  ServicesLocator().init();
  // HttpOverrides.global = MyHttpOverrides();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  //  await Firebase.initializeApp(
  //    options: DefaultFirebaseOptions.currentPlatform,
  //  );
  //  MobileAds.instance.initialize();
  //  final RemoteMessage? initialMessage =
  //      await FirebaseMessaging.instance.getInitialMessage();
  //  if (initialMessage != null) {

  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // final RemoteMessage? initialMessage;
  // late final AppController appController;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   systemNavigationBarColor: AppColors.primaryColor, // navigation bar color
    //   statusBarColor:  AppColors.primaryColor, // status bar color
    //   statusBarBrightness: Brightness.light,
    //   statusBarIconBrightness: Brightness.light,
    // ));
    // SystemUiOverlayStyle(statusBarColor: Colors.white);
    // CacheStorageServices().removeToken();
    return BlocProvider(
      create: (_) => sl<AppConfigBloc>(),
      child: ScreenUtilInit(
      designSize: const Size(428, 926),
          
          // child: MaterialApp.router(
          //   debugShowCheckedModeBanner: false,
          //   localizationsDelegates: const [
          //     S.delegate,
          //     GlobalMaterialLocalizations.delegate,
          //     GlobalWidgetsLocalizations.delegate,
          //     GlobalCupertinoLocalizations.delegate,
          //   ],
          //   supportedLocales: S.delegate.supportedLocales,
          //   locale: AppLocale().currentLanguage().locale,
          //   title: 'Base project v2',
          //   theme: AppTheme().lightTheme,
          //   darkTheme: AppTheme().lightTheme,
          //   routerConfig: AppRoutes.router,
          // ),
          builder: (_, child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: AppLocale().currentLanguage().locale,
           //   title: AppConstants.applicationName,
              // theme: AppTheme().lightTheme,
              // darkTheme: AppTheme().lightTheme,
              routerConfig: AppRoutes.router,
            );
          }
          ),
    );
    // return ScreenUtilInit(
    //   designSize: const Size(1080, 2400),
    //   builder: (ctx, child) => Obx(
    //     () => GetMaterialApp(
    //       initialBinding: InitialBinding(),
    //       title: AppConfigurations.applicationName,
    //       defaultTransition: Transition.cupertino,
    //       debugShowCheckedModeBanner: false,
    //       //theme
    //       theme: ThemeData.light().copyWith(
    //         primaryColor: AppColors.primaryColor,
    //         scaffoldBackgroundColor: Colors.white,
    //         appBarTheme: AppBarTheme(color: AppColors.primaryColor),
    //         colorScheme: ColorScheme.light(secondary: AppColors.secondaryColor),
    //         // accentColor: AppColors.secondaryColor,
    //       ),
    //       themeMode: ThemeMode.light,
    //       //localization
    //       localizationsDelegates: const [
    //         S.delegate,
    //         GlobalMaterialLocalizations.delegate,
    //         GlobalWidgetsLocalizations.delegate,
    //         GlobalCupertinoLocalizations.delegate,
    //       ],
    //       locale: appController.locale == 'en' ? const Locale('en') : const Locale('ar'),
    //       supportedLocales: S.delegate.supportedLocales,
    //       getPages: AppRouting.routes(),
    //     ),
    //   ),
    // );
  }
}
