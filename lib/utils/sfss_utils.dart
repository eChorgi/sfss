import 'package:sfss/enums/solar_term_enums.dart';

class SfssUtils {
// 计算节气
static SolarTerm getSolarTermByDate(DateTime date) {
int year = date.year;
int month = date.month;
int day = date.day;

int index = getSolarTermIndex(year, month, day);
if (index != -1) {
  return SolarTerm.values[(index - 2 + 24) % 24]; // 倒退两个节气
}

// 如果没有找到确切的节气，返回最接近的节气
return getClosestSolarTerm(date);
}

 // 获取节气序号
 static int getSolarTermIndex(int year, int month, int day) {
   DateTime date = DateTime(year, month, day);
   int days = ((date.millisecondsSinceEpoch - getBaseDate(year)) ~/ (24 * 60 * 60 * 1000)).toInt();
   if (days < 0 || days >= 365) {
     return -1;
   }
   return days ~/ 15;
 }

 // 获取基准日期
 static int getBaseDate(int year) {
   DateTime baseDate = DateTime(year, 1, 6, 2, 5, 0);
   return baseDate.millisecondsSinceEpoch;
 }

 // 获取节气名称
 static String getSolarTermByIndex(int index) {
   List<String> solarTerms = [
     "小寒", "大寒", "立春", "雨水", "惊蛰", "春分",
     "清明", "谷雨", "立夏", "小满", "芒种", "夏至",
     "小暑", "大暑", "立秋", "处暑", "白露", "秋分",
     "寒露", "霜降", "立冬", "小雪", "大雪", "冬至"
   ];
   return solarTerms[index];
 }

 // 获取最接近的节气
 static SolarTerm getClosestSolarTerm(DateTime date) {
   int year = date.year;
   List<int> sTermInfo = [
     0, 21208, 42467, 63836, 85337, 107014, 128867, 150921, 173149, 195551,
     218072, 240693, 263343, 285989, 308563, 331033, 353350, 375494, 397447,
     419210, 440795, 462224, 483532, 504758
   ];

   int baseDate = DateTime(year, 1, 6, 2, 5, 0).millisecondsSinceEpoch;
   int closestIndex = 0;
   int minDiff = double.maxFinite.toInt();

   for (int i = 0; i < sTermInfo.length; i++) {
     int offset = sTermInfo[i] * 60 * 1000;
     DateTime solarTermDate = DateTime.fromMillisecondsSinceEpoch(baseDate + offset);
     int diff = (date.millisecondsSinceEpoch - solarTermDate.millisecondsSinceEpoch).abs();
     if (diff < minDiff) {
       minDiff = diff;
       closestIndex = i;
     }
   }

   // 倒退两个节气
   closestIndex = (closestIndex - 2 + 24) % 24;

   return SolarTerm.values[closestIndex];
 }
}

void main() {
 int year = 2022;
 int month = 2;
 int day = 4;

 SolarTerm solarTerm = SfssUtils.getSolarTermByDate(DateTime(year, month, day));
 print("日期：$year-$month-$day");
 print("节气：${SfssUtils.getSolarTermByIndex(solarTerm.index)}");

 // 示例：处理 2024 年 11 月 7 日
 SolarTerm solarTerm2024 = SfssUtils.getSolarTermByDate(DateTime(2024, 12, 22));
 print("节气：${SfssUtils.getSolarTermByIndex(solarTerm2024.index)}");
}