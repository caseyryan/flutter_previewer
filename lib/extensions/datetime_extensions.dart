import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String toDateOnly([
    bool convertToLocal = true,
  ]) {
    var thisDate = this;
    if (convertToLocal) {
      if (thisDate.isUtc) {
        thisDate = thisDate.toLocal();
      }
    }
    return DateFormat('dd MMMM, yyyy', 'ru_RU').format(thisDate);
  }

  String toTimeOnly([
    bool convertToLocal = true,
  ]) {
    var thisDate = this;
    if (convertToLocal) {
      if (thisDate.isUtc) {
        thisDate = thisDate.toLocal();
      }
    }
    return DateFormat('hh:mm', 'ru_RU').format(thisDate);
  }

  String toPostDate([
    bool convertToLocal = true,
    bool allowTodayWord = true,
  ]) {
    var thisDate = this;
    if (convertToLocal) {
      if (thisDate.isUtc) {
        thisDate = thisDate.toLocal();
      }
    }
    if (allowTodayWord) {
      if (isToday) {
        return DateFormat('Сегодня, в HH:mm', 'ru_RU').format(thisDate);
      } else if (isTomorrow) {
        return DateFormat('Завтра, в HH:mm', 'ru_RU').format(thisDate);
      }
    }
    return DateFormat('dd MMMM yyyy в HH:mm', 'ru_RU').format(thisDate);
  }

  String toVisitDateTime() {
    if (isToday) {
      return DateFormat('Сегодня, в HH:mm', 'ru_RU').format(this);
    } else if (isYesterDay) {
      return DateFormat('Вчера, в HH:mm', 'ru_RU').format(this);
    }
    return DateFormat('dd MMMM yyyy в HH:mm', 'ru_RU').format(this);
  }

  bool get isToday {
    DateTime now = DateTime.now();
    if (isUtc) {
      now = now.toUtc();
    }
    return now.day == day && now.month == month && now.year == year;
  }

  bool get isTomorrow {
    DateTime now = DateTime.now();
    if (isUtc) {
      now = now.toUtc();
    }
    return now.day + 1 == day && now.month == month && now.year == year;
  }

  bool get isYesterDay {
    DateTime now = DateTime.now();
    if (isUtc) {
      now = now.toUtc();
    }
    return now.day - 1 == day && now.month == month && now.year == year;
  }
}
