// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:chequeo_f_h/config/menu_items/menu_items.dart';
import 'package:chequeo_f_h/features/auth/presentation/providers/auth_provider.dart';
import 'package:chequeo_f_h/features/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

///Era un staful, pero al realizar el proceso de logout se cambio por
///consumerWidget
class SideMenu extends ConsumerStatefulWidget {
  const SideMenu({super.key});

  @override
  SideMenuState createState() => SideMenuState();
}

class SideMenuState extends ConsumerState<SideMenu> {
  ///Donde iniciara el sombreado de nuestro drawer
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    ///Reconocimiento del margen superior con el fin de una buena UX
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final textStyles = Theme.of(context).textTheme;

    return NavigationDrawer(
        selectedIndex: navDrawerIndex,

        ///Funcionalidad de navegacion de Drawer
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });
          final MenuItem = appMenuItems[value];
          context.push(MenuItem.link);
        },
        children: [

          Padding(
          padding: EdgeInsets.fromLTRB(20, hasNotch ? 0 : 20, 16, 0),
          child: Text('Saludos', style: textStyles.titleMedium ),
          ),

          Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 16, 10),
          child: Text('Tony Stark', style: textStyles.titleSmall ),
        ),

          ///Linea divisora
          const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 10), child: Divider()),

          const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
              child: Text("Modulos")),

          ///Realizamos un mapero de appMenuItem y solo traemos el titulo
          ///con su icono
          ...appMenuItems
              .sublist(0,4) //Este sublist permite ver la cantidad de modulos a mostrar
              .map(
                (item) => NavigationDrawerDestination(
                    icon: Icon(item.icon), label: Text(item.title)),
              ),

          ///Linea divisora
          const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 10), child: Divider()),

          const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
              child: Text("Mas Opciones")),

          

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:  CustomFilledButton(
              text: "Crear Cuenta",
              onPressed: () => context.push('/registro'),
              ),
            ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:  CustomFilledButton(
              text: "Cerrar sesión",
              onPressed: () {
                ref.read(authProvider.notifier).logout();
              },
              ),
            ),



          
        ]);
  }
}
