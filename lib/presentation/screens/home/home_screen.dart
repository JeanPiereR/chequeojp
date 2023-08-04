// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:chequeo_f_h/config/menu_items/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check List y Biblioteca Virtual"),
      ),
      body: const _Home_View(),
    );
  }
}

class _Home_View extends StatelessWidget {
  const _Home_View();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

        ///El ListView se adaptara de forma automatica al N° de items
        itemCount: appMenuItems.length,

        ///Listado de modulos
        itemBuilder: (context, index) {
          final MenuItem = appMenuItems[index];

          return _customMenuTile(menuItem: MenuItem);
        });
  }
}

class _customMenuTile extends StatelessWidget {
  const _customMenuTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    ///Vista de nuestro Drawer
    return ListTile(
      ///Icono izquierdo
      leading: Icon(menuItem.icon, color: colors.primary),

      ///Flecha derecha
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.primary,
      ),

      ///Titulo
      title: Text(menuItem.title),

      ///Subtitulo
      subtitle: Text(menuItem.subTitle),

      ///Accion al presionar
      onTap: () {
        ///Establecemos que al presionar redireccione al Link del menuItem
        ///El .push permite el retroceder a una pantalla anterior
        context.push(menuItem.link);
      },
    );
  }
}
