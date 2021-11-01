// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of models;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RouterStateTearOff {
  const _$RouterStateTearOff();

  Unknown unknown() {
    return const Unknown();
  }

  Home home() {
    return const Home();
  }
}

/// @nodoc
const $RouterState = _$RouterStateTearOff();

/// @nodoc
mixin _$RouterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() home,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? home,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unknown value) unknown,
    required TResult Function(Home value) home,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(Home value)? home,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouterStateCopyWith<$Res> {
  factory $RouterStateCopyWith(
          RouterState value, $Res Function(RouterState) then) =
      _$RouterStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RouterStateCopyWithImpl<$Res> implements $RouterStateCopyWith<$Res> {
  _$RouterStateCopyWithImpl(this._value, this._then);

  final RouterState _value;
  // ignore: unused_field
  final $Res Function(RouterState) _then;
}

/// @nodoc
abstract class $UnknownCopyWith<$Res> {
  factory $UnknownCopyWith(Unknown value, $Res Function(Unknown) then) =
      _$UnknownCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnknownCopyWithImpl<$Res> extends _$RouterStateCopyWithImpl<$Res>
    implements $UnknownCopyWith<$Res> {
  _$UnknownCopyWithImpl(Unknown _value, $Res Function(Unknown) _then)
      : super(_value, (v) => _then(v as Unknown));

  @override
  Unknown get _value => super._value as Unknown;
}

/// @nodoc
class _$Unknown extends Unknown {
  const _$Unknown() : super._();

  @override
  String toString() {
    return 'RouterState.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Unknown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() home,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? home,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unknown value) unknown,
    required TResult Function(Home value) home,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(Home value)? home,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class Unknown extends RouterState {
  const factory Unknown() = _$Unknown;
  const Unknown._() : super._();
}

/// @nodoc
abstract class $HomeCopyWith<$Res> {
  factory $HomeCopyWith(Home value, $Res Function(Home) then) =
      _$HomeCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeCopyWithImpl<$Res> extends _$RouterStateCopyWithImpl<$Res>
    implements $HomeCopyWith<$Res> {
  _$HomeCopyWithImpl(Home _value, $Res Function(Home) _then)
      : super(_value, (v) => _then(v as Home));

  @override
  Home get _value => super._value as Home;
}

/// @nodoc
class _$Home extends Home {
  const _$Home() : super._();

  @override
  String toString() {
    return 'RouterState.home()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Home);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() home,
  }) {
    return home();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? home,
    required TResult orElse(),
  }) {
    if (home != null) {
      return home();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unknown value) unknown,
    required TResult Function(Home value) home,
  }) {
    return home(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(Home value)? home,
    required TResult orElse(),
  }) {
    if (home != null) {
      return home(this);
    }
    return orElse();
  }
}

abstract class Home extends RouterState {
  const factory Home() = _$Home;
  const Home._() : super._();
}
