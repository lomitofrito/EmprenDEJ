import 'package:emprendej/screens/Autenticacion/SignUp/components/body.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  final Function toggleView;

  SignUp({this.toggleView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
