import 'package:chequeo_f_h/config/theme/app_theme.dart';
import 'package:chequeo_f_h/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        ///Seleccion del tema a usar
        theme: AppTheme(selectedColor: 0).getTheme(),

        ///Home Screen
        home: const HomeScreen());
  }
}
