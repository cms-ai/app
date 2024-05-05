enum FilterType { toDay, day, week, year }

extension FilterTypeExt on FilterType {
  String getTitle() {
    switch (this) {
      case FilterType.toDay:
        return "Today";
      case FilterType.day:
        return "Week";
      case FilterType.week:
        return "Month ";
      case FilterType.year:
        return "Year";
    }
  }
}
