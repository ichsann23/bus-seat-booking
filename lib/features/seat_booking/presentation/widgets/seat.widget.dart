import 'package:flutter/material.dart';

import '../../domain/entities/bus_type.entity.dart';
import '../../domain/entities/seat.entity.dart';

class SeatItem extends StatelessWidget {
  final Seat seat;
  final VoidCallback onTap;
  final BusType busType;

  const SeatItem({
    super.key,
    required this.seat,
    required this.onTap,
    required this.busType,
  });

  String _getSeatLabel() {
    final rowIndex = (seat.number - 1) ~/ 4;
    final colIndex = (seat.number - 1) % 4;
    final rowLetter = String.fromCharCode(65 + rowIndex);
    final colNumber = colIndex + 1;

    return '$rowLetter$colNumber';
  }

  @override
  Widget build(BuildContext context) {
    final aspectRatio = busType == BusType.regular ? 1.0 : 0.5;

    return GestureDetector(
      onTap: seat.isBooked ? null : onTap,
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Container(
          decoration: BoxDecoration(
            color: seat.isBooked
                ? Colors.grey.shade400
                : seat.isSelected
                    ? const Color(0xFF1E3A5F)
                    : const Color(0xFFE8E8E8),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            _getSeatLabel(),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: seat.isSelected || seat.isBooked
                  ? Colors.white
                  : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
