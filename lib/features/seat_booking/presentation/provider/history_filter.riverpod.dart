import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/history_filter.entity.dart';

part 'history_filter.riverpod.g.dart';

@riverpod
class HistoryFilterController extends _$HistoryFilterController {
  @override
  HistoryFilter build() => HistoryFilter.all;

  void change(HistoryFilter filter) {
    state = filter;
  }
}
