import 'package:firebase_auth/firebase_auth.dart';

class Usuario {
  User user;
  String uid;
  String nombres;
  String apellidos;
  String email;

  Usuario({this.uid, this.nombres, this.apellidos, this.email});

  void setUser(User user) {
    this.user = user;
  }
}
