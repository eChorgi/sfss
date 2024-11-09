import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfss/widgets/adaptive_widget.dart';
import 'package:sfss/plugins/widget_adapter.dart';
import 'package:sfss/widgets/heatmap_calendar.dart';
import 'package:sfss/widgets/sfss_widget.dart';

class RecordOverview extends StatefulWidget {
  const RecordOverview({super.key});

  @override
  State<RecordOverview> createState() => _RecordOverviewState();
}

class _RecordOverviewState extends State<RecordOverview> {
  int month = 1;
  @override
  Widget build(BuildContext context) {
    return AdaptiveWidget(
      uiWidth: 305, 
      uiHeight: 216, 
      builder: (context, adapter) {
        PxFunction px = adapter.px;
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(px(10.0)),
            boxShadow: [
              BoxShadow(
                color: const Color(0x26000000),
                offset: Offset(0, px(4)),
                blurRadius: px(18),
                spreadRadius: -9,
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                height: px(22),
                child: Row(
                  children: [
                    SizedBox(
                      width: px(42),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: px(22),
                          height: px(22),
                          decoration: BoxDecoration(
                            color: const Color(0xFF882F2F),
                            borderRadius: BorderRadius.circular(px(22)),
                          ),
                          child: Center(
                            child: SfssWidget.text(
                              '月',
                              fontSize: px(14),
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        )
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Spacer(flex: 3,),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                month = (month+10)%12+1;
                              });
                            },
                            child: SvgPicture.asset(
                              'assets/images/arrow_left.svg',
                              height: px(14),
                              width: px(7),
                            ),
                          ),
                          Spacer(flex: 3,),
                          SfssWidget.text(
                            ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'][month-1],
                            fontSize: px(20),
                          ),
                          Spacer(flex: 3,),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                month = (month)%12+1;
                              });
                            },
                            child: SvgPicture.asset(
                              'assets/images/arrow_right.svg',
                              height: px(14),
                              width: px(7),
                            ),
                          ),
                          Spacer(flex: 3,),
                        ],
                      )
                    )
                  ],
                ),
              ),
              SizedBox(height: px(23),),
              SfssWidget.text(
                '记录情况',
                fontSize: px(16),
              ),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: px(20),
                    ),
                    SizedBox(
                      width: px(54),
                      height: px(64),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SfssWidget.text(
                                '16',
                                fontSize: px(30),
                              ),
                              SizedBox(width: px(10),),
                              Padding(
                                padding: EdgeInsets.only(bottom: px(4.0)),
                                child: SfssWidget.text(
                                  '天',
                                  fontSize: px(14),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SfssWidget.text(
                                '64',
                                fontSize: px(30),
                              ),
                              SizedBox(width: px(10),),
                              Padding(
                                padding: EdgeInsets.only(bottom: px(4.0)),
                                child: SfssWidget.text(
                                  '顿',
                                  fontSize: px(14),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          height: px(124),
                          width: px(186),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(px(10)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x26000000),
                                offset: Offset(0, px(4)),
                                blurRadius: px(18),
                                spreadRadius: -9,
                              ),
                            ],
                          ),
                          child: HeatmapCalendar(
                            year: 2024, 
                            month: month, 
                            count: [
                              0,0,
                              0,0,0,0,0,0,0,
                              3,2,2,3,3,2,2,
                              3,3,2,1,3,3,3,
                              3,2,2,3,3,2
                            ]
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )

        );
        
      }
    );
  }
}