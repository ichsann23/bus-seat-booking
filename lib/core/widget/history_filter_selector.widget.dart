enum HistoryFilter {
  all,
  today,
  week;

  String get label {
    switch (this) {
      case HistoryFilter.all:
        return 'All';
      case HistoryFilter.today:
        return 'Today';
      case HistoryFilter.week:
        return 'This Week';
    }
  }
}
