import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfss/styles/mainStyle.dart';
import 'package:sfss/widgets/sfssWidget.dart';
import 'package:sfss/widgets/historyPreview.dart';
import 'package:sfss/widgets/navigationBar.dart';

Widget _poemCard() {
  return Padding(
    padding: const EdgeInsets.only(top: 18.0),
    child: Container(
      height: 150,
      width: 360,
      decoration: BoxDecoration(
        // image: Image.asset(name),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 3,
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 9),
            Text(
              '7/25',
              style: TextStyle(
                color: const Color(0xFF4A5568),
                fontSize: 17,
                fontFamily: SfssStyle.mainFont,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              '夏至',
              style: TextStyle(
                color: const Color(0xFF791414),
                fontSize: 25,
                fontFamily: SfssStyle.mainFont,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              '夏至临，佳肴呈。\n青梅煮酒酸且醇，醉卧清风心自真。',
              textAlign: TextAlign.center,
              strutStyle: const StrutStyle(height: 1.9),
              style: TextStyle(
                color: const Color(0xFF4A5568),
                fontSize: 16,
                fontFamily: SfssStyle.mainFont,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _todayRecord(void Function() onPressRecord) {
  return Padding(
    padding: const EdgeInsets.only(top: 50.0),
    child: SizedBox(
        width: 260,
        height: 50,
        child: SfssWidget.button(
          text: '今日记录', 
          onPressed: onPressRecord,//TODO
          padding: const EdgeInsets.all(0),
        )
      ),
  );
}

Widget _layerMainToday(BuildContext context, void Function() onPressRecord) {
  return Center(
    child: Column(
      children: [
        _poemCard(),
        historyPreview(),
        _todayRecord(onPressRecord)
      ],
    ),
  );
}

Widget _recordCard() {
  return Padding(
    padding: const EdgeInsets.only(top: 82.0),
    child: Container(
      width: 340,
      height: 420,
      decoration: BoxDecoration(
        // image: Image.asset(name),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 3,
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 13.0),
                child: SizedBox(
                  width: 40,
                  height: 180,
                  child: Column(
                    children: [
                      const SizedBox(height: 42),
                      Container(
                        height: 10,
                        width: 16,
                        decoration: const BoxDecoration(
                          color: Color(0xFF791414),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                      ),
                      CupertinoTextField(
                        textAlignVertical: TextAlignVertical.top,
                        showCursor: false,
                        placeholder: '美食',
                        maxLines: null,
                        placeholderStyle: TextStyle(
                          color: const Color(0xFF8D94A0),
                          fontSize: 23,
                          fontFamily: SfssStyle.mainFont,
                        ),
                        style: TextStyle(
                          color: const Color(0xFF4A5568),
                          fontSize: 23,
                          fontFamily: SfssStyle.mainFont,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: null
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: Image.asset(
                  'assets/images/dish_display.png',
                  height: 130,
                  width: 210,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 1.3,
                width: 300,
                color: const Color(0xFFC4C6CB),
              ),
            ),
          ),
          SizedBox(
            width: 340,
            height: 196,
            child: CupertinoTextField(
              padding: const EdgeInsets.only(left: 24.0, top: 16.0, right: 24, bottom: 16),
              textAlignVertical: TextAlignVertical.top,
              showCursor: false,
              placeholder: '写下此刻的心情……',
              maxLines: null,
              placeholderStyle: TextStyle(
                color: const Color(0xFF8D94A0),
                fontSize: 15,
                fontFamily: SfssStyle.mainFont,
              ),
              style: TextStyle(
                color: const Color(0xFF4A5568),
                fontSize: 15,
                fontFamily: SfssStyle.mainFont,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: null
              ),
            ),
          ),
        ],
      )
    ),
    
  );
}

Widget _recordCommitButton(void Function() onPressed) {
  return Padding(
    padding: const EdgeInsets.only(top: 84.0),
    child: SizedBox(
      width: 260,
      height: 50,
      child: SfssWidget.button(
        text: '保存食记', 
        onPressed: onPressed,
        padding: EdgeInsets.zero
        )
    ),
  );
}

Widget _layerMainTodayRecord(BuildContext context, void Function() onPressRecord) {
  return Center(
    child: Column(
      children: [
        _recordCard(),
        _recordCommitButton(onPressRecord)
      ],
    ),
  );
}


class SubPageToday extends StatefulWidget {
  const SubPageToday({super.key});
  @override
  _SubPageTodayState createState() => _SubPageTodayState();
}

class _SubPageTodayState extends State<SubPageToday> {
  bool showCamera = false;
  bool showRecordPage = false;
  @override
  Widget build(BuildContext context) {
    CupertinoPageScaffold scaffold;
    if(!showRecordPage) {
      scaffold = CupertinoPageScaffold(
        navigationBar: const CustomCupertinoNavigationBar(
          title: '中午好',
          subTitle: "夏时饶温和，避暑就清凉。",
        ),
        child: SafeArea (
          
          child: Stack (
            children: [
              // Container(
              //   decoration: const BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage("assets/images/background_leave.png"),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              
              _layerMainToday(
                context,
                (){
                  setState(() {
                    showRecordPage = true;
                    showCamera = true;
                  });
                }
              ),
            ],
          ),
        ),
      );
    }
    else {
      scaffold = CupertinoPageScaffold(
        navigationBar: CustomCupertinoNavigationBar(
          title: '今日记录',
          subTitle: "夏时饶温和，避暑就清凉。",
          showBackButton: true,
          onPressBack: () {
            setState(() {
              showRecordPage = false;
            });
          },
        ),
        child: SafeArea (
          child: Stack(
            children: [
              // Container(
              //   decoration: const BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage("assets/images/background_leave.png"),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              _layerMainTodayRecord(context,
                () {
                  setState(() {
                    showRecordPage = false;
                    showCamera = false;
                  });
                }
              ),
              
            ],
          ),
        ),
      );
    }
    return scaffold;
  }
}
