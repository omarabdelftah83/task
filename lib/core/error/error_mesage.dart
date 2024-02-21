import 'package:equatable/equatable.dart';

class ErrorMasage extends Equatable {
  final int stutesCode;
  final bool success;
  final String stutesMassage;

  const ErrorMasage(
      {required this.stutesCode,
      required this.success,
      required this.stutesMassage});

  factory ErrorMasage.fromJson(Map<String, dynamic> json) {
    return ErrorMasage(
        stutesCode: json['stutesCode'],
        success: json['success'],
        stutesMassage: json['stutesMassage)']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw [stutesCode, success, stutesMassage];
}
