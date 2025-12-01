// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameState()';
}


}

/// @nodoc
class $GameStateCopyWith<$Res>  {
$GameStateCopyWith(GameState _, $Res Function(GameState) __);
}


/// Adds pattern-matching-related methods to [GameState].
extension GameStatePatterns on GameState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Game value)?  game,TResult Function( Result value)?  result,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Game() when game != null:
return game(_that);case Result() when result != null:
return result(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Game value)  game,required TResult Function( Result value)  result,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Game():
return game(_that);case Result():
return result(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Game value)?  game,TResult? Function( Result value)?  result,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Game() when game != null:
return game(_that);case Result() when result != null:
return result(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( PlayerType playerTurn,  List<PlayerType?> board,  Player xPlayer,  Player oPlayer)?  game,TResult Function( PlayerType? winner,  int xScore,  int oScore)?  result,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Game() when game != null:
return game(_that.playerTurn,_that.board,_that.xPlayer,_that.oPlayer);case Result() when result != null:
return result(_that.winner,_that.xScore,_that.oScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( PlayerType playerTurn,  List<PlayerType?> board,  Player xPlayer,  Player oPlayer)  game,required TResult Function( PlayerType? winner,  int xScore,  int oScore)  result,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Game():
return game(_that.playerTurn,_that.board,_that.xPlayer,_that.oPlayer);case Result():
return result(_that.winner,_that.xScore,_that.oScore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( PlayerType playerTurn,  List<PlayerType?> board,  Player xPlayer,  Player oPlayer)?  game,TResult? Function( PlayerType? winner,  int xScore,  int oScore)?  result,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Game() when game != null:
return game(_that.playerTurn,_that.board,_that.xPlayer,_that.oPlayer);case Result() when result != null:
return result(_that.winner,_that.xScore,_that.oScore);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements GameState {
   _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameState.initial()';
}


}




/// @nodoc


class _Game implements GameState {
   _Game({required this.playerTurn, required final  List<PlayerType?> board, required this.xPlayer, required this.oPlayer}): _board = board;
  

 final  PlayerType playerTurn;
 final  List<PlayerType?> _board;
 List<PlayerType?> get board {
  if (_board is EqualUnmodifiableListView) return _board;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_board);
}

 final  Player xPlayer;
 final  Player oPlayer;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameCopyWith<_Game> get copyWith => __$GameCopyWithImpl<_Game>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Game&&(identical(other.playerTurn, playerTurn) || other.playerTurn == playerTurn)&&const DeepCollectionEquality().equals(other._board, _board)&&(identical(other.xPlayer, xPlayer) || other.xPlayer == xPlayer)&&(identical(other.oPlayer, oPlayer) || other.oPlayer == oPlayer));
}


@override
int get hashCode => Object.hash(runtimeType,playerTurn,const DeepCollectionEquality().hash(_board),xPlayer,oPlayer);

@override
String toString() {
  return 'GameState.game(playerTurn: $playerTurn, board: $board, xPlayer: $xPlayer, oPlayer: $oPlayer)';
}


}

/// @nodoc
abstract mixin class _$GameCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameCopyWith(_Game value, $Res Function(_Game) _then) = __$GameCopyWithImpl;
@useResult
$Res call({
 PlayerType playerTurn, List<PlayerType?> board, Player xPlayer, Player oPlayer
});


$PlayerCopyWith<$Res> get xPlayer;$PlayerCopyWith<$Res> get oPlayer;

}
/// @nodoc
class __$GameCopyWithImpl<$Res>
    implements _$GameCopyWith<$Res> {
  __$GameCopyWithImpl(this._self, this._then);

  final _Game _self;
  final $Res Function(_Game) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? playerTurn = null,Object? board = null,Object? xPlayer = null,Object? oPlayer = null,}) {
  return _then(_Game(
playerTurn: null == playerTurn ? _self.playerTurn : playerTurn // ignore: cast_nullable_to_non_nullable
as PlayerType,board: null == board ? _self._board : board // ignore: cast_nullable_to_non_nullable
as List<PlayerType?>,xPlayer: null == xPlayer ? _self.xPlayer : xPlayer // ignore: cast_nullable_to_non_nullable
as Player,oPlayer: null == oPlayer ? _self.oPlayer : oPlayer // ignore: cast_nullable_to_non_nullable
as Player,
  ));
}

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerCopyWith<$Res> get xPlayer {
  
  return $PlayerCopyWith<$Res>(_self.xPlayer, (value) {
    return _then(_self.copyWith(xPlayer: value));
  });
}/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerCopyWith<$Res> get oPlayer {
  
  return $PlayerCopyWith<$Res>(_self.oPlayer, (value) {
    return _then(_self.copyWith(oPlayer: value));
  });
}
}

/// @nodoc


class Result implements GameState {
   Result({this.winner, this.xScore = 0, this.oScore = 0});
  

 final  PlayerType? winner;
@JsonKey() final  int xScore;
@JsonKey() final  int oScore;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultCopyWith<Result> get copyWith => _$ResultCopyWithImpl<Result>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Result&&(identical(other.winner, winner) || other.winner == winner)&&(identical(other.xScore, xScore) || other.xScore == xScore)&&(identical(other.oScore, oScore) || other.oScore == oScore));
}


@override
int get hashCode => Object.hash(runtimeType,winner,xScore,oScore);

@override
String toString() {
  return 'GameState.result(winner: $winner, xScore: $xScore, oScore: $oScore)';
}


}

/// @nodoc
abstract mixin class $ResultCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) _then) = _$ResultCopyWithImpl;
@useResult
$Res call({
 PlayerType? winner, int xScore, int oScore
});




}
/// @nodoc
class _$ResultCopyWithImpl<$Res>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._self, this._then);

  final Result _self;
  final $Res Function(Result) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? winner = freezed,Object? xScore = null,Object? oScore = null,}) {
  return _then(Result(
winner: freezed == winner ? _self.winner : winner // ignore: cast_nullable_to_non_nullable
as PlayerType?,xScore: null == xScore ? _self.xScore : xScore // ignore: cast_nullable_to_non_nullable
as int,oScore: null == oScore ? _self.oScore : oScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
