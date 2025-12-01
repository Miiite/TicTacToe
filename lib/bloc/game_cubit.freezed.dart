// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GameState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      PlayerType playerTurn,
      List<PlayerType?>? board,
      int xScore,
      int oScore,
    )
    game,
    required TResult Function(int xScore, int oScore) result,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      PlayerType playerTurn,
      List<PlayerType?>? board,
      int xScore,
      int oScore,
    )?
    game,
    TResult? Function(int xScore, int oScore)? result,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      PlayerType playerTurn,
      List<PlayerType?>? board,
      int xScore,
      int oScore,
    )?
    game,
    TResult Function(int xScore, int oScore)? result,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Game value) game,
    required TResult Function(_Result value) result,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Game value)? game,
    TResult? Function(_Result value)? result,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Game value)? game,
    TResult Function(_Result value)? result,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  _$InitialImpl();

  @override
  String toString() {
    return 'GameState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      PlayerType playerTurn,
      List<PlayerType?>? board,
      int xScore,
      int oScore,
    )
    game,
    required TResult Function(int xScore, int oScore) result,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      PlayerType playerTurn,
      List<PlayerType?>? board,
      int xScore,
      int oScore,
    )?
    game,
    TResult? Function(int xScore, int oScore)? result,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      PlayerType playerTurn,
      List<PlayerType?>? board,
      int xScore,
      int oScore,
    )?
    game,
    TResult Function(int xScore, int oScore)? result,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Game value) game,
    required TResult Function(_Result value) result,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Game value)? game,
    TResult? Function(_Result value)? result,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Game value)? game,
    TResult Function(_Result value)? result,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GameState {
  factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$GameImplCopyWith<$Res> {
  factory _$$GameImplCopyWith(
    _$GameImpl value,
    $Res Function(_$GameImpl) then,
  ) = __$$GameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    PlayerType playerTurn,
    List<PlayerType?>? board,
    int xScore,
    int oScore,
  });
}

/// @nodoc
class __$$GameImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameImpl>
    implements _$$GameImplCopyWith<$Res> {
  __$$GameImplCopyWithImpl(_$GameImpl _value, $Res Function(_$GameImpl) _then)
    : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerTurn = null,
    Object? board = freezed,
    Object? xScore = null,
    Object? oScore = null,
  }) {
    return _then(
      _$GameImpl(
        playerTurn: null == playerTurn
            ? _value.playerTurn
            : playerTurn // ignore: cast_nullable_to_non_nullable
                  as PlayerType,
        board: freezed == board
            ? _value._board
            : board // ignore: cast_nullable_to_non_nullable
                  as List<PlayerType?>?,
        xScore: null == xScore
            ? _value.xScore
            : xScore // ignore: cast_nullable_to_non_nullable
                  as int,
        oScore: null == oScore
            ? _value.oScore
            : oScore // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$GameImpl implements _Game {
  _$GameImpl({
    required this.playerTurn,
    final List<PlayerType?>? board,
    this.xScore = 0,
    this.oScore = 0,
  }) : _board = board;

  @override
  final PlayerType playerTurn;
  final List<PlayerType?>? _board;
  @override
  List<PlayerType?>? get board {
    final value = _board;
    if (value == null) return null;
    if (_board is EqualUnmodifiableListView) return _board;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int xScore;
  @override
  @JsonKey()
  final int oScore;

  @override
  String toString() {
    return 'GameState.game(playerTurn: $playerTurn, board: $board, xScore: $xScore, oScore: $oScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameImpl &&
            (identical(other.playerTurn, playerTurn) ||
                other.playerTurn == playerTurn) &&
            const DeepCollectionEquality().equals(other._board, _board) &&
            (identical(other.xScore, xScore) || other.xScore == xScore) &&
            (identical(other.oScore, oScore) || other.oScore == oScore));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    playerTurn,
    const DeepCollectionEquality().hash(_board),
    xScore,
    oScore,
  );

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      __$$GameImplCopyWithImpl<_$GameImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      PlayerType playerTurn,
      List<PlayerType?>? board,
      int xScore,
      int oScore,
    )
    game,
    required TResult Function(int xScore, int oScore) result,
  }) {
    return game(playerTurn, board, xScore, oScore);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      PlayerType playerTurn,
      List<PlayerType?>? board,
      int xScore,
      int oScore,
    )?
    game,
    TResult? Function(int xScore, int oScore)? result,
  }) {
    return game?.call(playerTurn, board, xScore, oScore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      PlayerType playerTurn,
      List<PlayerType?>? board,
      int xScore,
      int oScore,
    )?
    game,
    TResult Function(int xScore, int oScore)? result,
    required TResult orElse(),
  }) {
    if (game != null) {
      return game(playerTurn, board, xScore, oScore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Game value) game,
    required TResult Function(_Result value) result,
  }) {
    return game(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Game value)? game,
    TResult? Function(_Result value)? result,
  }) {
    return game?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Game value)? game,
    TResult Function(_Result value)? result,
    required TResult orElse(),
  }) {
    if (game != null) {
      return game(this);
    }
    return orElse();
  }
}

abstract class _Game implements GameState {
  factory _Game({
    required final PlayerType playerTurn,
    final List<PlayerType?>? board,
    final int xScore,
    final int oScore,
  }) = _$GameImpl;

  PlayerType get playerTurn;
  List<PlayerType?>? get board;
  int get xScore;
  int get oScore;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResultImplCopyWith<$Res> {
  factory _$$ResultImplCopyWith(
    _$ResultImpl value,
    $Res Function(_$ResultImpl) then,
  ) = __$$ResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int xScore, int oScore});
}

/// @nodoc
class __$$ResultImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$ResultImpl>
    implements _$$ResultImplCopyWith<$Res> {
  __$$ResultImplCopyWithImpl(
    _$ResultImpl _value,
    $Res Function(_$ResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? xScore = null, Object? oScore = null}) {
    return _then(
      _$ResultImpl(
        xScore: null == xScore
            ? _value.xScore
            : xScore // ignore: cast_nullable_to_non_nullable
                  as int,
        oScore: null == oScore
            ? _value.oScore
            : oScore // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$ResultImpl implements _Result {
  _$ResultImpl({this.xScore = 0, this.oScore = 0});

  @override
  @JsonKey()
  final int xScore;
  @override
  @JsonKey()
  final int oScore;

  @override
  String toString() {
    return 'GameState.result(xScore: $xScore, oScore: $oScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultImpl &&
            (identical(other.xScore, xScore) || other.xScore == xScore) &&
            (identical(other.oScore, oScore) || other.oScore == oScore));
  }

  @override
  int get hashCode => Object.hash(runtimeType, xScore, oScore);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      __$$ResultImplCopyWithImpl<_$ResultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      PlayerType playerTurn,
      List<PlayerType?>? board,
      int xScore,
      int oScore,
    )
    game,
    required TResult Function(int xScore, int oScore) result,
  }) {
    return result(xScore, oScore);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      PlayerType playerTurn,
      List<PlayerType?>? board,
      int xScore,
      int oScore,
    )?
    game,
    TResult? Function(int xScore, int oScore)? result,
  }) {
    return result?.call(xScore, oScore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      PlayerType playerTurn,
      List<PlayerType?>? board,
      int xScore,
      int oScore,
    )?
    game,
    TResult Function(int xScore, int oScore)? result,
    required TResult orElse(),
  }) {
    if (result != null) {
      return result(xScore, oScore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Game value) game,
    required TResult Function(_Result value) result,
  }) {
    return result(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Game value)? game,
    TResult? Function(_Result value)? result,
  }) {
    return result?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Game value)? game,
    TResult Function(_Result value)? result,
    required TResult orElse(),
  }) {
    if (result != null) {
      return result(this);
    }
    return orElse();
  }
}

abstract class _Result implements GameState {
  factory _Result({final int xScore, final int oScore}) = _$ResultImpl;

  int get xScore;
  int get oScore;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
