part of models;

enum HomePageTab {
  contacts,
  chats,
  more,
}

@freezed
class RouterState with _$RouterState {
  const RouterState._();
  const factory RouterState.unknown() = Unknown;
  const factory RouterState.splash() = Splash;
  const factory RouterState.register() = Register;
  const factory RouterState.verifyOTP({required String phone}) = VerifyOTP;
  const factory RouterState.completeProfile() = CompleteProfile;
  const factory RouterState.home({required HomePageTab currentTab}) = Home;

  bool get isAuthorized => this is Home || this is CompleteProfile;
}
