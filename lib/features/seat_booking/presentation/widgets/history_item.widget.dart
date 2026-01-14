import 'package:bus_seat_booking/features/seat_booking/domain/entities/bus_type.entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../seat_booking/domain/entities/booking_history.entity.dart';

class HistoryItem extends StatelessWidget {
  final BookingHistory history;

  const HistoryItem({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd MMM yyyy, HH:mm');

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: history.busType.name == 'regular'
                      ? Colors.blue.shade50
                      : Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  history.busType.label,
                  style: TextStyle(
                    color: history.busType.name == 'regular'
                        ? Colors.blue.shade700
                        : Colors.purple.shade700,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
              Text(
                dateFormat.format(history.createdAt),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Seats: ${history.seats.join(', ')}',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${history.seats.length} seat(s)',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                'Rp ${NumberFormat('#,###', 'id_ID').format(history.totalPrice)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E3A5F),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
