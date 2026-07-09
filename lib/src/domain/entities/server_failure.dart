import 'failure.dart';

class ServerFailure extends Failure implements Exception {
  ServerFailure({required super.message});
}