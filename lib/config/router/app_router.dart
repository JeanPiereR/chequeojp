import 'package:chequeo_f_h/config/router/app_router_notifier.dart';
import 'package:chequeo_f_h/features/auth/presentation/screens/check_auth_status_screen.dart';
import 'package:chequeo_f_h/features/auth/presentation/screens/registro.dart';
import 'package:chequeo_f_h/features/auth/presentation/screens/screens.dart';
import 'package:chequeo_f_h/presentation/screens/ARC/arc_screen.dart';
import 'package:chequeo_f_h/presentation/screens/biblioteca/biblioteca_screen.dart';
import 'package:chequeo_f_h/presentation/screens/home/home_screen.dart';
import 'package:chequeo_f_h/presentation/screens/lista_preuso/preuso_screen.dart';
import 'package:chequeo_f_h/presentation/screens/usuarios/usuarios.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/providers/auth_provider.dart';


///Nuestro Go_Router tendra un sistema de proteccion de rutas
final goRouterProvider = Provider((ref) {
  ///Referencia a la proteccion de rutas
  final goRouterNotifier = ref.read(goRouteInformationProvider);

  // GoRouter configuration
  return GoRouter(
    ///Pagina inicial de la App
    initialLocation: "/splash",

    ///Proteccion de rutas
    refreshListenable: goRouterNotifier,

    routes: [

      GoRoute(
        path: '/splash',
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),

      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),

      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),

      GoRoute(
        path: '/preuso',
        builder: (context, state) => const PreusoScreen(),
      ),

      GoRoute(
        path: '/arc',
        builder: (context, state) => const ArcScreen(),
      ),

      GoRoute(
        path: '/biblioteca',
        builder: (context, state) => const BibliotecaScreen(),
      ),

      GoRoute(
        path: '/usuarios',
        builder: (context, state) => const UsersScreen(),
      ),

      GoRoute(
      path: '/registro',
      builder: (context, state) => const RegisterPage(),
      ),

    ],



    redirect: (context, state) {
      
      final isGoingTo = state.subloc;
      final authStatus = goRouterNotifier.authStatus;

      if ( isGoingTo == '/splash' && authStatus == AuthStatus.checkin ) return null;

      if ( authStatus == AuthStatus.notAuthenticated ) {
        if ( isGoingTo == '/login') return null;

        return '/login';
      }

      if ( authStatus == AuthStatus.authenticated ) {
        if ( isGoingTo == '/login' || isGoingTo == '/register' || isGoingTo == '/splash' ){
          return '/';
        }
      }

      return null;
    },
  );

});
