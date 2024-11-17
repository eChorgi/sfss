import 'package:flutter/cupertino.dart';
import 'package:sfss/widgets/sfss_widget.dart';

class FitWidthImage extends StatefulWidget {
  final Image image;
  final Function ?onLoad;
  const FitWidthImage({super.key, required this.image, this.onLoad});

  static Widget asset(String name, {Key ?key, Function ?onLoad}){ 
    var widget = FitWidthImage(
      key: key,
      onLoad: onLoad,
      image: Image.asset(
        name,
        fit: BoxFit.fitWidth,
        width: double.infinity,
      )
    );
    return widget;
  }
  @override
  State<FitWidthImage> createState() => FitWidthImageState();
}

class FitWidthImageState extends State<FitWidthImage> {
  late Image image;
  double ?imgW, imgH, displayH, widgetH, widgetW;
  @override
  void initState() {
    super.initState();
    widget.image.image
    .resolve(new ImageConfiguration())
    .addListener(new ImageStreamListener((ImageInfo info, bool _) {
      if(mounted){
        setState(() {  
          imgW = info.image.width.toDouble();
          imgH = info.image.height.toDouble();
        });
        if(widget.onLoad != null)widget.onLoad!(imgW, imgH);
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    // widget.image.image
    // .resolve(new ImageConfiguration())
    // .addListener(new ImageStreamListener((ImageInfo info, bool _) {
    //   if(mounted){
    //     setState(() {  
    //       imgW = info.image.width.toDouble();
    //       imgH = info.image.height.toDouble();
    //     });
    //     if(widget.onLoad != null)widget.onLoad!(imgW, imgH);
    //   }
    // }));
    return LayoutBuilder(
      builder: (context, boxConstraints){
        if(imgW == null || imgH == null) return const SizedBox();
        
        displayH = imgH!*boxConstraints.maxWidth/imgW!;
        widgetW = boxConstraints.maxWidth;
        widgetH = displayH;
        if(widgetH! > 4.0/3.0*boxConstraints.maxWidth){
          widgetH = 4.0/3.0*boxConstraints.maxWidth;
        }
        if(widgetH! < 3.0/4.0*boxConstraints.maxWidth) {
          widgetH = 3.0/4.0*boxConstraints.maxWidth;
        }
        return ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              width: widgetW,
              height: widgetH,
              child: widget.image
          ),
        );
      }
    );
  }
}