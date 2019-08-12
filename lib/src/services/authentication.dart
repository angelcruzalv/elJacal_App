import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/src/model/auth_requesto.dart';

class Authentication {
  final _auth = FirebaseAuth.instance;

  Future<AuthenticationRequest> createUser(
      {String email = "", String password = ""}) async {
    AuthenticationRequest authRequest = AuthenticationRequest();
    try {
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        authRequest.succes = true;
      }
    } catch (e) {
      _mapErrorMessage(authRequest, e.code);
    }
    return authRequest;
  }

  Future<AuthenticationRequest> signIn(
      {String email = "", String password = ""}) async {
    AuthenticationRequest authRequest = AuthenticationRequest();
    try {
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        authRequest.succes = true;
      }
    } catch (e) {
      _mapErrorMessage(authRequest, e.code);
    }
    return authRequest;
  }

  void signOut() {
    _auth.signOut();
  }

  void _mapErrorMessage(AuthenticationRequest authRequest, String code) {
    switch (code) {
      case 'ERROR_USER_NOT_FOUND':
        authRequest.errorMessage = 'Usuario no encontrado';
        break;
      case 'ERROR_WRONG_PASSWORD':
        authRequest.errorMessage = 'Contraseña incorrecta';
        break;
      case 'ERROR_NETWORK_REQUEST_FAILED':
        authRequest.errorMessage = 'Error en la red';
        break;
      case 'ERROR_MAIL_ALREADY_IN_USE':
        authRequest.errorMessage = 'El usuario ya ha sido registrado antes';
        break;
      case 'ERROR_INVALID_EMAIL':
        authRequest.errorMessage = 'Email inválido';
        break;
      default:
        authRequest.errorMessage = code;
    }
  }
}
