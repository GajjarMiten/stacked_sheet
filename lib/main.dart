import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_sheet/layers/config/globals.dart';
import 'package:stacked_sheet/layers/presentation/core/app_theme.dart';
import 'package:stacked_sheet/layers/presentation/shared/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      child: MaterialApp.router(
        routerConfig: navigator.allRoutes,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: appTheme.secondaryColor),
          useMaterial3: true,
          textTheme: GoogleFonts.robotoTextTheme(),
        ),
      ),
    );
  }
}
