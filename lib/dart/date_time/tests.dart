var now = DateTime.now();
var start = DateTime(now.year, now.month, now.day);
var end = start.add(const Duration(days: 10));

var activeDates = [
  start.add(const Duration(days: 0)),
  start.add(const Duration(days: 2)),
  start.add(const Duration(days: 4)),
  start.add(const Duration(days: 5)),
  start.add(const Duration(days: 7)),
  start.add(const Duration(days: 9)),
  start.add(const Duration(days: 10)),
];

void main() {

  print(getBlackoutList(
    startDate: start,
    endDate: end,
    activeDates: activeDates,
  ));
}

List<DateTime> getBlackoutList({
  required DateTime startDate,
  required DateTime endDate,
  required List<DateTime> activeDates,
}) {
  List<DateTime> blackoutDates = [];
  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    var date = DateTime(
        startDate.year,
        startDate.month,
        startDate.day + i);
    if (activeDates.contains(date))
      continue;

    blackoutDates.add(date);
  }
  return blackoutDates;
}

