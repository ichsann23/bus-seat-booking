enum BusType { regular, express }

extension BusTypeX on BusType {
  int get price => this == BusType.regular ? 85000 : 150000;
  int get totalSeats => this == BusType.regular ? 20 : 12;
  String get label =>
      this == BusType.regular ? 'Regular Class' : 'Express Class';
  String get storageKey => name;
}
