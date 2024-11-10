import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/sfss_widget.dart';

class AdaptiveListViews extends StatefulWidget {
  final double minWidth;
  final double maxWidth;
  final double spacingW;
  final double spacingH;
  final List<Widget> children;

  const AdaptiveListViews({super.key, required this.children, this.minWidth = 150, this.maxWidth = 200, this.spacingW = 8, this.spacingH = 18});
  @override
  State<AdaptiveListViews> createState() => _AdaptiveListViewsState();
}

class _AdaptiveListViewsState extends State<AdaptiveListViews> {

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
            children: [
              for(int columnIndex = 0; columnIndex < columnsNum; columnIndex++)
                Padding(
                  padding: columnIndex == 0?const EdgeInsets.all(0.0):EdgeInsets.only(left: widget.spacingW),
                  child: SizedBox(
                    width: columnWidth,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        controller: controllers[columnIndex],
                        itemCount: ((widget.children.length)/columnsNum).ceil()+1,
                        itemBuilder: (context, itemIndex){
                          if(itemIndex*columnsNum+columnIndex < widget.children.length){
                            return Padding(
                              padding: (itemIndex==0?const EdgeInsets.all(0.0):EdgeInsets.only(top: widget.spacingH)),
                              child: widget.children[(itemIndex*columnsNum+columnIndex).toInt()],
                            );
                          }
                          else {
                            return const SizedBox(height: 100,);
                          }
                        },
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