import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zomoto_task/features/splash/splash_screen.dart';
import 'package:zomoto_task/routes/main_router.dart';
import 'package:zomoto_task/common/constants/colors.dart';
import 'package:zomoto_task/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const displayTextStyle = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 22,
      color: darkBlack,
    );
    const titleTextStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: darkBlack,
    );
    const labelTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: darkBlack,
    );
    const bodyTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: darkBlack,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "custom_font",
        textTheme: TextTheme(
          displayLarge: displayTextStyle,
          displayMedium: displayTextStyle.copyWith(
            fontSize: 20,
          ),
          displaySmall: displayTextStyle.copyWith(
            fontSize: 18,
          ),
          titleLarge: titleTextStyle,
          titleMedium: titleTextStyle.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
          titleSmall: titleTextStyle.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          labelLarge: labelTextStyle,
          labelMedium: labelTextStyle.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          labelSmall: labelTextStyle.copyWith(
            fontWeight: FontWeight.w500,
            letterSpacing: 0,
            fontSize: 14,
          ),
          bodyLarge: bodyTextStyle,
          bodyMedium: bodyTextStyle.copyWith(
            fontWeight: FontWeight.w300,
            fontSize: 16,
          ),
          bodySmall: bodyTextStyle.copyWith(
            fontWeight: FontWeight.w200,
            fontSize: 14,
          ),
        ),
        primarySwatch: primarySwatch,
        scaffoldBackgroundColor: white,
        primaryColor: primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: white,
          surfaceTintColor: white,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: white,
          surfaceTintColor: white,
        ),
        cardTheme: const CardTheme(
          color: white,
          surfaceTintColor: white,
        ),
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: primaryColor),
      ),
      home: const SplashScreen(),
      onGenerateRoute: generateRoute,
    );
  }
}
