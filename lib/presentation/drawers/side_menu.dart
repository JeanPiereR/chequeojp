import 'package:chequeo_f_h/config/menu_items/menu_items.dart';
import 'package:flutter/material.dart';

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

    return NavigationDrawer(selectedIndex: navDrawerIndex, children: [
      ///Realizamos un mapero de appMenuItem y solo traemos el titulo
      ///con su icono
      ...appMenuItems.map(
        (item) => NavigationDrawerDestination(
            icon: Icon(item.icon), label: Text(item.title)),
      )
    ]);
  }
}
