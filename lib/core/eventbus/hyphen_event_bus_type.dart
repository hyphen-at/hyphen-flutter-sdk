class HyphenEventBusType {
  const HyphenEventBusType();

  static const String show2FAWaitingProgressModalType = 'show2FAWaitingProgressModal';
  static const String twoFactorAuthDeniedType = 'twoFactorAuthDenied';
  static const String twoFactorAuthApprovedType = 'twoFactorAuthApproved';

  factory HyphenEventBusType.show2FAWaitingProgressModal(bool show) =>
      Show2FAWaitingProgressModal(show);
  factory HyphenEventBusType.twoFactorAuthDenied() => TwoFactorAuthDenied();
  factory HyphenEventBusType.twoFactorAuthApproved(String requestId) =>
      TwoFactorAuthApproved(requestId);
}

class Show2FAWaitingProgressModal extends HyphenEventBusType {
  final bool show;

  const Show2FAWaitingProgressModal(this.show);
}

class TwoFactorAuthDenied extends HyphenEventBusType {
  const TwoFactorAuthDenied();
}

class TwoFactorAuthApproved extends HyphenEventBusType {
  final String requestId;

  const TwoFactorAuthApproved(this.requestId);
}
