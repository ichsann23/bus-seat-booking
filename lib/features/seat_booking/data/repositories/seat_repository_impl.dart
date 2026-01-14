import '../../domain/entities/booking_history.entity.dart';
import '../../domain/entities/bus_type.entity.dart';
import '../../domain/repositories/seat_repository.dart';
import '../datasources/seat_local_datasource.dart';

class SeatRepositoryImpl implements SeatRepository {
  final SeatLocalDataSource local;

  SeatRepositoryImpl(this.local);

  @override
  List<int> loadBookedSeats(BusType type) {
    return local.getBookedSeats(type.storageKey);
  }

  @override
  Future<void> bookSeats(BusType type, List<int> seats) async {
    final booked = loadBookedSeats(type)..addAll(seats);

    if (booked.length == type.totalSeats) {
      await local.resetSeats(type.storageKey);
    } else {
      await local.saveBookedSeats(type.storageKey, booked);
    }
  }

  @override
  Future<void> saveHistory(BookingHistory history) {
    return local.saveHistory(history);
  }

  @override
  List<BookingHistory> loadHistory() {
    return local.loadHistory();
  }
}
