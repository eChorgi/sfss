import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCupertinoNavigationBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  @override
  bool shouldFullyObstruct(BuildContext context) => false;
  final String title;
  final String subTitle;
  final double height;
  final Color backgroundColor;
  final List<Widget>? children;

  const CustomCupertinoNavigationBar({
    super.key,
    required this.title,
    this.subTitle = "",
    this.height = 106.0,
    this.backgroundColor = Colors.white,
    this.children,
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
        child: Container(
          height: height,
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 28),
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF4A5568),
                    fontSize: 28,
                    fontFamily: "WYMingChao",
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
                  style: const TextStyle(
                    color: Color(0x6B606A7A),
                    fontSize: 13,
                    fontFamily: "WYMingChao",
                  ),
                ),
                ...children ?? [],
              ],
            ),
          ),
        ),
      ),
    );
  }
}