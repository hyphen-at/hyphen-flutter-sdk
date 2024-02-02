class HyphenEventBusType {
    const HyphenEventBusType._();
  
    static const Show2FAWaitingProgressModal show2FAWaitingProgressModal = Show2FAWaitingProgressModal(false);
    static const TwoFactorAuthDenied twoFactorAuthDenied = TwoFactorAuthDenied();
    static const TwoFactorAuthApproved twoFactorAuthApproved = TwoFactorAuthApproved('');
  }
  
  class Show2FAWaitingProgressModal extends HyphenEventBusType {
    final bool show;
  
    const Show2FAWaitingProgressModal(this.show) : super._();
  }
  
  class TwoFactorAuthDenied extends HyphenEventBusType {
    const TwoFactorAuthDenied() : super._();
  }
  
  class TwoFactorAuthApproved extends HyphenEventBusType {
    final String requestId;
  
    const TwoFactorAuthApproved(this.requestId) : super._();
  }
  