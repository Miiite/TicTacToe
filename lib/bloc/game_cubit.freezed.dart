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

 Player get xPlayer; Player get oPlayer;
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameStateCopyWith<GameState> get copyWith => _$GameStateCopyWithImpl<GameState>(this as GameState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState&&(identical(other.xPlayer, xPlayer) || other.xPlayer == xPlayer)&&(identical(other.oPlayer, oPlayer) || other.oPlayer == oPlayer));
}


@override
int get hashCode => Object.hash(runtimeType,xPlayer,oPlayer);

@override
String toString() {
  return 'GameState(xPlayer: $xPlayer, oPlayer: $oPlayer)';
}


}

/// @nodoc
abstract mixin class $GameStateCopyWith<$Res>  {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) _then) = _$GameStateCopyWithImpl;
@useResult
$Res call({
 Player xPlayer, Player oPlayer
});


$PlayerCopyWith<$Res> get xPlayer;$PlayerCopyWith<$Res> get oPlayer;

}
/// @nodoc
class _$GameStateCopyWithImpl<$Res>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._self, this._then);

  final GameState _self;
  final $Res Function(GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? xPlayer = null,Object? oPlayer = null,}) {
  return _then(_self.copyWith(
xPlayer: null == xPlayer ? _self.xPlayer : xPlayer // ignore: cast_nullable_to_non_nullable
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
return result(_that);}
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Player xPlayer,  Player oPlayer)?  initial,TResult Function( Player playing,  GameBoard board,  Player xPlayer,  Player oPlayer)?  game,TResult Function( Player? winner,  Player xPlayer,  Player oPlayer,  GameBoard board)?  result,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.xPlayer,_that.oPlayer);case _Game() when game != null:
return game(_that.playing,_that.board,_that.xPlayer,_that.oPlayer);case Result() when result != null:
return result(_that.winner,_that.xPlayer,_that.oPlayer,_that.board);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Player xPlayer,  Player oPlayer)  initial,required TResult Function( Player playing,  GameBoard board,  Player xPlayer,  Player oPlayer)  game,required TResult Function( Player? winner,  Player xPlayer,  Player oPlayer,  GameBoard board)  result,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.xPlayer,_that.oPlayer);case _Game():
return game(_that.playing,_that.board,_that.xPlayer,_that.oPlayer);case Result():
return result(_that.winner,_that.xPlayer,_that.oPlayer,_that.board);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Player xPlayer,  Player oPlayer)?  initial,TResult? Function( Player playing,  GameBoard board,  Player xPlayer,  Player oPlayer)?  game,TResult? Function( Player? winner,  Player xPlayer,  Player oPlayer,  GameBoard board)?  result,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.xPlayer,_that.oPlayer);case _Game() when game != null:
return game(_that.playing,_that.board,_that.xPlayer,_that.oPlayer);case Result() when result != null:
return result(_that.winner,_that.xPlayer,_that.oPlayer,_that.board);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements GameState {
   _Initial({required this.xPlayer, required this.oPlayer});
  

@override final  Player xPlayer;
@override final  Player oPlayer;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.xPlayer, xPlayer) || other.xPlayer == xPlayer)&&(identical(other.oPlayer, oPlayer) || other.oPlayer == oPlayer));
}


@override
int get hashCode => Object.hash(runtimeType,xPlayer,oPlayer);

@override
String toString() {
  return 'GameState.initial(xPlayer: $xPlayer, oPlayer: $oPlayer)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 Player xPlayer, Player oPlayer
});


@override $PlayerCopyWith<$Res> get xPlayer;@override $PlayerCopyWith<$Res> get oPlayer;

}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? xPlayer = null,Object? oPlayer = null,}) {
  return _then(_Initial(
xPlayer: null == xPlayer ? _self.xPlayer : xPlayer // ignore: cast_nullable_to_non_nullable
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


class _Game implements GameState {
   _Game({required this.playing, required final  GameBoard board, required this.xPlayer, required this.oPlayer}): _board = board;
  

 final  Player playing;
 final  GameBoard _board;
 GameBoard get board {
  if (_board is EqualUnmodifiableListView) return _board;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_board);
}

@override final  Player xPlayer;
@override final  Player oPlayer;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameCopyWith<_Game> get copyWith => __$GameCopyWithImpl<_Game>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Game&&(identical(other.playing, playing) || other.playing == playing)&&const DeepCollectionEquality().equals(other._board, _board)&&(identical(other.xPlayer, xPlayer) || other.xPlayer == xPlayer)&&(identical(other.oPlayer, oPlayer) || other.oPlayer == oPlayer));
}


@override
int get hashCode => Object.hash(runtimeType,playing,const DeepCollectionEquality().hash(_board),xPlayer,oPlayer);

@override
String toString() {
  return 'GameState.game(playing: $playing, board: $board, xPlayer: $xPlayer, oPlayer: $oPlayer)';
}


}

/// @nodoc
abstract mixin class _$GameCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameCopyWith(_Game value, $Res Function(_Game) _then) = __$GameCopyWithImpl;
@override @useResult
$Res call({
 Player playing, GameBoard board, Player xPlayer, Player oPlayer
});


$PlayerCopyWith<$Res> get playing;@override $PlayerCopyWith<$Res> get xPlayer;@override $PlayerCopyWith<$Res> get oPlayer;

}
/// @nodoc
class __$GameCopyWithImpl<$Res>
    implements _$GameCopyWith<$Res> {
  __$GameCopyWithImpl(this._self, this._then);

  final _Game _self;
  final $Res Function(_Game) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playing = null,Object? board = null,Object? xPlayer = null,Object? oPlayer = null,}) {
  return _then(_Game(
playing: null == playing ? _self.playing : playing // ignore: cast_nullable_to_non_nullable
as Player,board: null == board ? _self._board : board // ignore: cast_nullable_to_non_nullable
as GameBoard,xPlayer: null == xPlayer ? _self.xPlayer : xPlayer // ignore: cast_nullable_to_non_nullable
as Player,oPlayer: null == oPlayer ? _self.oPlayer : oPlayer // ignore: cast_nullable_to_non_nullable
as Player,
  ));
}

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerCopyWith<$Res> get playing {
  
  return $PlayerCopyWith<$Res>(_self.playing, (value) {
    return _then(_self.copyWith(playing: value));
  });
}/// Create a copy of GameState
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
   Result({this.winner, required this.xPlayer, required this.oPlayer, required final  GameBoard board}): _board = board;
  

 final  Player? winner;
@override final  Player xPlayer;
@override final  Player oPlayer;
 final  GameBoard _board;
 GameBoard get board {
  if (_board is EqualUnmodifiableListView) return _board;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_board);
}


/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultCopyWith<Result> get copyWith => _$ResultCopyWithImpl<Result>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Result&&(identical(other.winner, winner) || other.winner == winner)&&(identical(other.xPlayer, xPlayer) || other.xPlayer == xPlayer)&&(identical(other.oPlayer, oPlayer) || other.oPlayer == oPlayer)&&const DeepCollectionEquality().equals(other._board, _board));
}


@override
int get hashCode => Object.hash(runtimeType,winner,xPlayer,oPlayer,const DeepCollectionEquality().hash(_board));

@override
String toString() {
  return 'GameState.result(winner: $winner, xPlayer: $xPlayer, oPlayer: $oPlayer, board: $board)';
}


}

/// @nodoc
abstract mixin class $ResultCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) _then) = _$ResultCopyWithImpl;
@override @useResult
$Res call({
 Player? winner, Player xPlayer, Player oPlayer, GameBoard board
});


$PlayerCopyWith<$Res>? get winner;@override $PlayerCopyWith<$Res> get xPlayer;@override $PlayerCopyWith<$Res> get oPlayer;

}
/// @nodoc
class _$ResultCopyWithImpl<$Res>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._self, this._then);

  final Result _self;
  final $Res Function(Result) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? winner = freezed,Object? xPlayer = null,Object? oPlayer = null,Object? board = null,}) {
  return _then(Result(
winner: freezed == winner ? _self.winner : winner // ignore: cast_nullable_to_non_nullable
as Player?,xPlayer: null == xPlayer ? _self.xPlayer : xPlayer // ignore: cast_nullable_to_non_nullable
as Player,oPlayer: null == oPlayer ? _self.oPlayer : oPlayer // ignore: cast_nullable_to_non_nullable
as Player,board: null == board ? _self._board : board // ignore: cast_nullable_to_non_nullable
as GameBoard,
  ));
}

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerCopyWith<$Res>? get winner {
    if (_self.winner == null) {
    return null;
  }

  return $PlayerCopyWith<$Res>(_self.winner!, (value) {
    return _then(_self.copyWith(winner: value));
  });
}/// Create a copy of GameState
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

// dart format on
