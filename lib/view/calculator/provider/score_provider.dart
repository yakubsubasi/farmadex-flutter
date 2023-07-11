import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'score_provider.g.dart';

@riverpod
class Score extends _$Score {
  @override
  double build() {
    return 0;
  }

  void updateScore(double score) {
    state += score;
  }
}
