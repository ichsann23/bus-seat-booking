import 'package:flutter/material.dart';

import '../../domain/entities/bus_type.entity.dart';

class BusTypeSelector extends StatelessWidget {
  final BusType value;
  final ValueChanged<BusType> onChanged;

  const BusTypeSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: BusType.values.map((busType) {
        return Expanded(
          child: _RadioOption(
            label: busType.label,
            isSelected: value == busType,
            onTap: () => onChanged(busType),
          ),
        );
      }).toList(),
    );
  }
}

class _RadioOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _RadioOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color:
                    isSelected ? const Color(0xFF1E3A5F) : Colors.grey.shade400,
                width: 2,
              ),
            ),
            child: Center(
              child: isSelected
                  ? Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF1E3A5F),
                      ),
                    )
                  : null,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              color: isSelected ? Colors.black : Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
