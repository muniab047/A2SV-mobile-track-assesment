import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{}


class ServerFailure extends Failure {
  final String message;
  ServerFailure({this.message = 'Server Failure'});
  
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}


class CacheFailure extends Failure {
  final String message;
  CacheFailure({this.message = 'Cache Failure'});
  
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}