import 'package:emprendej/screens/Autenticacion/Bienvenida/bienvenida.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Bienvenida();
    } else {
      //return Principal();
      return Bienvenida();
    }
  }
}
