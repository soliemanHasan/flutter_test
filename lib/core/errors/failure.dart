import 'package:base_project_v2/generated/l10n.dart';
import 'package:equatable/equatable.dart';

/// The [Failure] expresses failures in the application.
/// if an [Exception] occurs, the Excerption will be dealt with to turn one or more EXceptions into a Failure based on the application’s logic.
class Failure extends Equatable {
  final String message;
  final int? statusCode;
  const Failure(this.message, {this.statusCode});

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, {required super.statusCode});

  @override
  String toString() => '${statusCode ?? ''} $message';
}

class NoInternetFailure extends Failure {
  NoInternetFailure() : super(S.current.noInternetConnection);
}

//! un known Failure
class UnknownFailure extends Failure {
  UnknownFailure() : super(S.current.unexpectedError);
}

//!  app version is invalid
class ForceUpdateFailure extends Failure {
  ForceUpdateFailure() : super(S.current.forceUpdate);
}

//! app is under maintaince or check app version failed
class AppUnderMaintenanceFailure extends Failure {
  AppUnderMaintenanceFailure() : super(S.current.appUnderMaintenance);
}

//! refresh token is invalid
class SessionExpiredFailure extends Failure {
  SessionExpiredFailure() : super(S.current.sessionExpired);
}

//! can not parse response
class ParsingFailure extends Failure {
  final String parsingMessage;
  ParsingFailure({required this.parsingMessage})
      : super('${S.current.parseError}: ($parsingMessage)');
}
