// date_utils.dart

String getStateName(int stt) {
  switch (stt) {
    case 1:
      return 'Temprano';
    case 2:
      return 'Tardanza';
    case 3:
      return 'Descanso';
    default:
      return '';
  }
}
