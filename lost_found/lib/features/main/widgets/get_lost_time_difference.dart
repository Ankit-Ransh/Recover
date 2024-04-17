import 'package:intl/intl.dart';

String getLostTimeDifference(
  String? lostDate,
  String? lostTime,
  DateTime updatedAt,
) {
  String currentTime = DateFormat('yyyyMMdd').format(DateTime.now());

  if (lostDate == null ||
      lostTime == null ||
      lostDate == "" ||
      lostTime == "") {
    return "";
  }

  int postedYear = int.parse(lostDate.substring(6));
  int currentYear = int.parse(currentTime.substring(0, 4));

  if (postedYear != currentYear) {
    if (currentYear - postedYear == 1) {
      return '${currentYear - postedYear} year ago';
    } else {
      return '${currentYear - postedYear} years ago';
    }
  }

  int postedMonth = int.parse(lostDate.substring(3, 5));
  int currentMonth = int.parse(currentTime.substring(4, 6));

  if (postedMonth != currentMonth) {
    if (currentMonth - postedMonth == 1) {
      return '${currentMonth - postedMonth} month ago';
    } else {
      return '${currentMonth - postedMonth} months ago';
    }
  }

  int postedDate = int.parse(lostDate.substring(0, 2));
  int currentDate = int.parse(currentTime.substring(6));

  if (currentDate - postedDate < 1) {
    currentTime = DateFormat('hh:mm').format(DateTime.now());

    int postedHour = 0;
    if (lostTime[1] == ':') {
      postedHour = int.parse(lostTime.substring(0, 1));
    } else {
      postedHour = int.parse(lostTime.substring(0, 2));
    }

    int currentHour = int.parse(currentTime.substring(0, 2));

    if (currentHour == postedHour) {
      int postedMin = 0;
      if (lostTime[1] == ':') {
        postedMin = int.parse(lostTime.substring(2, 4));
      } else {
        postedMin = int.parse(lostTime.substring(3, 5));
      }

      int currentMin = int.parse(currentTime.substring(2));

      if ((currentMin - postedMin).abs() == 1) {
        return '${(currentMin - postedMin).abs()} min ago';
      } else {
        return '${(currentMin - postedMin).abs()} mins ago';
      }
    } else {
      if ((currentHour - postedHour).abs() == 1) {
        return '${(currentHour - postedHour).abs()} hour ago';
      } else {
        return '${(currentHour - postedHour).abs()} hours ago';
      }
    }
  }

  return '${currentDate - postedDate} days ago';
}
