import 'package:bus_seat_booking/features/seat_booking/presentation/provider/seat_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/booking_history.entity.dart';
import '../../domain/entities/bus_type.entity.dart';
import '../../domain/entities/seat.entity.dart';
import '../../domain/repositories/seat_repository.dart';

part 'seat_booking.riverpod.g.dart';

class SeatBookingState {
  final BusType busType;
  final List<Seat> seats;

  SeatBookingState({required this.busType, required this.seats});

  int get totalPrice => seats.where((e) => e.isSelected).length * busType.price;
}

@riverpod
class SeatBookingController extends _$SeatBookingController {
  late final SeatRepository repository;

  @override
  SeatBookingState build() {
    repository = ref.read(seatRepositoryProvider);
    return _load(BusType.regular);
  }

  SeatBookingState _load(BusType type) {
    final booked = repository.loadBookedSeats(type);
    return SeatBookingState(
      busType: type,
      seats: List.generate(
        type.totalSeats,
        (i) => Seat(
          number: i + 1,
          isBooked: booked.contains(i + 1),
        ),
      ),
    );
  }

  String _getSeatLabel(int seatNumber) {
    final rowIndex = (seatNumber - 1) ~/ 4;
    final colIndex = (seatNumber - 1) % 4;
    final rowLetter = String.fromCharCode(65 + rowIndex);
    final colNumber = colIndex + 1;
    return '$rowLetter$colNumber';
  }

  void changeBus(BusType type) {
    state = _load(type);
  }

  void toggleSeat(int number) {
    state = SeatBookingState(
      busType: state.busType,
      seats: state.seats.map((s) {
        if (s.number == number && !s.isBooked) {
          return s.copyWith(isSelected: !s.isSelected);
        }
        return s;
      }).toList(),
    );
  }

  Future<void> confirmBooking() async {
    final selectedSeats = state.seats.where((e) => e.isSelected).toList();

    if (selectedSeats.isEmpty) return;

    final seatNumbers = selectedSeats.map((e) => e.number).toList();

    final seatLabels =
        selectedSeats.map((e) => _getSeatLabel(e.number)).toList();

    seatLabels.sort();

    await repository.bookSeats(state.busType, seatNumbers);

    await repository.saveHistory(
      BookingHistory(
        busType: state.busType,
        seats: seatLabels,
        totalPrice: state.totalPrice,
        createdAt: DateTime.now(),
      ),
    );

    state = _load(state.busType);
  }
}
