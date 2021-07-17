import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emprendej/models/usuario.dart';

class DatabaseService {
  //----------------------------------------------------------
  //--------------- VARIABLES Y CONSTRUCTOR ------------------
  //----------------------------------------------------------

  final String uid;
  DatabaseService({this.uid});

  //Colección que define la base de datos (No-SQL)
  final CollectionReference db = FirebaseFirestore.instance.collection('users');

  //----------------------------------------------------------
  //------------------------- STREAMS ------------------------
  //----------------------------------------------------------

  Stream<Usuario> get usuarioActual {
    return db.doc(uid).snapshots().map(_obtenerUsuarioDeSnapshot);
  }

  Usuario _obtenerUsuarioDeSnapshot(DocumentSnapshot snapshot) {
    return new Usuario(
      nombres: snapshot.data()['nombres'] ?? "",
      apellidos: snapshot.data()['apellidos'] ?? "",
      email: snapshot.data()['email'] ?? "",
      uid: snapshot.data()['uid'] ?? "",
    );
  }

  Stream<List<Usuario>> get usuarios {
    return db.snapshots().map(_obtenerListaUsuariosDeSnapshot);
  }

  List<Usuario> _obtenerListaUsuariosDeSnapshot(QuerySnapshot snapshot) {
    List<Usuario> a = snapshot.docs.map(
      (QueryDocumentSnapshot queryDocumentSnapshot) {
        return new Usuario(
          nombres: queryDocumentSnapshot.data()['nombres'] ?? "",
          apellidos: queryDocumentSnapshot.data()['apellidos'] ?? "",
          email: queryDocumentSnapshot.data()['email'] ?? "",
          uid: queryDocumentSnapshot.data()['uid'] ?? "",
        );
      },
    ).toList();
    return a;
  }

  //----------------------------------------------------------
  //----------------- FUNCIONES PRINCIPALES ------------------
  //----------------------------------------------------------

  Future<void> actualizarInformacionUsuario(String nombres, String apellidos, String email, String uid) async {
    return await db.doc(uid).set(
      {
        'nombres': nombres,
        'apellidos': apellidos,
        'email': email,
        'uid': uid,
      },
    );
  }

/*
  Future<Usuario> _obtenerUsuarioDeSnapshot(String uid) async {
    return await db.doc(uid).get().then(
      (DocumentSnapshot snapshot) {
        return new Usuario(
          nombres: snapshot.data()['nombres'],
          apellidos: snapshot.data()['apellidos'],
          email: snapshot.data()['email'],
          uid: uid,
        );
      },
    );
  }*/
}
