class Seat {
  final int number;
  final bool isBooked;
  final bool isSelected;

  const Seat({
    required this.number,
    this.isBooked = false,
    this.isSelected = false,
  });

  Seat copyWith({
    bool? isBooked,
    bool? isSelected,
  }) {
    return Seat(
      number: number,
      isBooked: isBooked ?? this.isBooked,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
