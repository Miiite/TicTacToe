import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/features/game/models/game_result.dart';
import 'package:tictactoe/features/game_score/use_cases/game_score_use_cases.dart';
import 'package:tictactoe/features/game_score/models/game_score.dart';
import 'package:tictactoe/widgets/cubit_loader.dart';

part 'result_cubit.freezed.dart';

class ResultCubit extends LoadableCubit<ResultState> {
  ResultCubit({required this.result, required this.getGameScoreUseCase})
    : super(initialState: ResultState.initial());

  final GameResult? result;
  final GetGameScoreUseCase getGameScoreUseCase;

  @override
  Future<void> load() async {
    final score = await getGameScoreUseCase();

    emit(
      ResultState.success(
        result: result,
        score: score,
      ),
    );
  }
}

@freezed
sealed class ResultState with _$ResultState {
  factory ResultState.initial() = _Initial;
  factory ResultState.success({
    GameResult? result,
    required GameScore score,
  }) = _Result;
}
