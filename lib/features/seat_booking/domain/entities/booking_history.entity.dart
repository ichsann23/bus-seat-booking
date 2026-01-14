import 'package:bus_seat_booking/features/seat_booking/domain/entities/bus_type.entity.dart';

class BookingHistory {
  final BusType busType;
  final List<String> seats;
  final int totalPrice;
  final DateTime createdAt;

  const BookingHistory({
    required this.busType,
    required this.seats,
    required this.totalPrice,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'busType': busType.name,
      'seats': seats,
      'totalPrice': totalPrice,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory BookingHistory.fromJson(Map<String, dynamic> json) {
    return BookingHistory(
      busType: BusType.values.firstWhere(
        (e) => e.name == json['busType'],
        orElse: () => BusType.regular,
      ),
      seats: List<String>.from(json['seats']),
      totalPrice: json['totalPrice'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  BookingHistory copyWith({
    BusType? busType,
    List<String>? seats,
    int? totalPrice,
    DateTime? createdAt,
  }) {
    return BookingHistory(
      busType: busType ?? this.busType,
      seats: seats ?? this.seats,
      totalPrice: totalPrice ?? this.totalPrice,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
