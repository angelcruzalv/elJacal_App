class ValidationMixins{
  String validateEmail(String value){
    if (!value.contains('@')) 
      return 'Email no valido';
    return null;
  }
  String validatePassword(String value){
    if (value.length<6) 
      return 'La contraseña debe tener más de 6 caracteres';
    return null;
  }

}