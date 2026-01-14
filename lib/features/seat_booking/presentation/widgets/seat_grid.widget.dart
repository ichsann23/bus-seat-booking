import 'package:bus_seat_booking/features/seat_booking/presentation/widgets/seat.widget.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/bus_type.entity.dart';
import '../../domain/entities/seat.entity.dart';

class SeatGrid extends StatelessWidget {
  final BusType busType;
  final List<Seat> seats;
  final void Function(int) onTapSeat;

  const SeatGrid({
    super.key,
    required this.busType,
    required this.seats,
    required this.onTapSeat,
  });

  @override
  Widget build(BuildContext context) {
    final rows = <String, List<Seat>>{};

    for (var seat in seats) {
      final rowIndex = (seat.number - 1) ~/ 4;
      final rowLetter = String.fromCharCode(65 + rowIndex);

      if (!rows.containsKey(rowLetter)) {
        rows[rowLetter] = [];
      }
      rows[rowLetter]!.add(seat);
    }

    final sortedRowKeys = rows.keys.toList()..sort();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: sortedRowKeys.map((rowKey) {
          final rowSeats = rows[rowKey]!;
          rowSeats.sort((a, b) => a.number.compareTo(b.number));

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: SeatItem(
                          seat: rowSeats[0],
                          onTap: () => onTapSeat(rowSeats[0].number),
                          busType: busType,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SeatItem(
                          seat: rowSeats[1],
                          onTap: () => onTapSeat(rowSeats[1].number),
                          busType: busType,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: SeatItem(
                          seat: rowSeats[2],
                          onTap: () => onTapSeat(rowSeats[2].number),
                          busType: busType,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SeatItem(
                          seat: rowSeats[3],
                          onTap: () => onTapSeat(rowSeats[3].number),
                          busType: busType,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
