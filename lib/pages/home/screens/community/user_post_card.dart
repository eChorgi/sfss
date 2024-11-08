import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfss/pages/home/wigets/adaptive_widget.dart';
import 'package:sfss/plugins/widget_adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/sfss_widget.dart';

class UserPostCard extends StatefulWidget {
  const UserPostCard({super.key});

  @override
  State<UserPostCard> createState() => _UserPostCardState();
}

class _UserPostCardState extends State<UserPostCard> {

  @override
  Widget build(BuildContext context) {
    return AdaptiveWidget(
      uiHeight: 228,
      uiWidth: 152,
      builder: (context, adapter) {
        dynamic px = adapter.px;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(px(10.0, maxScale: 1.5, minScale: 1.0)),
              ),
              child: Image.asset(
                'assets/images/dish_yxqz.png',
                fit: BoxFit.fitWidth,
                width: double.infinity,
                height: 100,
              ),
            ),
            SizedBox(height: px(3, maxScale: 1.5)),
            Padding(
              padding: EdgeInsets.only(left: px(6, maxScale: 1.5), right: px(6, maxScale: 1.5)),
              child: Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: EdgeInsets.only(right: px(3, maxScale: 1.5, minScale: 1.0)),
                          child: Container(
                            width: px(13, maxScale: 1.5, minScale: 1.0),
                            height: px(12, maxScale: 1.5, minScale: 1.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(px(4)),
                              color: SfssStyle.mainRed,
                            ),
                            child: Center(
                              child: SfssWidget.text(
                                '谱',
                                fontSize: px(8, maxScale: 1.5, minScale: 1.0),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ),
                      TextSpan(
                        text: '绝绝子美味的饭大家快来学绝绝子美味的饭大家快来学绝绝子美味的饭大家快来学绝绝子美味的饭大家快来学', 
                        style: TextStyle(
                          color: SfssStyle.mainGrey,
                          fontSize: px(10, maxScale: 1.5, minScale: 1.0),
                          fontFamily: SfssStyle.mainFont,
                        ),
                      ),
                    ],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  strutStyle: const StrutStyle(
                    height: 1.3,
                  ),
                )
              ),
            ),
            SizedBox(height: px(0, maxScale: 1.5)),
            Padding(
              padding: EdgeInsets.only(left: px(6, maxScale: 1.5), right: px(6, maxScale: 1.5)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: px(22, maxScale: 1.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/Ellipse 2.png',
                              width: px(15, maxScale: 1.5),
                              height: px(15, maxScale: 1.5),
                            ),
                            SizedBox(width: px(5, maxScale: 1.5)),
                            Expanded(
                              child: SfssWidget.text(
                                '绝绝子123213212312313',
                                fontSize: px(10, maxScale: 1.5, minScale: 1.0),
                                color: SfssStyle.mainGrey,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: px(0.8, maxScale: 1.5)),
                              child: SvgPicture.asset(
                                'assets/images/home/like.svg',
                                width: px(12, maxScale: 1.5),
                                height: px(12, maxScale: 1.5),
                              ),
                            ),
                            SizedBox(width: px(3, maxScale: 1.5)),
                            SfssWidget.text(
                              '204',
                              fontFamily: '',
                              fontSize: px(10, maxScale: 1.5, minScale: 1.0),
                              color: SfssStyle.mainGrey,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}