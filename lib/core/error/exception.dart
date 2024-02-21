
import 'error_mesage.dart';

class ServerExcepion implements Exception{
  final  ErrorMasage errorMasage;
  const ServerExcepion({required this.errorMasage});

}