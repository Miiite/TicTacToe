// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameScore {

 int get playerXScore; int get playerOScore;
/// Create a copy of GameScore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameScoreCopyWith<GameScore> get copyWith => _$GameScoreCopyWithImpl<GameScore>(this as GameScore, _$identity);

  /// Serializes this GameScore to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameScore&&(identical(other.playerXScore, playerXScore) || other.playerXScore == playerXScore)&&(identical(other.playerOScore, playerOScore) || other.playerOScore == playerOScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerXScore,playerOScore);

@override
String toString() {
  return 'GameScore(playerXScore: $playerXScore, playerOScore: $playerOScore)';
}


}

/// @nodoc
abstract mixin class $GameScoreCopyWith<$Res>  {
  factory $GameScoreCopyWith(GameScore value, $Res Function(GameScore) _then) = _$GameScoreCopyWithImpl;
@useResult
$Res call({
 int playerXScore, int playerOScore
});




}
/// @nodoc
class _$GameScoreCopyWithImpl<$Res>
    implements $GameScoreCopyWith<$Res> {
  _$GameScoreCopyWithImpl(this._self, this._then);

  final GameScore _self;
  final $Res Function(GameScore) _then;

/// Create a copy of GameScore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerXScore = null,Object? playerOScore = null,}) {
  return _then(_self.copyWith(
playerXScore: null == playerXScore ? _self.playerXScore : playerXScore // ignore: cast_nullable_to_non_nullable
as int,playerOScore: null == playerOScore ? _self.playerOScore : playerOScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GameScore].
extension GameScorePatterns on GameScore {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameScore value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameScore() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameScore value)  $default,){
final _that = this;
switch (_that) {
case _GameScore():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameScore value)?  $default,){
final _that = this;
switch (_that) {
case _GameScore() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int playerXScore,  int playerOScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameScore() when $default != null:
return $default(_that.playerXScore,_that.playerOScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int playerXScore,  int playerOScore)  $default,) {final _that = this;
switch (_that) {
case _GameScore():
return $default(_that.playerXScore,_that.playerOScore);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int playerXScore,  int playerOScore)?  $default,) {final _that = this;
switch (_that) {
case _GameScore() when $default != null:
return $default(_that.playerXScore,_that.playerOScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameScore implements GameScore {
   _GameScore({required this.playerXScore, required this.playerOScore});
  factory _GameScore.fromJson(Map<String, dynamic> json) => _$GameScoreFromJson(json);

@override final  int playerXScore;
@override final  int playerOScore;

/// Create a copy of GameScore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameScoreCopyWith<_GameScore> get copyWith => __$GameScoreCopyWithImpl<_GameScore>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameScoreToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameScore&&(identical(other.playerXScore, playerXScore) || other.playerXScore == playerXScore)&&(identical(other.playerOScore, playerOScore) || other.playerOScore == playerOScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerXScore,playerOScore);

@override
String toString() {
  return 'GameScore(playerXScore: $playerXScore, playerOScore: $playerOScore)';
}


}

/// @nodoc
abstract mixin class _$GameScoreCopyWith<$Res> implements $GameScoreCopyWith<$Res> {
  factory _$GameScoreCopyWith(_GameScore value, $Res Function(_GameScore) _then) = __$GameScoreCopyWithImpl;
@override @useResult
$Res call({
 int playerXScore, int playerOScore
});




}
/// @nodoc
class __$GameScoreCopyWithImpl<$Res>
    implements _$GameScoreCopyWith<$Res> {
  __$GameScoreCopyWithImpl(this._self, this._then);

  final _GameScore _self;
  final $Res Function(_GameScore) _then;

/// Create a copy of GameScore
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerXScore = null,Object? playerOScore = null,}) {
  return _then(_GameScore(
playerXScore: null == playerXScore ? _self.playerXScore : playerXScore // ignore: cast_nullable_to_non_nullable
as int,playerOScore: null == playerOScore ? _self.playerOScore : playerOScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
