// ignore_for_file: overridden_fields

class AppException implements Exception {
  final String? errorMessage;

  const AppException({this.errorMessage});

}

class CacheException extends AppException {
  @override
  final String errorMessage;
  CacheException({required this.errorMessage})
      : super(errorMessage: errorMessage);
}


/// Exception thrown when Login login fails
class LoginException extends AppException {
  @override
  final String errorMessage;
  const LoginException({this.errorMessage = 'Failed to login'})
      : super(errorMessage: errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}

/// Exception thrown when the  user does not have an internet connection
class NoInternetException extends AppException {
  @override
  final String? errorMessage;
  const NoInternetException({this.errorMessage})
      : super(errorMessage: errorMessage);

  @override
  String toString() {
    //return AppLocalizations.instance!.translate('couldNotConnectToTheInternet');
    return "Could not connect to the internet";
  }
}


/// Exception thrown when there is an error thrown from the server
class ServerException extends AppException {
  @override
  final String errorMessage;
  const ServerException({required this.errorMessage})
      : super(errorMessage: errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}

/// Exception thrown when Signup fails
class RegistrationException extends AppException {
  @override
  final String errorMessage;
  const RegistrationException({required this.errorMessage})
      : super(errorMessage: errorMessage);
}

class ForgotPasswordException extends AppException {
  @override
  final String errorMessage;
  const ForgotPasswordException({required this.errorMessage})
      : super(errorMessage: errorMessage);
}

class ResetPasswordException extends AppException {
  @override
  final String errorMessage;
  const ResetPasswordException({required this.errorMessage})
      : super(errorMessage: errorMessage);
}



class UnknownException extends AppException {
  @override
  final String errorMessage;
  const UnknownException(this.errorMessage);
}

class UnknownPlatformException extends AppException {
  @override
  final String errorMessage;
  const UnknownPlatformException({required this.errorMessage});
}


