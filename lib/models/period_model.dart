import 'package:intl/intl.dart';
import '../data/name_maps.dart';

class Period {
  final String day; // ⬅️ Add this
  final String time;
  final String batch;
  final String subject;
  final String room;

  Period({
    required this.day,
    required this.time,
    required this.batch,
    required this.subject,
    required this.room,
  });

  String get subjectAbbreviation {
    final parts = subject.split('(');
    return parts[0].trim();
  }

  String get facultyInitials {
    final match = RegExp(r'\((.*?)\)').firstMatch(subject);
    return match != null ? match.group(1)! : "Unknown";
  }

  String get subjectFullName {
    return subjectFullNames[subjectAbbreviation] ?? subjectAbbreviation;
  }

  String get facultyFullName {
    return facultyFullNames[facultyInitials] ?? facultyInitials;
  }

  // ✅ FINAL STATUS LOGIC
  String get lectureStatus {
    final now = DateTime.now();
    final currentDay = DateFormat('EEEE').format(now); // e.g. Monday

    final startParts = time.split(' - ')[0].split(':');
    final endParts = time.split(' - ')[1].split(':');

    final startHour = int.parse(startParts[0]);
    final startMinute = int.parse(startParts[1]);
    final endHour = int.parse(endParts[0]);
    final endMinute = int.parse(endParts[1]);

    final todayStart = DateTime(
        now.year, now.month, now.day, startHour, startMinute);
    final todayEnd = DateTime(now.year, now.month, now.day, endHour, endMinute);

    final weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ];

    final todayIndex = weekdays.indexOf(currentDay);
    final periodIndex = weekdays.indexOf(day);

    if (periodIndex < todayIndex) return 'Completed';
    if (periodIndex > todayIndex) return 'Upcoming';

    // Same day
    if (now.isBefore(todayStart)) return 'Upcoming';
    if (now.isAfter(todayEnd)) return 'Completed';
    return 'Started';
  }
  DateTime get startTime {
    try {
      final startStr = time.split('-')[0].trim(); // "9:20"
      final parts = startStr.split(':');
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);

      final now = DateTime.now();
      return DateTime(now.year, now.month, now.day, hour, minute);
    } catch (_) {
      return DateTime.now();
    }
  }

}