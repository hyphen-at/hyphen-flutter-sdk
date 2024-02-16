class HyphenSdkError implements Exception {
  const HyphenSdkError();

  String get message => '';

  static const NotInitialized notInitialized = NotInitialized._();
  static const ActivityDelegateRegistrationFailed
      activityDelegateRegistrationFailed =
      ActivityDelegateRegistrationFailed._();
  static const GoogleAuthError googleAuthError = GoogleAuthError._();
  static const Unauthorized unauthorized = Unauthorized._();
  static const TwoFactorDenied twoFactorDenied = TwoFactorDenied._();
  static const InternalSdkError internalSdkError = InternalSdkError._();
}

class NotInitialized extends HyphenSdkError {
  const NotInitialized._();

  @override
  String get message => 'SDK has not been properly initialized.';
}

class ActivityDelegateRegistrationFailed extends HyphenSdkError {
  const ActivityDelegateRegistrationFailed._();

  @override
  String get message =>
      'Activity does not implement HyphenAuthenticateDelegate.';
}

class GoogleAuthError extends HyphenSdkError {
  const GoogleAuthError._();

  @override
  String get message => 'Error in Google authentication process.';
}

class Unauthorized extends HyphenSdkError {
  const Unauthorized._();

  @override
  String get message => 'User is not authorized to perform this operation.';
}

class TwoFactorDenied extends HyphenSdkError {
  const TwoFactorDenied._();

  @override
  String get message => 'User denied the two-factor authentication request.';
}

class InternalSdkError extends HyphenSdkError {
  const InternalSdkError._();

  @override
  String get message => 'An internal SDK error occurred.';
}
