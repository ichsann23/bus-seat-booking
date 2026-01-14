import 'package:bus_seat_booking/features/seat_booking/domain/entities/bus_type.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../widgets/bus_type_selector.widget.dart';
import '../widgets/seat_grid.widget.dart';
import '../provider/seat_booking.riverpod.dart';
import 'history_booking.page.dart';

class SeatBookingPage extends ConsumerWidget {
  const SeatBookingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(seatBookingControllerProvider);
    final controller = ref.read(seatBookingControllerProvider.notifier);

    final hasSelectedSeats = state.seats.any((seat) => seat.isSelected);
    final selectedCount = state.seats.where((s) => s.isSelected).length;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Bus Seat Booking',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E3A5F).withValues(alpha: .1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFF1E3A5F).withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: IconButton(
              tooltip: 'History',
              icon: const Icon(
                Icons.receipt_long_rounded,
                color: Color(0xFF1E3A5F),
                size: 22,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HistoryPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: BusTypeSelector(
              value: state.busType,
              onChanged: controller.changeBus,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCompactLegend(
                  color: const Color(0xFF1E3A5F),
                  label: 'Selected',
                ),
                _buildCompactLegend(
                  color: const Color(0xFFE8E8E8),
                  label: 'Available',
                  textColor: Colors.black87,
                ),
                _buildCompactLegend(
                  color: Colors.grey.shade400,
                  label: 'Booked',
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.shade200,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: state.busType.name == 'regular'
                                ? Colors.blue.shade50
                                : Colors.purple.shade50,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            state.busType.label,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: state.busType.name == 'regular'
                                  ? Colors.blue.shade700
                                  : Colors.purple.shade700,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Rp ${NumberFormat('#,###', 'id_ID').format(state.busType.price)}/seat',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: SeatGrid(
                          busType: state.busType,
                          seats: state.seats,
                          onTapSeat: controller.toggleSeat,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .05),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Price',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Rp ${NumberFormat('#,###', 'id_ID').format(state.totalPrice)}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E3A5F),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (hasSelectedSeats)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E3A5F)
                                  .withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.event_seat_rounded,
                                  size: 16,
                                  color: Color(0xFF1E3A5F),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '$selectedCount',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1E3A5F),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: hasSelectedSeats
                            ? () {
                                controller.confirmBooking();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Row(
                                      children: [
                                        const Icon(
                                          Icons.check_circle_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            '$selectedCount seat${selectedCount > 1 ? 's' : ''} booked successfully!',
                                          ),
                                        ),
                                      ],
                                    ),
                                    duration: const Duration(seconds: 2),
                                    backgroundColor: const Color(0xFF1E3A5F),
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E3A5F),
                          disabledBackgroundColor: Colors.grey.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          hasSelectedSeats ? 'Confirm Booking' : 'Select Seats',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompactLegend({
    required Color color,
    required String label,
    Color? textColor,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: textColor ?? Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}
