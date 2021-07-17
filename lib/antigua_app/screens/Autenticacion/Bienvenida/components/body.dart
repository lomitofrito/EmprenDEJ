import 'package:emprendej/screens/Autenticacion/Login/login.dart';
import 'package:emprendej/screens/Autenticacion/SignUp/sign_up.dart';
import 'package:emprendej/screens/Autenticacion/components/boton_redondeado.dart';
import 'package:emprendej/shared/components/pantalla_fix.dart';
import 'package:emprendej/shared/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool login = false;
  bool register = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (login) {
      return Login();
    } else if (register) {
      return SignUp();
    } else {
      return PantallaFix(
        background: fondoBienvenida(),
        children: <Widget>[
          SizedBox(height: size.height * 0.25),
          SizedBox(
            width: size.width * 0.75,
            child: Image(image: AssetImage("assets/images/aacll80.png")),
          ),
          SizedBox(height: size.height * 0.25),
          BotonRedondeado(
            text: "REGISTRATE AHORA",
            color: ColorPrimarioClaro,
            textColor: Colors.white,
            onPressed: () {
              setState(() => register = true);
            },
          ),
          BotonRedondeado(
            text: "YA TENGO UNA CUENTA",
            color: ColorSecundarioClaro,
            textColor: Colors.black,
            onPressed: () {
              setState(() => login = true);
            },
          ),
        ],
      );
    }
  }
}

//Prueba
/*
class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return PantallaFix(
      background: fondoBienvenida(),
      children: <Widget>[
        SizedBox(height: size.height * 0.25),
        SizedBox(
          width: size.width * 0.75,
          child: Image(image: AssetImage("assets/images/aacll80.png")),
        ),
        SizedBox(height: size.height * 0.25),
        BotonRedondeado(
          text: "REGISTRATE AHORA",
          onPressed: () => Navigator.pushNamed(context, '/SignUp'),
          //enterSignUp(context),
        ),
        BotonRedondeado(
          text: "YA TENGO UNA CUENTA",
          color: ColorSecundarioClaro,
          textColor: Colors.black,
          onPressed: () => Navigator.pushNamed(context, '/Login'),
          //enterLogin(context),
        ),
      ],
    );
  }
}
*/
