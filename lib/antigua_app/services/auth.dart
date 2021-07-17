import 'package:emprendej/models/usuario.dart';
import 'package:emprendej/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //----------------------------------------------------------
  //--------------- VARIABLES Y CONSTRUCTOR ------------------
  //----------------------------------------------------------

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //----------------------------------------------------------
  //------------------------- STREAMS ------------------------
  //----------------------------------------------------------

  Stream<User> get user {
    return _auth.userChanges();
  }

  //----------------------------------------------------------
  //----------------- FUNCIONES PRINCIPALES ------------------
  //----------------------------------------------------------

  Future signInAnonimo() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      return _userAUsuario(userCredential.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return _userAUsuario(userCredential.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUpEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _inicializarDocumentosUsuario(userCredential.user);
      return _userAUsuario(userCredential.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //----------------------------------------------------------
  //------------------ FUNCIONES AUXILIARES ------------------
  //----------------------------------------------------------

  Future _inicializarDocumentosUsuario(User user) {
    return DatabaseService(uid: user.uid).actualizarInformacionUsuario(null, null, user.email, user.uid);
  }

  Usuario _userAUsuario(User user) {
    return new Usuario(uid: user.uid, apellidos: '', nombres: '', email: user.email);
  }
}
