import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PageHome extends StatefulWidget {
  const PageHome({ Key? key }) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> with TickerProviderStateMixin {

  late AnimationController animController;
  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    animController.forward();
  }
  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: AnimatedBuilder(
        animation: animController,
        builder: (context, child) {
          return Stack(
            children: [
              
            ],
          );
        },
      ),
    );
  }
}