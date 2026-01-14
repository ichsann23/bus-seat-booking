import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/provider/shared_preferences_provider.dart';
import '../../data/datasources/seat_local_datasource.dart';
import '../../data/repositories/seat_repository_impl.dart';
import '../../domain/repositories/seat_repository.dart';

final seatRepositoryProvider = Provider<SeatRepository>((ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  final local = SeatLocalDataSource(prefs);
  return SeatRepositoryImpl(local);
});
