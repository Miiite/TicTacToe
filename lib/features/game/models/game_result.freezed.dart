// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameResult()';
}


}

/// @nodoc
class $GameResultCopyWith<$Res>  {
$GameResultCopyWith(GameResult _, $Res Function(GameResult) __);
}


/// Adds pattern-matching-related methods to [GameResult].
extension GameResultPatterns on GameResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Draw value)?  draw,TResult Function( _Winner value)?  winner,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Draw() when draw != null:
return draw(_that);case _Winner() when winner != null:
return winner(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Draw value)  draw,required TResult Function( _Winner value)  winner,}){
final _that = this;
switch (_that) {
case _Draw():
return draw(_that);case _Winner():
return winner(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Draw value)?  draw,TResult? Function( _Winner value)?  winner,}){
final _that = this;
switch (_that) {
case _Draw() when draw != null:
return draw(_that);case _Winner() when winner != null:
return winner(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  draw,TResult Function( Player winner)?  winner,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Draw() when draw != null:
return draw();case _Winner() when winner != null:
return winner(_that.winner);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  draw,required TResult Function( Player winner)  winner,}) {final _that = this;
switch (_that) {
case _Draw():
return draw();case _Winner():
return winner(_that.winner);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  draw,TResult? Function( Player winner)?  winner,}) {final _that = this;
switch (_that) {
case _Draw() when draw != null:
return draw();case _Winner() when winner != null:
return winner(_that.winner);case _:
  return null;

}
}

}

/// @nodoc


class _Draw implements GameResult {
   _Draw();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Draw);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameResult.draw()';
}


}




/// @nodoc


class _Winner implements GameResult {
   _Winner({required this.winner});
  

 final  Player winner;

/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WinnerCopyWith<_Winner> get copyWith => __$WinnerCopyWithImpl<_Winner>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Winner&&(identical(other.winner, winner) || other.winner == winner));
}


@override
int get hashCode => Object.hash(runtimeType,winner);

@override
String toString() {
  return 'GameResult.winner(winner: $winner)';
}


}

/// @nodoc
abstract mixin class _$WinnerCopyWith<$Res> implements $GameResultCopyWith<$Res> {
  factory _$WinnerCopyWith(_Winner value, $Res Function(_Winner) _then) = __$WinnerCopyWithImpl;
@useResult
$Res call({
 Player winner
});


$PlayerCopyWith<$Res> get winner;

}
/// @nodoc
class __$WinnerCopyWithImpl<$Res>
    implements _$WinnerCopyWith<$Res> {
  __$WinnerCopyWithImpl(this._self, this._then);

  final _Winner _self;
  final $Res Function(_Winner) _then;

/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? winner = null,}) {
  return _then(_Winner(
winner: null == winner ? _self.winner : winner // ignore: cast_nullable_to_non_nullable
as Player,
  ));
}

/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerCopyWith<$Res> get winner {
  
  return $PlayerCopyWith<$Res>(_self.winner, (value) {
    return _then(_self.copyWith(winner: value));
  });
}
}

// dart format on
