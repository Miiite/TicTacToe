// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GameState {
  List<PlayerType?> get board => throw _privateConstructorUsedError;
  PlayerType get currentPlayer => throw _privateConstructorUsedError;
  GameStatus get status => throw _privateConstructorUsedError;
  int get xScore => throw _privateConstructorUsedError;
  int get oScore => throw _privateConstructorUsedError;
  List<int> get winningCells => throw _privateConstructorUsedError;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call({
    List<PlayerType?> board,
    PlayerType currentPlayer,
    GameStatus status,
    int xScore,
    int oScore,
    List<int> winningCells,
  });
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
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? board = null,
    Object? currentPlayer = null,
    Object? status = null,
    Object? xScore = null,
    Object? oScore = null,
    Object? winningCells = null,
  }) {
    return _then(
      _value.copyWith(
            board: null == board
                ? _value.board
                : board // ignore: cast_nullable_to_non_nullable
                      as List<PlayerType?>,
            currentPlayer: null == currentPlayer
                ? _value.currentPlayer
                : currentPlayer // ignore: cast_nullable_to_non_nullable
                      as PlayerType,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as GameStatus,
            xScore: null == xScore
                ? _value.xScore
                : xScore // ignore: cast_nullable_to_non_nullable
                      as int,
            oScore: null == oScore
                ? _value.oScore
                : oScore // ignore: cast_nullable_to_non_nullable
                      as int,
            winningCells: null == winningCells
                ? _value.winningCells
                : winningCells // ignore: cast_nullable_to_non_nullable
                      as List<int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GameStateImplCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$$GameStateImplCopyWith(
    _$GameStateImpl value,
    $Res Function(_$GameStateImpl) then,
  ) = __$$GameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<PlayerType?> board,
    PlayerType currentPlayer,
    GameStatus status,
    int xScore,
    int oScore,
    List<int> winningCells,
  });
}

/// @nodoc
class __$$GameStateImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateImpl>
    implements _$$GameStateImplCopyWith<$Res> {
  __$$GameStateImplCopyWithImpl(
    _$GameStateImpl _value,
    $Res Function(_$GameStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? board = null,
    Object? currentPlayer = null,
    Object? status = null,
    Object? xScore = null,
    Object? oScore = null,
    Object? winningCells = null,
  }) {
    return _then(
      _$GameStateImpl(
        board: null == board
            ? _value._board
            : board // ignore: cast_nullable_to_non_nullable
                  as List<PlayerType?>,
        currentPlayer: null == currentPlayer
            ? _value.currentPlayer
            : currentPlayer // ignore: cast_nullable_to_non_nullable
                  as PlayerType,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as GameStatus,
        xScore: null == xScore
            ? _value.xScore
            : xScore // ignore: cast_nullable_to_non_nullable
                  as int,
        oScore: null == oScore
            ? _value.oScore
            : oScore // ignore: cast_nullable_to_non_nullable
                  as int,
        winningCells: null == winningCells
            ? _value._winningCells
            : winningCells // ignore: cast_nullable_to_non_nullable
                  as List<int>,
      ),
    );
  }
}

/// @nodoc

class _$GameStateImpl extends _GameState {
  const _$GameStateImpl({
    final List<PlayerType?> board = const [
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
    ],
    this.currentPlayer = PlayerType.x,
    this.status = GameStatus.playing,
    this.xScore = 0,
    this.oScore = 0,
    final List<int> winningCells = const [],
  }) : _board = board,
       _winningCells = winningCells,
       super._();

  final List<PlayerType?> _board;
  @override
  @JsonKey()
  List<PlayerType?> get board {
    if (_board is EqualUnmodifiableListView) return _board;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_board);
  }

  @override
  @JsonKey()
  final PlayerType currentPlayer;
  @override
  @JsonKey()
  final GameStatus status;
  @override
  @JsonKey()
  final int xScore;
  @override
  @JsonKey()
  final int oScore;
  final List<int> _winningCells;
  @override
  @JsonKey()
  List<int> get winningCells {
    if (_winningCells is EqualUnmodifiableListView) return _winningCells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_winningCells);
  }

  @override
  String toString() {
    return 'GameState(board: $board, currentPlayer: $currentPlayer, status: $status, xScore: $xScore, oScore: $oScore, winningCells: $winningCells)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            const DeepCollectionEquality().equals(other._board, _board) &&
            (identical(other.currentPlayer, currentPlayer) ||
                other.currentPlayer == currentPlayer) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.xScore, xScore) || other.xScore == xScore) &&
            (identical(other.oScore, oScore) || other.oScore == oScore) &&
            const DeepCollectionEquality().equals(
              other._winningCells,
              _winningCells,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_board),
    currentPlayer,
    status,
    xScore,
    oScore,
    const DeepCollectionEquality().hash(_winningCells),
  );

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);
}

abstract class _GameState extends GameState {
  const factory _GameState({
    final List<PlayerType?> board,
    final PlayerType currentPlayer,
    final GameStatus status,
    final int xScore,
    final int oScore,
    final List<int> winningCells,
  }) = _$GameStateImpl;
  const _GameState._() : super._();

  @override
  List<PlayerType?> get board;
  @override
  PlayerType get currentPlayer;
  @override
  GameStatus get status;
  @override
  int get xScore;
  @override
  int get oScore;
  @override
  List<int> get winningCells;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
