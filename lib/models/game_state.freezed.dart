// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameState {

 List<PlayerType?> get board; PlayerType get currentPlayer; GameStatus get status; int get xScore; int get oScore; List<int> get winningCells;
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameStateCopyWith<GameState> get copyWith => _$GameStateCopyWithImpl<GameState>(this as GameState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState&&const DeepCollectionEquality().equals(other.board, board)&&(identical(other.currentPlayer, currentPlayer) || other.currentPlayer == currentPlayer)&&(identical(other.status, status) || other.status == status)&&(identical(other.xScore, xScore) || other.xScore == xScore)&&(identical(other.oScore, oScore) || other.oScore == oScore)&&const DeepCollectionEquality().equals(other.winningCells, winningCells));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(board),currentPlayer,status,xScore,oScore,const DeepCollectionEquality().hash(winningCells));

@override
String toString() {
  return 'GameState(board: $board, currentPlayer: $currentPlayer, status: $status, xScore: $xScore, oScore: $oScore, winningCells: $winningCells)';
}


}

/// @nodoc
abstract mixin class $GameStateCopyWith<$Res>  {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) _then) = _$GameStateCopyWithImpl;
@useResult
$Res call({
 List<PlayerType?> board, PlayerType currentPlayer, GameStatus status, int xScore, int oScore, List<int> winningCells
});




}
/// @nodoc
class _$GameStateCopyWithImpl<$Res>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._self, this._then);

  final GameState _self;
  final $Res Function(GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? board = null,Object? currentPlayer = null,Object? status = null,Object? xScore = null,Object? oScore = null,Object? winningCells = null,}) {
  return _then(_self.copyWith(
board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as List<PlayerType?>,currentPlayer: null == currentPlayer ? _self.currentPlayer : currentPlayer // ignore: cast_nullable_to_non_nullable
as PlayerType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GameStatus,xScore: null == xScore ? _self.xScore : xScore // ignore: cast_nullable_to_non_nullable
as int,oScore: null == oScore ? _self.oScore : oScore // ignore: cast_nullable_to_non_nullable
as int,winningCells: null == winningCells ? _self.winningCells : winningCells // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameState value)  $default,){
final _that = this;
switch (_that) {
case _GameState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameState value)?  $default,){
final _that = this;
switch (_that) {
case _GameState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PlayerType?> board,  PlayerType currentPlayer,  GameStatus status,  int xScore,  int oScore,  List<int> winningCells)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.board,_that.currentPlayer,_that.status,_that.xScore,_that.oScore,_that.winningCells);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PlayerType?> board,  PlayerType currentPlayer,  GameStatus status,  int xScore,  int oScore,  List<int> winningCells)  $default,) {final _that = this;
switch (_that) {
case _GameState():
return $default(_that.board,_that.currentPlayer,_that.status,_that.xScore,_that.oScore,_that.winningCells);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PlayerType?> board,  PlayerType currentPlayer,  GameStatus status,  int xScore,  int oScore,  List<int> winningCells)?  $default,) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.board,_that.currentPlayer,_that.status,_that.xScore,_that.oScore,_that.winningCells);case _:
  return null;

}
}

}

/// @nodoc


class _GameState extends GameState {
  const _GameState({final  List<PlayerType?> board = const [null, null, null, null, null, null, null, null, null], this.currentPlayer = PlayerType.x, this.status = GameStatus.playing, this.xScore = 0, this.oScore = 0, final  List<int> winningCells = const []}): _board = board,_winningCells = winningCells,super._();
  

 final  List<PlayerType?> _board;
@override@JsonKey() List<PlayerType?> get board {
  if (_board is EqualUnmodifiableListView) return _board;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_board);
}

@override@JsonKey() final  PlayerType currentPlayer;
@override@JsonKey() final  GameStatus status;
@override@JsonKey() final  int xScore;
@override@JsonKey() final  int oScore;
 final  List<int> _winningCells;
@override@JsonKey() List<int> get winningCells {
  if (_winningCells is EqualUnmodifiableListView) return _winningCells;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_winningCells);
}


/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameStateCopyWith<_GameState> get copyWith => __$GameStateCopyWithImpl<_GameState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameState&&const DeepCollectionEquality().equals(other._board, _board)&&(identical(other.currentPlayer, currentPlayer) || other.currentPlayer == currentPlayer)&&(identical(other.status, status) || other.status == status)&&(identical(other.xScore, xScore) || other.xScore == xScore)&&(identical(other.oScore, oScore) || other.oScore == oScore)&&const DeepCollectionEquality().equals(other._winningCells, _winningCells));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_board),currentPlayer,status,xScore,oScore,const DeepCollectionEquality().hash(_winningCells));

@override
String toString() {
  return 'GameState(board: $board, currentPlayer: $currentPlayer, status: $status, xScore: $xScore, oScore: $oScore, winningCells: $winningCells)';
}


}

/// @nodoc
abstract mixin class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(_GameState value, $Res Function(_GameState) _then) = __$GameStateCopyWithImpl;
@override @useResult
$Res call({
 List<PlayerType?> board, PlayerType currentPlayer, GameStatus status, int xScore, int oScore, List<int> winningCells
});




}
/// @nodoc
class __$GameStateCopyWithImpl<$Res>
    implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(this._self, this._then);

  final _GameState _self;
  final $Res Function(_GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? board = null,Object? currentPlayer = null,Object? status = null,Object? xScore = null,Object? oScore = null,Object? winningCells = null,}) {
  return _then(_GameState(
board: null == board ? _self._board : board // ignore: cast_nullable_to_non_nullable
as List<PlayerType?>,currentPlayer: null == currentPlayer ? _self.currentPlayer : currentPlayer // ignore: cast_nullable_to_non_nullable
as PlayerType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GameStatus,xScore: null == xScore ? _self.xScore : xScore // ignore: cast_nullable_to_non_nullable
as int,oScore: null == oScore ? _self.oScore : oScore // ignore: cast_nullable_to_non_nullable
as int,winningCells: null == winningCells ? _self._winningCells : winningCells // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
