import '../entities/booking_history.entity.dart';
import '../entities/bus_type.entity.dart';

abstract class SeatRepository {
  List<int> loadBookedSeats(BusType type);
  Future<void> bookSeats(BusType type, List<int> seats);
  Future<void> saveHistory(BookingHistory history);
  List<BookingHistory> loadHistory();
}
