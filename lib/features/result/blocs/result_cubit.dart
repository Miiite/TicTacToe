import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/features/game/models/player.dart';
import 'package:tictactoe/widgets/cubit_loader.dart';

part 'result_cubit.freezed.dart';

class ResultCubit extends LoadableCubit<ResultState> {
  ResultCubit() : super(initialState: ResultState.initial());

  @override
  Future<void> load() async {
    emit(
      ResultState.success(
        winner: null,
        xPlayer: Player.x(),
        oPlayer: Player.o(),
      ),
    );
  }
}

@freezed
sealed class ResultState with _$ResultState {
  factory ResultState.initial() = _Initial;
  factory ResultState.success({
    Player? winner,
    required Player xPlayer,
    required Player oPlayer,
  }) = _Result;
}
