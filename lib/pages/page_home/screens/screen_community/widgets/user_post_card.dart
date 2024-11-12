import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfss/widgets/adaptive_widget.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/fit_width_image.dart';
import 'package:sfss/widgets/sfss_widget.dart';

class UserPostCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String userName;
  final String avatarUrl;
  final int likeCount;
  const UserPostCard({super.key, required this.imageUrl, required this.title, required this.userName, required this.avatarUrl, required this.likeCount});

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
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(px(8)),
            color: Colors.white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(px(10.0, maxScale: 1.5, minScale: 1.0)),
                ),
                child: FitWidthImage.asset(
                  widget.imageUrl
                )
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
                              width: px(14, maxScale: 1.5, minScale: 1.0),
                              height: px(13, maxScale: 1.5, minScale: 1.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(px(4, maxScale:1.5)),
                                color: SfssStyle.mainRed,
                              ),
                              child: Center(
                                child: SfssWidget.text(
                                  '谱',
                                  fontSize: px(9, maxScale: 1.5, minScale: 1.0),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ),
                        TextSpan(
                          text: widget.title, 
                          style: TextStyle(
                            color: SfssStyle.mainGrey,
                            fontSize: px(12, maxScale: 1.5, minScale: 1.0),
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
                              Container(
                                width: px(13, maxScale: 1.5),
                                height: px(13, maxScale: 1.5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(widget.avatarUrl)
                                  )
                                ),
                              ),
                              SizedBox(width: px(3, maxScale: 1.5)),
                              Expanded(
                                child: SfssWidget.text(
                                  widget.userName,
                                  fontSize: px(9, maxScale: 1.5, minScale: 1.0),
                                  color: const Color(0xCC4A5568),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: px(6, maxScale: 1.5)),
                        SizedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: px(0.8, maxScale: 1.5)),
                                child: SvgPicture.asset(
                                  'assets/images/home/like.svg',
                                  width: px(10, maxScale: 1.5),
                                  height: px(10, maxScale: 1.5),
                                ),
                              ),
                              SizedBox(width: px(3, maxScale: 1.5)),
                              SfssWidget.text(
                                widget.likeCount.toString(),
                                fontFamily: '',
                                fontSize: px(10, maxScale: 1.5, minScale: 1.0),
                                color: const Color(0xCC4A5568),
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
          ),
        );
      },
    );
  }
}