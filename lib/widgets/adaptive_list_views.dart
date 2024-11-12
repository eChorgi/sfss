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
  final EdgeInsets padding;
  final List<Widget> children;

  const AdaptiveListViews({super.key, required this.children, this.minWidth = 150, this.maxWidth = 200, this.spacingW = 8, this.spacingH = 18, this.padding = EdgeInsets.zero});
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
        var maxWidth = boxConstraints.maxWidth-widget.padding.left-widget.padding.right;
        var columnWidth = (maxWidth+widget.spacingW)/columnsNum-widget.spacingW;
        var div = columnsNum;
        while(columnWidth > widget.maxWidth) {
          div += 1;
          columnWidth = (maxWidth+widget.spacingW)/div-widget.spacingW;
        }
        while(columnWidth < widget.minWidth) {
          div -= 1;
          columnWidth = (maxWidth+widget.spacingW)/div-widget.spacingW;
        }
        columnsNum = div;
        while(columnsNum > controllers.length) {
          controllers.add(controllerGroup.addAndGet());
        }
        return ClipRRect(
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                for(int columnIndex = 0; columnIndex < columnsNum; columnIndex++)
                  Padding(
                    padding: 
                    (
                      columnIndex == 0
                      ?EdgeInsets.only(left: widget.padding.left)
                      :EdgeInsets.only(left: widget.spacingW/2)
                    )
                    +(
                      columnIndex == columnsNum-1
                      ?EdgeInsets.only(right: widget.padding.right)
                      :EdgeInsets.only(right: widget.spacingW/2)
                    ),
                    child: SizedBox(
                      width: columnWidth,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                          child: ListView.builder(
                            clipBehavior: Clip.none,
                            controller: controllers[columnIndex],
                            itemCount: ((widget.children.length)/columnsNum).ceil()+1,
                            itemBuilder: (context, itemIndex){
                              if(itemIndex*columnsNum+columnIndex < widget.children.length){
                                return Padding(
                                  padding: 
                                  (
                                    itemIndex==0
                                    ?EdgeInsets.only(top: widget.padding.top)
                                    :EdgeInsets.only(top: widget.spacingH)
                                  )
                                  
                                  ,
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
                    ),
                  )
              ],
            ),
          ),
        );
      } 
    );
  }
}