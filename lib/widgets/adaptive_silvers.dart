import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/sfss_widget.dart';

class AdaptiveSilvers extends StatefulWidget {
  final double minWidth;
  final double maxWidth;
  final double spacingW;
  final double spacingH;
  final List<Widget> children;

  const AdaptiveSilvers({super.key, required this.children, this.minWidth = 150, this.maxWidth = 200, this.spacingW = 8, this.spacingH = 18});
  @override
  State<AdaptiveSilvers> createState() => _AdaptiveSilversState();
}

class _AdaptiveSilversState extends State<AdaptiveSilvers> {

  late LinkedScrollControllerGroup controllerGroup;
  List<ScrollController> controllers = [];

  int columnsNum = 1;

  @override
  void initState() {
    super.initState();
    controllerGroup = LinkedScrollControllerGroup();
    controllers.add(controllerGroup.addAndGet());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints boxConstraints) {
        var columnWidth = (boxConstraints.maxWidth+widget.spacingW)/columnsNum-widget.spacingW;
        var div = columnsNum;
        while(columnWidth > widget.maxWidth) {
          div += 1;
          columnWidth = (boxConstraints.maxWidth+widget.spacingW)/div-widget.spacingW;
        }
        while(columnWidth < widget.minWidth) {
          div -= 1;
          columnWidth = (boxConstraints.maxWidth+widget.spacingW)/div-widget.spacingW;
        }
        columnsNum = div;
        while(columnsNum > controllers.length) {
          controllers.add(controllerGroup.addAndGet());
        }
        return SizedBox(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for(int columnIndex = 0; columnIndex < columnsNum; columnIndex++)
                Padding(
                  padding: columnIndex == 0?const EdgeInsets.all(0.0):EdgeInsets.only(left: widget.spacingW),
                  child: SizedBox(
                    width: columnWidth,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: Column(
                        children: [
                          for (int itemIndex = 0; itemIndex < ((widget.children.length)/columnsNum).ceil()+1; itemIndex+=1)
                          if(itemIndex*columnsNum+columnIndex < widget.children.length)
                            Padding(
                              padding: (itemIndex==0?const EdgeInsets.all(0.0):EdgeInsets.only(top: widget.spacingH)),
                              child: widget.children[(itemIndex*columnsNum+columnIndex).toInt()],
                            )
                          
                        ]
                      ),
                    ),
                  ),
                )
            ],
          ),
        );
      } 
    );
  }
}