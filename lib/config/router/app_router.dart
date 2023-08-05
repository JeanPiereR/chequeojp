import 'package:chequeo_f_h/presentation/screens/ARC/arc_screen.dart';
import 'package:chequeo_f_h/presentation/screens/biblioteca/biblioteca_screen.dart';
import 'package:chequeo_f_h/presentation/screens/home/home_screen.dart';
import 'package:chequeo_f_h/presentation/screens/lista_preuso/preuso_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
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
  ],
);