class FormValidators {
  static String? validateDocumentNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese su número de documento';
    }
    if (value.length != 8) {
      return 'El número de documento debe tener 8 dígitos';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'El documento solo puede contener números';
    }
    return null;
  }

  static String? validateCExtrajNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese su número de documento';
    }
    if (value.length != 12) {
      return 'El número de documento debe tener 12 dígitos';
    }
    // if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
    //   return 'El número de documento solo puede contener números';
    // }
    return null;
  }
}
