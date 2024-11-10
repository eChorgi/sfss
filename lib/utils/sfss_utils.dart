import 'package:sfss/enums/solar_term_enums.dart';

class SfssUtils {
  
  static SolarTerm getSolarTermByDate(DateTime date) {
    int year = date.year;
    int month = date.month;
    int day = date.day;
    int hour = date.hour;
    int minute = date.minute;
    int second = date.second;
    int millisecond = date.millisecond;
    int microsecond = date.microsecond;
    int y = year;
    int m = month;
    int d = day;
    int h = hour;
    int min = minute;
    int s = second;
    int ms = millisecond;
    int us = microsecond;
    int c = 0;
    List<int> sTermInfo = [
      0, 21208, 42467, 63836, 85337, 107014, 128867, 150921, 173149, 195551,
      218072, 240693, 263343, 285989, 308563, 331033, 353350, 375494, 397447,
      419210, 440795, 462224, 483532, 504758
    ];
    int termIndex = ((y - 1900) * 365.2422 + (m - 1) * 30.44 + d - 1) ~/ 15.2184;
    int term = sTermInfo[termIndex % 24];
    int baseDate = DateTime(y, 1, 6, 2, 5, 0).millisecondsSinceEpoch;
    int offset = term * 60 * 1000;
    DateTime solarTermDate = DateTime.fromMillisecondsSinceEpoch(baseDate + offset);

    if (date.isBefore(solarTermDate)) {
      termIndex = (termIndex - 1) % 24;
      }
    
     return SolarTerm.values[termIndex];
    }
}