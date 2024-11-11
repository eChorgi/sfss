import 'package:flutter/cupertino.dart';
import 'package:sfss/widgets/sfss_widget.dart';

class FitWidthImage extends StatefulWidget {
  final Image image;
  const FitWidthImage({super.key, required this.image});
  static Widget asset(String name) {
    var widget = FitWidthImage(
      image: Image.asset(
        name,
        fit: BoxFit.fitWidth,
        width: double.infinity,
      )
    );
    return widget;
  }
  @override
  State<FitWidthImage> createState() => _FitWidthImageState();
}

class _FitWidthImageState extends State<FitWidthImage> {
  late Image image;
  double ?imgW, imgH, displayH, widgetH;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.image.image
    .resolve(new ImageConfiguration())
    .addListener(new ImageStreamListener((ImageInfo info, bool _) {
      if(mounted){
        setState(() {  
          imgW = info.image.width.toDouble();
          imgH = info.image.height.toDouble();
        });
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    widget.image.image
    .resolve(new ImageConfiguration())
    .addListener(new ImageStreamListener((ImageInfo info, bool _) {
      if(mounted){
        setState(() {  
          imgW = info.image.width.toDouble();
          imgH = info.image.height.toDouble();
        });
      }
    }));
    return LayoutBuilder(
      builder: (context, boxConstraints){
        if(imgW == null || imgH == null) return const SizedBox();
        
        displayH = imgH!*boxConstraints.maxWidth/imgW!;
        widgetH = displayH;
        if(displayH! > 4.0/3.0*boxConstraints.maxWidth){
          widgetH = 4.0/3.0*boxConstraints.maxWidth;
        }
        if(displayH! < 3.0/4.0*boxConstraints.maxWidth) {
          widgetH = 3.0/4.0*boxConstraints.maxWidth;
        }
        return Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Align(
                alignment: Alignment.center,
                heightFactor: (widgetH??1)/(displayH??1),
                child: widget.image,
              ),
            ),
          ],
        );
      }
    );
  }
}