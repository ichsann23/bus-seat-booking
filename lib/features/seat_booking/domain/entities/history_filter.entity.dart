enum HistoryFilter {
  all,
  today,
  week,
}

extension HistoryFilterX on HistoryFilter {
  String get label => switch (this) {
        HistoryFilter.all => 'All',
        HistoryFilter.today => 'Today',
        HistoryFilter.week => 'This Week',
      };
}
