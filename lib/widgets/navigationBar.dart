import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfss/styles/mainStyle.dart';

class CustomCupertinoNavigationBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  @override
  bool shouldFullyObstruct(BuildContext context) => false;
  final String title;
  final String subTitle;
  final double height;
  final Color backgroundColor;
  final List<Widget>? children;
  final void Function() ?onPressBack;
  final bool showBackButton;

  const CustomCupertinoNavigationBar({
    super.key,
    required this.title,
    this.subTitle = "",
    this.height = 106.0,
    this.backgroundColor = Colors.white,
    this.children,
    this.onPressBack,
    this.showBackButton = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: backgroundColor,
      decoration: const BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage("assets/images/background_leave.png"),
          fit: BoxFit.fitWidth
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            if(showBackButton) Padding(
              padding: const EdgeInsets.only(top: 20, left:30),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: onPressBack,
                child: const Icon(Icons.arrow_back_ios, color: Color(0xFF4A5568))
              ),
            ),
            SizedBox(
              height: height,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 28),
                    Text(
                      title,
                      style: TextStyle(
                        color: const Color(0xFF4A5568),
                        fontSize: 28,
                        fontFamily: SfssStyle.mainFont,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      height: 1,
                      width: 350,
                      color: const Color(0xFFC4C6CB),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      subTitle,
                      style: TextStyle(
                        color: const Color(0x6B606A7A),
                        fontSize: 13,
                        fontFamily: SfssStyle.mainFont,
                      ),
                    ),
                    ...children ?? [],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}