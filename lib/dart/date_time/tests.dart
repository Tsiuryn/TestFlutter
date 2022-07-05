import 'package:intl/intl.dart';

var now = DateTime.now();
var start = DateTime(now.year, now.month, now.day);
var end = start.add(const Duration(days: 10));
var ownFormatter = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'");

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
  // print(getBlackoutList(
  //   startDate: start,
  //   endDate: end,
  //   activeDates: activeDates,
  // ));
  //
  // print(now);
  // print(start);
  // print(isEqualDates(now, start));

  print(DateFormat('yyyy_MM_dd').format(now));
  print(DateFormat().format(now));
  print(now.toIso8601String());
  print(now.toUtc());

  print(ownFormatter.format(now));
}

List<DateTime> getBlackoutList({
  required DateTime startDate,
  required DateTime endDate,
  required List<DateTime> activeDates,
}) {
  List<DateTime> blackoutDates = [];
  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    var date = DateTime(startDate.year, startDate.month, startDate.day + i);
    if (activeDates.contains(date)) continue;

    blackoutDates.add(date);
  }
  return blackoutDates;
}

bool isEqualDates(DateTime start, DateTime end) {
  if (end.difference(start).inDays < 1) {
    return true;
  }
  return false;
}
