import 'package:flutter/material.dart';
//
// class Schedule {
//   final DateTime date;
//   final TimeOfDay start;
//   final TimeOfDay end;
//
//   Schedule(this.date, this.start, this.end);
//
//   List<DateTime> splitRanges() {
//     final startDateTime = DateTime(date.year, date.month, date.day, start.hour, start.minute);
//     final endDateTime = DateTime(date.year, date.month, date.day, end.hour, end.minute);
//
//     List<DateTime> dates = [endDateTime, startDateTime];
//     for (int i = 0; i < endDateTime.difference(startDateTime).inHours; i++) {
//       final date = endDateTime.subtract(Duration(hours: i));
//       dates.add(date);
//     }
//     dates.sort((a, b) => a.compareTo(b));
//     return dates;
//   }
// }

extension DateTimeRangeSplit on DateTimeRange {
  List<DateTimeRange> splitToHours() {
    DateTimeRange first = DateTimeRange(
      start: start,
      end: start.add(const Duration(hours: 1)),
    );
    List<DateTimeRange> ranges = [first];
    for (int i = 1; i < duration.inHours; i++) {
      final last = ranges.last;
      final newRange = DateTimeRange(
        start: last.end,
        end: last.end.add(const Duration(hours: 1)),
      );

      ranges.add(newRange);
    }
    return ranges;
  }
}

class UserModel {
  final int id;
  final List<DateTimeRange> schedules;

  UserModel(this.id, this.schedules);

  List<DateTimeRange> get allAvailableTimes =>
      schedules.expand((element) => element.splitToHours()).toSet().toList();
}

final usersSchedule = [
  UserModel(
    1,
    [
      DateTimeRange(
        start: DateTime.utc(2022, 5, 1, 8),
        end: DateTime.utc(2022, 5, 1, 12),
      ),
      DateTimeRange(
        start: DateTime.utc(2022, 5, 1, 10),
        end: DateTime.utc(2022, 5, 1, 13),
      ),
      DateTimeRange(
        start: DateTime.utc(2022, 5, 1, 13),
        end: DateTime.utc(2022, 5, 1, 17),
      ),
    ],
  ),
  UserModel(
    2,
    [
      DateTimeRange(
        start: DateTime.utc(2022, 5, 2, 8),
        end: DateTime.utc(2022, 5, 2, 12),
      ),
      DateTimeRange(
        start: DateTime.utc(2022, 5, 1, 10),
        end: DateTime.utc(2022, 5, 1, 13),
      ),
      DateTimeRange(
        start: DateTime.utc(2022, 5, 1, 13),
        end: DateTime.utc(2022, 5, 1, 18),
      ),
    ],
  ),
  UserModel(
    3,
    [
      DateTimeRange(
        start: DateTime.utc(2022, 5, 2, 8),
        end: DateTime.utc(2022, 5, 2, 12),
      ),
      DateTimeRange(
        start: DateTime.utc(2022, 5, 3, 13),
        end: DateTime.utc(2022, 5, 3, 18),
      ),
    ],
  ),
  UserModel(
    4,
    [
      DateTimeRange(
        start: DateTime.utc(2022, 5, 1, 10),
        end: DateTime.utc(2022, 5, 1, 13),
      ),
      DateTimeRange(
        start: DateTime.utc(2022, 5, 1, 13),
        end: DateTime.utc(2022, 5, 1, 18),
      ),
    ],
  ),
  UserModel(
    5,
    [
      DateTimeRange(
        start: DateTime.utc(
          2022,
          5,
          2,
          8,
        ),
        end: DateTime.utc(2022, 5, 2, 12),
      ),
      DateTimeRange(
        start: DateTime.utc(2022, 5, 1, 10),
        end: DateTime.utc(2022, 5, 1, 13),
      ),
      DateTimeRange(
        start: DateTime.utc(2022, 5, 1, 13),
        end: DateTime.utc(2022, 5, 1, 18),
      ),
    ],
  ),
  UserModel(
    6,
    [
      DateTimeRange(
        start: DateTime.utc(2022, 6, 2, 8),
        end: DateTime.utc(2022, 6, 2, 12),
      ),
      DateTimeRange(
        start: DateTime.utc(2022, 6, 1, 10),
        end: DateTime.utc(2022, 6, 1, 13),
      ),
      DateTimeRange(
        start: DateTime.utc(2022, 6, 1, 13),
        end: DateTime.utc(2022, 6, 1, 18),
      ),
    ],
  ),
  UserModel(
    7,
    [
      DateTimeRange(
        start: DateTime.utc(2022, 6, 2, 8),
        end: DateTime.utc(2022, 6, 2, 12),
      ),
      DateTimeRange(
        start: DateTime.utc(2022, 6, 1, 10),
        end: DateTime.utc(2022, 6, 1, 13),
      ),
      DateTimeRange(
        start: DateTime.utc(2022, 6, 1, 13),
        end: DateTime.utc(2022, 6, 1, 18),
      ),
    ],
  ),
  UserModel(
    8,
    [
      DateTimeRange(
        start: DateTime.utc(2022, 6, 2, 8),
        end: DateTime.utc(2022, 6, 2, 12),
      ),
      DateTimeRange(
        start: DateTime.utc(2022, 6, 1, 10),
        end: DateTime.utc(2022, 6, 1, 13),
      ),
      DateTimeRange(
        start: DateTime.utc(2022, 6, 1, 13),
        end: DateTime.utc(2022, 6, 1, 18),
      ),
    ],
  ),
  UserModel(
    9,
    [
      DateTimeRange(
        start: DateTime.utc(2022, 6, 2, 8),
        end: DateTime.utc(2022, 6, 2, 12),
      ),
      DateTimeRange(
        start: DateTime.utc(2022, 6, 1, 10),
        end: DateTime.utc(2022, 6, 1, 13),
      ),
      DateTimeRange(
        start: DateTime.utc(2022, 6, 1, 13),
        end: DateTime.utc(2022, 6, 1, 18),
      ),
    ],
  ),
  UserModel(
    10,
    [
      DateTimeRange(
        start: DateTime.utc(2022, 6, 2, 8),
        end: DateTime.utc(2022, 6, 2, 12),
      ),
      DateTimeRange(
        start: DateTime.utc(2022, 6, 1, 10),
        end: DateTime.utc(2022, 6, 1, 13),
      ),
      DateTimeRange(
        start: DateTime.utc(2022, 6, 1, 13),
        end: DateTime.utc(2022, 6, 1, 18),
      ),
    ],
  ),
];
