import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../seat_booking/domain/entities/booking_history.entity.dart';
import '../../../seat_booking/presentation/provider/seat_repository_provider.dart';
import '../../domain/entities/history_filter.entity.dart';
import 'history_filter.riverpod.dart';

part 'history_list.riverpod.g.dart';

@riverpod
class HistoryListController extends _$HistoryListController {
  @override
  List<BookingHistory> build() {
    final repository = ref.read(seatRepositoryProvider);

    final filter = ref.watch(historyFilterControllerProvider);

    final all = repository.loadHistory();

    return _applyFilter(all, filter);
  }

  List<BookingHistory> _applyFilter(
    List<BookingHistory> items,
    HistoryFilter filter,
  ) {
    final now = DateTime.now();

    return switch (filter) {
      HistoryFilter.all => items,
      HistoryFilter.today => items
          .where(
            (e) =>
                e.createdAt.year == now.year &&
                e.createdAt.month == now.month &&
                e.createdAt.day == now.day,
          )
          .toList(),
      HistoryFilter.week => items
          .where(
            (e) => e.createdAt.isAfter(
              now.subtract(const Duration(days: 7)),
            ),
          )
          .toList(),
    };
  }
}
