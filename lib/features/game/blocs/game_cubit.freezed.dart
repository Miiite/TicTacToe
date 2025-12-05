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

 GameBoard get board; Player get xPlayer; Player get oPlayer; Player? get playing; GameResult? get result;
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameStateCopyWith<GameState> get copyWith => _$GameStateCopyWithImpl<GameState>(this as GameState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState&&const DeepCollectionEquality().equals(other.board, board)&&(identical(other.xPlayer, xPlayer) || other.xPlayer == xPlayer)&&(identical(other.oPlayer, oPlayer) || other.oPlayer == oPlayer)&&(identical(other.playing, playing) || other.playing == playing)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(board),xPlayer,oPlayer,playing,result);

@override
String toString() {
  return 'GameState(board: $board, xPlayer: $xPlayer, oPlayer: $oPlayer, playing: $playing, result: $result)';
}


}

/// @nodoc
abstract mixin class $GameStateCopyWith<$Res>  {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) _then) = _$GameStateCopyWithImpl;
@useResult
$Res call({
 GameBoard board, Player xPlayer, Player oPlayer, Player? playing, GameResult? result
});


$PlayerCopyWith<$Res> get xPlayer;$PlayerCopyWith<$Res> get oPlayer;$PlayerCopyWith<$Res>? get playing;$GameResultCopyWith<$Res>? get result;

}
/// @nodoc
class _$GameStateCopyWithImpl<$Res>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._self, this._then);

  final GameState _self;
  final $Res Function(GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? board = null,Object? xPlayer = null,Object? oPlayer = null,Object? playing = freezed,Object? result = freezed,}) {
  return _then(_self.copyWith(
board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as GameBoard,xPlayer: null == xPlayer ? _self.xPlayer : xPlayer // ignore: cast_nullable_to_non_nullable
as Player,oPlayer: null == oPlayer ? _self.oPlayer : oPlayer // ignore: cast_nullable_to_non_nullable
as Player,playing: freezed == playing ? _self.playing : playing // ignore: cast_nullable_to_non_nullable
as Player?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as GameResult?,
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
}/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerCopyWith<$Res>? get playing {
    if (_self.playing == null) {
    return null;
  }

  return $PlayerCopyWith<$Res>(_self.playing!, (value) {
    return _then(_self.copyWith(playing: value));
  });
}/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $GameResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Game value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Game() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Game value)  $default,){
final _that = this;
switch (_that) {
case _Game():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Game value)?  $default,){
final _that = this;
switch (_that) {
case _Game() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GameBoard board,  Player xPlayer,  Player oPlayer,  Player? playing,  GameResult? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Game() when $default != null:
return $default(_that.board,_that.xPlayer,_that.oPlayer,_that.playing,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GameBoard board,  Player xPlayer,  Player oPlayer,  Player? playing,  GameResult? result)  $default,) {final _that = this;
switch (_that) {
case _Game():
return $default(_that.board,_that.xPlayer,_that.oPlayer,_that.playing,_that.result);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GameBoard board,  Player xPlayer,  Player oPlayer,  Player? playing,  GameResult? result)?  $default,) {final _that = this;
switch (_that) {
case _Game() when $default != null:
return $default(_that.board,_that.xPlayer,_that.oPlayer,_that.playing,_that.result);case _:
  return null;

}
}

}

/// @nodoc


class _Game implements GameState {
   _Game({required final  GameBoard board, required this.xPlayer, required this.oPlayer, this.playing, this.result}): _board = board;
  

 final  GameBoard _board;
@override GameBoard get board {
  if (_board is EqualUnmodifiableListView) return _board;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_board);
}

@override final  Player xPlayer;
@override final  Player oPlayer;
@override final  Player? playing;
@override final  GameResult? result;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameCopyWith<_Game> get copyWith => __$GameCopyWithImpl<_Game>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Game&&const DeepCollectionEquality().equals(other._board, _board)&&(identical(other.xPlayer, xPlayer) || other.xPlayer == xPlayer)&&(identical(other.oPlayer, oPlayer) || other.oPlayer == oPlayer)&&(identical(other.playing, playing) || other.playing == playing)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_board),xPlayer,oPlayer,playing,result);

@override
String toString() {
  return 'GameState(board: $board, xPlayer: $xPlayer, oPlayer: $oPlayer, playing: $playing, result: $result)';
}


}

/// @nodoc
abstract mixin class _$GameCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameCopyWith(_Game value, $Res Function(_Game) _then) = __$GameCopyWithImpl;
@override @useResult
$Res call({
 GameBoard board, Player xPlayer, Player oPlayer, Player? playing, GameResult? result
});


@override $PlayerCopyWith<$Res> get xPlayer;@override $PlayerCopyWith<$Res> get oPlayer;@override $PlayerCopyWith<$Res>? get playing;@override $GameResultCopyWith<$Res>? get result;

}
/// @nodoc
class __$GameCopyWithImpl<$Res>
    implements _$GameCopyWith<$Res> {
  __$GameCopyWithImpl(this._self, this._then);

  final _Game _self;
  final $Res Function(_Game) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? board = null,Object? xPlayer = null,Object? oPlayer = null,Object? playing = freezed,Object? result = freezed,}) {
  return _then(_Game(
board: null == board ? _self._board : board // ignore: cast_nullable_to_non_nullable
as GameBoard,xPlayer: null == xPlayer ? _self.xPlayer : xPlayer // ignore: cast_nullable_to_non_nullable
as Player,oPlayer: null == oPlayer ? _self.oPlayer : oPlayer // ignore: cast_nullable_to_non_nullable
as Player,playing: freezed == playing ? _self.playing : playing // ignore: cast_nullable_to_non_nullable
as Player?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as GameResult?,
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
}/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerCopyWith<$Res>? get playing {
    if (_self.playing == null) {
    return null;
  }

  return $PlayerCopyWith<$Res>(_self.playing!, (value) {
    return _then(_self.copyWith(playing: value));
  });
}/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $GameResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

// dart format on
