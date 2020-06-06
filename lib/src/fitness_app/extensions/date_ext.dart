extension DateExt on DateTime {
  static List<DateTime> getRandomDates(int length) {
    DateTime now = DateTime.now();

    List<DateTime> datesBefore = [];
    List<DateTime> datesAfter = [];

    for (int i = 0; i < length; i++) {
      datesAfter.add(now.add(Duration(days: i + 1)));
      datesBefore.add(now.subtract(Duration(days: i + 1)));
    }

    datesBefore.add(now);
    datesBefore.addAll(datesAfter);
    datesBefore.sort();

    return datesBefore;
  }

  static String getDayStr(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'Monday';
        break;
      case 2:
        return 'Tuesday';
        break;
      case 3:
        return 'Wednesday';
        break;
      case 4:
        return 'Thursday';
        break;
      case 5:
        return 'Friday';
        break;
      case 6:
        return 'Saturday';
        break;
      case 7:
        return 'Sunday';
        break;
      default:
        return 'N/A';
        break;
    }
  }
}
