import 'package:extra_hittest_area/extra_hittest_area.dart';
import 'package:flutter/material.dart';
import 'package:sfss/plugins/adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/sfss_widget.dart';


class TopToggle extends StatefulWidget {
  final List<String> names;
  final List<Widget> ?contents;
  final void Function(int) ?onTap;
  final int defaultIndex;

  const TopToggle({super.key, required this.names, this.contents, this.onTap, this.defaultIndex = 0});

  @override
  _TopToggleState createState() => _TopToggleState();
}
class _TopToggleState extends State<TopToggle> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: px(45,maxScale:1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < widget.names.length; i += 1) ...[
                if(i!=0) Padding(
                  padding: EdgeInsets.only(left: px(28,maxScale:1), right: px(28,maxScale:1)),
                  child: SfssWidget.text(
                    '/',
                    fontSize: px(20,maxScale:1),
                  ),
                ),
                GestureDetectorHitTestWithoutSizeLimit(
                  extraHitTestArea: EdgeInsets.all(px(10)),
                  onTap: () {
                    setState(() {
                      index = i;
                      widget.onTap!(i);
                    });
                  },
                  child: SizedBox(
                    width: px(61,maxScale:1),
                    height: px(19,maxScale:1),
                    child: Row(
                      children: [
                        Container(
                          width: px(9,maxScale:1),
                          height: px(19,maxScale:1),
                          decoration: BoxDecoration(
                            color: i==index ? SfssStyle.mainRed : Colors.transparent,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        SizedBox(width: px(4,maxScale:1)),
                        SfssWidget.text(
                          widget.names[i],
                          fontSize: px(20,maxScale:1),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        SizedBox(height: pxh(10)),
        if(widget.contents != null && index < widget.contents!.length)widget.contents![index]
      ],
    );
  }
}
