import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: "Lista PreUso",
      subTitle: "Modulo para realizar lista de preuso de su unidad",
      link: "/preuso",
      icon: Icons.check_box),
  MenuItem(
      title: "ARC",
      subTitle: "Modulo para realizar su Analisis de Riesgo Cargio",
      link: "/arc",
      icon: Icons.check_circle),
  MenuItem(
      title: "Biblioteca Virtual",
      subTitle: "Documentos M4",
      link: "/biblioteca",
      icon: Icons.check_box_sharp),
  MenuItem(
      title: "Usuarios",
      subTitle: "Usuarios M4",
      link: "/usuarios",
      icon: Icons.supervised_user_circle_sharp),
];
