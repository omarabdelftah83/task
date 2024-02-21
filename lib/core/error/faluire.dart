import 'package:equatable/equatable.dart';

abstract class Faluiare extends Equatable{
  final  String massege;

  const Faluiare(this.massege);

  @override
// TODO: implement props
  List<Object?> get props => throw [massege];
}


class ServerFaluiare extends Faluiare{
  const ServerFaluiare(super.massege);
}
