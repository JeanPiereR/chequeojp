// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:chequeo_f_h/config/menu_items/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  ///Donde iniciara el sombreado de nuestro drawer
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    ///Reconocimiento del margen superior con el fin de una buena UX
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

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
          ///Linea divisora
          const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 10), child: Divider()),

          const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
              child: Text("Modulos")),

          ///Realizamos un mapero de appMenuItem y solo traemos el titulo
          ///con su icono
          ...appMenuItems
              .sublist(0,
                  3) //Este sublist permite ver la cantidad de modulos a mostrar
              .map(
                (item) => NavigationDrawerDestination(
                    icon: Icon(item.icon), label: Text(item.title)),
              ),

          ///Linea divisora
          const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 10), child: Divider()),

          const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
              child: Text("Log Out")),

          //TODO IMPLEMENTAR LOG OUT
        ]);
  }
}
