import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/booking_history.entity.dart';
import '../../domain/entities/bus_type.entity.dart';

class SeatLocalDataSource {
  final SharedPreferences prefs;
  SeatLocalDataSource(this.prefs);

  List<int> getBookedSeats(String key) {
    return prefs.getStringList(key)?.map(int.parse).toList() ?? [];
  }

  Future<void> saveBookedSeats(String key, List<int> seats) async {
    await prefs.setStringList(
      key,
      seats.map((e) => e.toString()).toList(),
    );
  }

  Future<void> resetSeats(String key) async {
    await prefs.remove(key);
  }

  static const historyKey = 'booking_history';

  Future<void> saveHistory(BookingHistory history) async {
    final list = prefs.getStringList(historyKey) ?? [];
    list.add(jsonEncode({
      'busType': history.busType.name,
      'seats': history.seats,
      'price': history.totalPrice,
      'time': history.createdAt.toIso8601String(),
    }));
    await prefs.setStringList(historyKey, list);
  }

  List<BookingHistory> loadHistory() {
    final list = prefs.getStringList(historyKey) ?? [];
    return list.map((e) {
      final map = jsonDecode(e) as Map<String, dynamic>;
      return BookingHistory(
        busType: BusType.values.byName(map['busType'] as String),
        seats: List<String>.from(map['seats']),
        totalPrice: map['price'] as int,
        createdAt: DateTime.parse(map['time'] as String),
      );
    }).toList();
  }

  Future<void> clearHistory() async {
    await prefs.remove(historyKey);
  }
}
