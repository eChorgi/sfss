import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfss/plugins/adapter.dart';
import 'package:sfss/widgets/fit_width_image.dart';
import 'package:sfss/widgets/sfss_widget.dart';

class ImageSwiper extends StatefulWidget {
  final List<String> imageUrls;
  const ImageSwiper({super.key, required this.imageUrls});
  
  @override
  State<ImageSwiper> createState() => _ImageSwiperState();
}

class _ImageSwiperState extends State<ImageSwiper> {
  int imagePageIndex = 0;
  double maxHeight = 0;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraints){
        var widgetList = <Widget>[];
        for (int i = 0; i < widget.imageUrls.length; i += 1) {
          var img = FitWidthImage.asset(
            widget.imageUrls[i],
            onLoad: (imgW, imgH) {
              var widgetH = imgH!*boxConstraints.maxWidth/imgW!;
              var widgetW = boxConstraints.maxWidth;
              if(widgetH! > 4.0/3.0*boxConstraints.maxWidth){
                widgetH = 4.0/3.0*boxConstraints.maxWidth;
              }
              if(widgetH! < 3.0/4.0*boxConstraints.maxWidth) {
                widgetH = 3.0/4.0*boxConstraints.maxWidth;
              }
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                setState(() {
                  maxHeight = max(maxHeight, widgetH);
                });
              });
              // setState(() {
              //   maxHeight = max(maxHeight, widgetH);
              // });
            }
          );
          widgetList.add(img);
        }
        return SizedBox(
          height: maxHeight,
          child: Stack(
            children: [
              SizedBox(
                height: maxHeight,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      imagePageIndex = value;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.imageUrls.length,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: maxHeight,
                        child: widgetList[index]
                      ),
                    );
                  }
                ),
              ),
              SizedBox(
                height: maxHeight,
                child: Align(
                  alignment: Alignment(0, 0.95),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < widget.imageUrls.length; i += 1)
                        Container(
                          margin: EdgeInsets.only(left: 4, right: 4),
                          width: 16,
                          child: Align(
                            alignment: Alignment(0, 0.95),
                            child: Container(
                              width: i == imagePageIndex ? 16 : 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: i == imagePageIndex ? const Color(0xFFCACACA): const Color(0x75D0D0D0),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}