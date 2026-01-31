// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( LoginEvent value)?  login,TResult Function( SignUpEvent value)?  signUp,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case LoginEvent() when login != null:
return login(_that);case SignUpEvent() when signUp != null:
return signUp(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( LoginEvent value)  login,required TResult Function( SignUpEvent value)  signUp,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case LoginEvent():
return login(_that);case SignUpEvent():
return signUp(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( LoginEvent value)?  login,TResult? Function( SignUpEvent value)?  signUp,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case LoginEvent() when login != null:
return login(_that);case SignUpEvent() when signUp != null:
return signUp(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  login,TResult Function( String imgUrl)?  signUp,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case LoginEvent() when login != null:
return login();case SignUpEvent() when signUp != null:
return signUp(_that.imgUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  login,required TResult Function( String imgUrl)  signUp,}) {final _that = this;
switch (_that) {
case _Started():
return started();case LoginEvent():
return login();case SignUpEvent():
return signUp(_that.imgUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  login,TResult? Function( String imgUrl)?  signUp,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case LoginEvent() when login != null:
return login();case SignUpEvent() when signUp != null:
return signUp(_that.imgUrl);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements AuthEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.started()';
}


}




/// @nodoc


class LoginEvent implements AuthEvent {
  const LoginEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.login()';
}


}




/// @nodoc


class SignUpEvent implements AuthEvent {
  const SignUpEvent({required this.imgUrl});
  

 final  String imgUrl;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpEventCopyWith<SignUpEvent> get copyWith => _$SignUpEventCopyWithImpl<SignUpEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpEvent&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl));
}


@override
int get hashCode => Object.hash(runtimeType,imgUrl);

@override
String toString() {
  return 'AuthEvent.signUp(imgUrl: $imgUrl)';
}


}

/// @nodoc
abstract mixin class $SignUpEventCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $SignUpEventCopyWith(SignUpEvent value, $Res Function(SignUpEvent) _then) = _$SignUpEventCopyWithImpl;
@useResult
$Res call({
 String imgUrl
});




}
/// @nodoc
class _$SignUpEventCopyWithImpl<$Res>
    implements $SignUpEventCopyWith<$Res> {
  _$SignUpEventCopyWithImpl(this._self, this._then);

  final SignUpEvent _self;
  final $Res Function(SignUpEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imgUrl = null,}) {
  return _then(SignUpEvent(
imgUrl: null == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
