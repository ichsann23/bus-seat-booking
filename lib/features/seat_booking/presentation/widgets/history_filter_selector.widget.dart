import 'package:flutter/material.dart';
import '../../domain/entities/history_filter.entity.dart';

class HistoryFilterSelector extends StatelessWidget {
  final HistoryFilter value;
  final ValueChanged<HistoryFilter> onChanged;

  const HistoryFilterSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: HistoryFilter.values.map((filter) {
          final isSelected = value == filter;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(filter),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color:
                      isSelected ? const Color(0xFF1E3A5F) : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color:
                                const Color(0xFF1E3A5F).withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _getIcon(filter),
                      size: 18,
                      color: isSelected ? Colors.white : Colors.grey.shade600,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      filter.label,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w500,
                        color: isSelected ? Colors.white : Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  IconData _getIcon(HistoryFilter filter) {
    switch (filter) {
      case HistoryFilter.all:
        return Icons.list_rounded;
      case HistoryFilter.today:
        return Icons.today_rounded;
      case HistoryFilter.week:
        return Icons.date_range_rounded;
    }
  }
}
