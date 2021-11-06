part of models;

@freezed
class RouterState with _$RouterState {
  const RouterState._();
  const factory RouterState.unknown() = Unknown;
  const factory RouterState.splash() = Splash;
  const factory RouterState.register() = Register;
  const factory RouterState.home() = Home;
  
}
