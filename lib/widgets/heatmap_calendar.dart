import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfss/pages/home/wigets/adaptive_widget.dart';
import 'package:sfss/plugins/widget_adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/sfss_widget.dart';

class HeatmapCalendar extends StatefulWidget {
  final int year;
  final int month;
  final List<int> count;
  final List<Color> colors;
  HeatmapCalendar({super.key, required this.year, required this.month, required this.count, List<Color>? colors})
      : colors = colors ?? [Color(0xFFE3E3E3), Color(0xFFC9A1A1), Color(0xFFAF7272), SfssStyle.mainRed];

  @override
  State<HeatmapCalendar> createState() => _HeatmapCalendarState();
}

class _HeatmapCalendarState extends State<HeatmapCalendar> {
  late DateTime firstDay;
  late int monthLength;
  late int monthStartWeekday;
  late List<List<int>> weeks;

  @override
  void initState() {
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    firstDay = DateTime(widget.year, widget.month, 1);
    monthLength = DateTime(widget.year, widget.month + 1, 0).day;
    if(widget.count.length < monthLength) {
      widget.count.addAll(List.filled(monthLength - widget.count.length, 0));
    }
    monthStartWeekday = firstDay.weekday == 7 ? 0 : firstDay.weekday;
    weeks = [];
    for (int i = 0; i < 7; i+=1) {
      weeks.add([]);
    }
    int p = monthStartWeekday;
    for(int i = 0; i < monthStartWeekday; i+=1) {
      weeks[i].add(-1);
    }
    for(int i = 0; i < monthLength; i+=1) {
      weeks[p].add(widget.count[i]);
      p = (p+1)%7;
    }
    return AdaptiveWidget(
      uiWidth: 186, uiHeight: 124,
      builder: (context, adapter) {
        // PxFunction px = adapter.px;
        var pxfit = adapter.px;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int weekday = 0; weekday < 7; weekday+=1)
              Padding(
                padding: weekday==0?const EdgeInsets.all(0.0):EdgeInsets.only(left: pxfit(10)),
                child: Column(
                  children: [
                    SfssWidget.text(
                      ['日', '一', '二', '三', '四', '五', '六'][weekday],
                      fontSize: pxfit(11),
                      color: SfssStyle.mainGrey,
                    ),
                    SizedBox(height: pxfit(6)),
                    for (int i = 0; i < weeks[weekday].length; i+=1)
                      
                      Padding(
                        padding: i==0?const EdgeInsets.all(0.0):EdgeInsets.only(top: pxfit(4)),
                        child: weeks[weekday][i] == -1?
                        SizedBox(
                          width: pxfit(12),
                          height: pxfit(12),
                        ):
                        Container(
                          width: pxfit(12),
                          height: pxfit(12),
                          decoration: BoxDecoration(
                            color: widget.colors[weeks[weekday][i]],
                            borderRadius: BorderRadius.circular(pxfit(2)),
                          ),
                        ),
                      ),
                  ],
                ),
              )
          ],
        );
      }
    );
  }
}