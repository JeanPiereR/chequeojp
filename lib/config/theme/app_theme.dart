import 'package:flutter/material.dart';

///Definicion de la lista de colores que soportara la App
const colorList = <Color>[
  Colors.black,
  Colors.green,
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.teal,
  Colors.blue,
  Colors.orange,
];

///Definicion de nuestra clase con las configuraciones para el tema
class AppTheme {
  final int selectedColor;

  ///Selecion de los colores
  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, "El color seleccionado debe ser >= 0"),
        assert(selectedColor < colorList.length,
            "El color seleccionado debe ser igual o menor a ${colorList.length}");

  ///Deifinicion del tema a usar
  ThemeData getTheme() =>
      ThemeData(useMaterial3: true, colorSchemeSeed: colorList[selectedColor]);
}
