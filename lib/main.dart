import 'package:chequeo_f_h/config/router/app_router.dart';
import 'package:chequeo_f_h/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(

      ///Integracion de Riverpod
      const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ///Anexamos nuestro MaterialApp con go_router
    return MaterialApp.router(
      ///Incluimos el sistema de rutas
      routerConfig: appRouter,

      debugShowCheckedModeBanner: false,

      ///Seleccion del tema a usar
      theme: AppTheme(selectedColor: 5).getTheme(),
    );
  }
}
