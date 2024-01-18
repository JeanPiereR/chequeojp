import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Pantalla de edicion de dato, donde se inicia con un STLESW y se transforma en un
///consumerStatefulWidget, se asigna el ID de dato

class UserScreen extends ConsumerStatefulWidget {

  final String userId;

  const UserScreen({ super.key, required this.userId });

  @override
  UserScreenState createState() => UserScreenState();
}

class UserScreenState extends ConsumerState<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ediar Usuario"),
      ),
      body: Center(
        child: Text( widget.userId ) 
        ),
    );
  }
}