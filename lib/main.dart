import 'package:emprendej/screens/wrapper.dart';
import 'package:emprendej/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aposento Alto Calle 90',
      theme: temaClaro,
      darkTheme: temaOscuro,
      //TODO - mientras no esta en producción
      //home: SplashPage(pantalla: Wrapper()),
      home: Wrapper(),
      //routes: rutas,
    );
  }

  //Tema Claro, se usa cuando se desactiva el modo oscuro
  final ThemeData temaClaro = ThemeData(
    //Se indica que el tema tiene un brillo luminoso/claro
    brightness: Brightness.light,
    primarySwatch: Colors.red,
  );

  //Tema Oscuro, se usa cuando se activa el modo oscuro
  final ThemeData temaOscuro = ThemeData(
    //Se indica que el tema tiene un brillo oscuro
    brightness: Brightness.dark,
    primarySwatch: Colors.red,
    accentColor: Colors.red,
  );
}
