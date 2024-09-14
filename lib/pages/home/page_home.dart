import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfss/tabBar.dart';
import 'package:sfss/widgets.dart';
import 'package:sfss/navigationBar.dart';
import 'history_preview.dart';
import 'package:sfss/collection_header.dart';
import 'package:sfss/roughter.dart';



Widget _vegetableItem(String name, String discribe, List<String> dishes, List<String> dishes_desc, BuildContext context, int ?index) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 18.0),
    child: CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        if(index != null) {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => PageDetail(foodId: index,)),
          );
        }
      },
      child: Container(
          height: 118,
          width: 320,
          decoration: BoxDecoration(
            // image: Image.asset(name),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:20.0, top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xFF791414),
                        fontSize: 26,
                        fontFamily: "WYMingChao",
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      discribe,
                      style: const TextStyle(
                        color: Color(0xFF687281),
                        fontSize: 12,
                        fontFamily: "WYMingChao",
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 22,
                      width: 64,
                      decoration: BoxDecoration(
                        color: const Color(0xFF882F2F),
                        borderRadius: BorderRadius.circular(3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          '查看详情',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: "WYMingChao",
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 184.0, top: 7.0),
                child: SizedBox(
                  height: 105,
                  width: 320,
                  child: ListView.builder(
                    itemCount: dishes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Container(
                                height: 12,
                                width: 6,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF882F2F),
                                  borderRadius: BorderRadius.all(Radius.circular(2)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 9.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      dishes[index],
                                      style: const TextStyle(
                                        color: Color(0xFF4A5568),
                                        fontSize: 15,
                                        fontFamily: "WYMingChao",
                                      ),
                                    ),
                                  const SizedBox(height: 8),
                                  Text(
                                      dishes_desc[index],
                                      style: const TextStyle(
                                        color: Color(0xFF4A5568),
                                        fontSize: 10,
                                        fontFamily: "WYMingChao",
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          )
        ),
    ),
  );

}

Widget _vegetableList(BuildContext context) {
  return Center(
    child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 34.0),
          child: Text(
            '蔬菜类',
            style: TextStyle(
              color: Color(0xFF4A5568),
              fontSize: 22,
              fontFamily: "WYMingChao",
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        _vegetableItem("苦瓜", "清热消暑、养血益气。", ["苦瓜炒蛋", "苦瓜炒肉", "苦瓜酿肉","苦瓜炒牛肉","苦瓜拌木耳","苦瓜炒虾仁","苦瓜煎蛋饼"],["翠衣裹金珠，苦尽甘来香", "苦中带甘味，清心又养生","翠玉藏金蕊，苦尽甘来美","碧叶卷红丝，苦香牛肉宜","翠裙舞黑耳，苦甘凉意生","玉片托红珠，苦中藏鲜美","金波托翠台，苦香蛋中来"], context, 0),
        _vegetableItem("黄瓜", "清热利尿、美容养颜。", ["黄瓜凉拌", "黄瓜炒虾仁", "黄瓜蘸酱", "黄瓜鸡蛋卷", "黄瓜汁"], ["翠丝凉意绕，夏日长悠悠", "玉珠伴翠影，清淡味更足", "青翠蘸香韵，简单见风雅", "翠被裹金辉，春意口中回", "碧波荡心间，清新自然还"], context, 1),
        _vegetableItem("西红柿", "生津止渴、降火解毒。", ["西红柿炒鸡蛋", "西红柿炖牛肉", "西红柿炒虾仁", "西红柿炒鸡蛋", "西红柿炒鸡蛋"], ["红翠舞金丝，酸甜口中留", "红翠托金辉，鲜美味中生", "红翠托白玉，清香鲜美味", "红翠托金辉，鲜美味中生", "红翠托金辉，鲜美味中生"], context, null),
        
      ]
    )
  );
}

Widget _smallCardItem({
  required String name, 
  required String describe, 
  EdgeInsetsGeometry ?padding,
  Widget ?describeWidget,
  bool showDescribe = true,
  bool showDetailButton = true,
  double describeOffset = 0,
  TextStyle ?nameStyle,
  required BuildContext context,
}) {
  return Padding(
    padding: padding ?? const EdgeInsets.only(left: 6.0, right: 6.0, top: 12.0, bottom: 12.0),
    child: Container(
      decoration: BoxDecoration(
        // image: Image.asset(name),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 3,
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => const PageDetail(foodId: 1,)),
          );
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 20.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: Container(
                      height: 14,
                      width: 6,
                      decoration: BoxDecoration(
                        color: const Color(0xFF791414),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Text(
                    name,
                    style: nameStyle??TextStyle(
                      color: const Color(0xFF791414),
                      fontSize: (name.length<=6?21:33-name.length*2),
                      fontFamily: "WYMingChao",
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 28.0, right: describeOffset),
                child: Text(
                  describe,
                  style: const TextStyle(
                    color: Color(0xFF687281),
                    fontSize: 13,
                    fontFamily: "WYMingChao",
                  ),
                ),
              ),
            ),
            if(showDetailButton)Padding(
              padding: const EdgeInsets.only(left: 90.0, top: 19.0),
              child: Row(
                children: [
                  const Text(
                    '查看详情',
                    style: TextStyle(
                      color: Color(0xFFB7BBC3),
                      fontSize: 11,
                      fontFamily: "WYMingChao",
                    ),
                  ),
                  Image.asset(
                    'assets/images/icon_detail.png',
                    height: 14,
                    width: 14,
                  )
                ],
              ),
            ),
          ],
        ),
      )
    ),
  );
}

Widget _fruitList(BuildContext context) {
  return Center(
    child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 34.0),
          child: Text(
            '水果类',
            style: TextStyle(
              color: Color(0xFF4A5568),
              fontSize: 22,
              fontFamily: "WYMingChao",
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.55,
          ),
          padding: const EdgeInsets.only(left: 26.0, right: 26.0),
          children: [
            _smallCardItem(name: '西瓜', describe: '清热解暑，甘甜多汁', context: context),
            _smallCardItem(name: '杨梅', describe: '生津止渴，消食开胃', context: context),
            _smallCardItem(name: '芒果', describe: '热带果王，营养丰富', context: context),
            _smallCardItem(name: '樱桃', describe: '色泽鲜艳，酸甜可口', context: context),
            _smallCardItem(name: '西瓜', describe: '清热解暑，甘甜多汁', context: context),
            _smallCardItem(name: '杨梅', describe: '生津止渴，消食开胃', context: context),
            _smallCardItem(name: '芒果', describe: '热带果王，营养丰富', context: context),
            _smallCardItem(name: '樱桃', describe: '色泽鲜艳，酸甜可口', context: context),
            
          ]
        )
      ]
    )
  );
}

Widget _layerMainRecommend(BuildContext context) {
  return Center(
    child: ListView(
      children: [
        _vegetableList(context),
        _fruitList(context),
      ],
    ),
  );
}

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
      child: const Center(
        child: Column(
          children: [
            SizedBox(height: 9),
            Text(
              '7/25',
              style: TextStyle(
                color: Color(0xFF4A5568),
                fontSize: 17,
                fontFamily: "WYMingChao",
              ),
            ),
            SizedBox(height: 7),
            Text(
              '夏至',
              style: TextStyle(
                color: Color(0xFF791414),
                fontSize: 25,
                fontFamily: "WYMingChao",
              ),
            ),
            SizedBox(height: 14),
            Text(
              '夏至临，佳肴呈。\n青梅煮酒酸且醇，醉卧清风心自真。',
              textAlign: TextAlign.center,
              strutStyle: StrutStyle(height: 1.9),
              style: TextStyle(
                color: Color(0xFF4A5568),
                fontSize: 16,
                fontFamily: "WYMingChao",
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
        child: Sfss.button(
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
                      const CupertinoTextField(
                        textAlignVertical: TextAlignVertical.top,
                        showCursor: false,
                        placeholder: '美食',
                        maxLines: null,
                        placeholderStyle: TextStyle(
                          color: Color(0xFF8D94A0),
                          fontSize: 23,
                          fontFamily: "WYMingChao",
                        ),
                        style: TextStyle(
                          color: Color(0xFF4A5568),
                          fontSize: 23,
                          fontFamily: "WYMingChao",
                        ),
                        decoration: BoxDecoration(
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
          const SizedBox(
            width: 340,
            height: 196,
            child: CupertinoTextField(
              padding: EdgeInsets.only(left: 24.0, top: 16.0, right: 24, bottom: 16),
              textAlignVertical: TextAlignVertical.top,
              showCursor: false,
              placeholder: '写下此刻的心情……',
              maxLines: null,
              placeholderStyle: TextStyle(
                color: Color(0xFF8D94A0),
                fontSize: 15,
                fontFamily: "WYMingChao",
              ),
              style: TextStyle(
                color: Color(0xFF4A5568),
                fontSize: 15,
                fontFamily: "WYMingChao",
              ),
              decoration: BoxDecoration(
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
      child: Sfss.button(
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

Widget _collectionItem({
  required String name, 
  required String describe, 
  bool isCollected = true,
  int tastedTimes = 0,
  int tabIndex = 0,
  int subTabIndex = 0,
  int index = 0,
  required BuildContext context,
}) {
  return _smallCardItem(
    name: name, //name.substring(0,min(5,name.length))+(name.length>5?'···':''), 
    // describe: dishesDescribe[tagIndex][subTagIndex][index],
    describe: '已品鉴${(100-index/3).toInt()}次',
    padding: const EdgeInsets.only(left: 2.0, right: 2.0, top: 12.0, bottom: 12.0),
    showDetailButton: false,
    describeOffset: 54,
    context: context
  );
}

Widget _layerMainCollection(BuildContext context, Function(int) onPressTag, Function(int) onPressSubTag, int tagIndex, int subTagIndex, List<List<String>> tagName, List<List<List<String>>> dishes, List<List<List<String>>> dishesDescribe) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 66.0),
        child: CupertinoButton(
          padding: const EdgeInsets.only(left: 11, right:11),
          child: const Text(
            '回到顶部',
            style: TextStyle(
              color: Color(0xFF4A5568),
              fontSize: 18,
              fontFamily: "WYMingChao",
            )
          ),
          onPressed: () {
            // Scrollable.ensureVisible(context);
          },
        )
      ),
      CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: CollectionHeaderDelegate(
              onPressTag: onPressTag,
              selectIndex: tagIndex,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 92.0),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.55,
              ),
              itemBuilder: (BuildContext context, int index) {
                String name = dishes[tagIndex][subTagIndex][index];
                String describe = dishesDescribe[tagIndex][subTagIndex][index];
                // print('tagIndex: $tagIndex, subTagIndex: $subTagIndex, index: $index dishes[$tagIndex][$subTagIndex]:${dishes[tagIndex][subTagIndex]}');
                return _collectionItem(name: name, describe: describe, context: context);
              },
              itemCount: dishes[tagIndex][subTagIndex].length,
            ),
          ),
          // Next, create a SliverList
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 139.0),
        child: SizedBox(
          width: 94,
          child: ListView.builder(
            itemCount: tagName[tagIndex].length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 33.0),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    subTagIndex = index;
                    onPressSubTag(index);
                  },
                  child: Text(
                    textAlign: TextAlign.center,
                    tagName[tagIndex][index],
                    style: TextStyle(
                      color: index==subTagIndex?Color(0xFF882F2F):Color(0xFF4A5568),
                      fontSize: 18,
                      fontFamily: "WYMingChao",
                    )
                  ),
                ),
              );
            },
            // separatorBuilder: (BuildContext context, int index) {
            //   return Padding(
            //     padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 20.0),
            //     child: Container(
            //       width: 0.1,
            //       height: 0.1,
            //       color: Colors.black,
            //     ),
            //   );
            // },
          ),
        ),
      ),
    ],
  );
}

Widget _historyDishItem(String dishName, String content, String ?assetPath){
  return Padding(
    padding: const EdgeInsets.only(bottom: 28.0),
    child: Row(
      children: [
        SizedBox(
          width: 150,
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 14,
                      width: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFF791414),
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Text(
                        dishName,
                        style: const TextStyle(
                          color: Color(0xFF4A5568),
                          fontSize: 16,
                          fontFamily: "WYMingChao",
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    content,
                    style: const TextStyle(
                      color: Color(0xFF4A5568),
                      fontSize: 13,
                      fontFamily: "WYMingChao",
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32.0, top: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image.asset(
              assetPath??'assets/images/dish_display.png', 
              height: 56, 
              fit: BoxFit.fitHeight,
              
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _historyDayCard({
  List<Widget> children = const [],
  int day = 1,
}){
  return Center(
    child: Container(
      width: 340,
      decoration: BoxDecoration(
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
      child: Align(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 38),
          child: Column(
            children: [
              SizedBox(
                width: 340,
                child: Text(
                  day<10?'0$day':'$day',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Color(0xFF791414),
                    fontSize: 26,
                    fontFamily: "WYMingChao",
                  ),
                ),
              ),
              ...children
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _dateShower(int year, int month) {
  return Stack(
    children: [
      const Padding(
        padding: EdgeInsets.only(top: 22.0),
        child: Row(
          children: [
            SizedBox(width: 20),
            Text(
              '甲辰',
              style: TextStyle(
                color: Color(0xFFF4F5F6),
                fontSize: 38,
                fontFamily: "WYMingChao",
              ),
            ),
            Spacer(),
            Text(
              '癸酉',
              style: TextStyle(
                color: Color(0xFFF4F5F6),
                fontSize: 38,
                fontFamily: "WYMingChao",
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                Text(
                  year.toString(),
                  style: const TextStyle(
                    color: Color(0xFF4A5568),
                    fontSize: 34,
                    fontFamily: "WYMingChao",
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  '/',
                  style: TextStyle(
                    color: Color(0xFF4A5568),
                    fontSize: 34,
                    fontFamily: "WYMingChao",
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  month<10?'0$month':'$month',
                  style: const TextStyle(
                    color: Color(0xFF4A5568),
                    fontSize: 34,
                    fontFamily: "WYMingChao",
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        )
      ),
    ],
  );
}

Widget _layerMainHistory(BuildContext context) {
  return Center(
    child: ListView(
      children: [
        const SizedBox(height: 16),
        Center(
          child: SizedBox(
            width: 340,
            child: _dateShower(2024, 7)
          ),
        ),
        const SizedBox(height: 16),
        _historyDayCard(
          day:3,
          children: [
            _historyDishItem('麻婆豆腐','今日晚餐尝试了新开的...',null),
            const SizedBox(height: 16),
            _historyDishItem('鱼香茄子','今日晚餐尝试了新开的...','assets/images/dish_yxqz.png'),
            const SizedBox(height: 16),
            _historyDishItem('宫保鸡丁','宫保鸡丁，甜、辣、酸...','assets/images/dish_gbjd.png'),
          ]
        ),
        const SizedBox(height: 16),
        _historyDayCard(
          day:2,
          children: [
            _historyDishItem('羊肉馄饨','寒冷的日子里，一碗羊肉...','assets/images/dish_yrht.png'),
            const SizedBox(height: 16),
            _historyDishItem('瘦肉粥','清晨，一碗瘦肉粥开启...', 'assets/images/dish_srz.png'),
            const SizedBox(height: 16),
            _historyDishItem('章鱼小丸子','一口一个章鱼小丸子...', 'assets/images/dish_zyxwz.png'),
          ]
        ),
        const SizedBox(height: 16),
        _historyDayCard(
          day:1,
          children: [
            _historyDishItem('热干面','热干面，浓郁的芝麻酱香气...', 'assets/images/dish_rgm.png'),
            const SizedBox(height: 16),
            _historyDishItem('麻辣烫','麻辣烫，各种食材在热辣的汤中翻滚...', 'assets/images/dish_mlt.png'),
            const SizedBox(height: 16),
            _historyDishItem('烤鱼','烤鱼上桌，香气四溢...', 'assets/images/dish_ky.png'),
          ]
        ),
        const SizedBox(height: 16),
        Center(
          child: SizedBox(
            width: 340,
            child: _dateShower(2024, 6)
          ),
        ),
        const SizedBox(height: 16),
        _historyDayCard(
          day:30,
          children: [
            _historyDishItem('羊肉馄饨','寒冷的日子里，一碗羊肉...','assets/images/dish_yrht.png'),
            const SizedBox(height: 16),
            _historyDishItem('瘦肉粥','清晨，一碗瘦肉粥开启...', 'assets/images/dish_srz.png'),
            const SizedBox(height: 16),
            _historyDishItem('章鱼小丸子','一口一个章鱼小丸子...', 'assets/images/dish_zyxwz.png'),
          ]
        ),
        const SizedBox(height: 16),
        _historyDayCard(
          day:29,
          children: [
            _historyDishItem('麻婆豆腐','今日晚餐尝试了新开的...',null),
            const SizedBox(height: 16),
            _historyDishItem('鱼香茄子','今日晚餐尝试了新开的...','assets/images/dish_yxqz.png'),
          ]
        ),
        const SizedBox(height: 16),
        _historyDayCard(
          day:28,
          children: [
            _historyDishItem('麻婆豆腐','今日晚餐尝试了新开的...',null),
            const SizedBox(height: 16),
            _historyDishItem('鱼香茄子','今日晚餐尝试了新开的...','assets/images/dish_yxqz.png'),
            const SizedBox(height: 16),
            _historyDishItem('宫保鸡丁','宫保鸡丁，甜、辣、酸...', 'assets/images/dish_gbjd.png'),
          ]
        )
      ],
    ),
  );
}

class _SubPageToday extends StatefulWidget {
  const _SubPageToday({super.key});
  @override
  _SubPageTodayState createState() => _SubPageTodayState();
}

class _SubPageTodayState extends State<_SubPageToday> {
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

class _SubPageRecommend extends StatelessWidget {
  const _SubPageRecommend({super.key});
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      
      navigationBar: const CustomCupertinoNavigationBar(
        title: '时令食物推荐',
        subTitle: "应时知节寻美味，传统源流心底藏。",

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
            _layerMainRecommend(context),
          ],
        ),
      ),
    );
  }
}
class _SubPageCollection extends StatefulWidget {
  const _SubPageCollection({super.key});
  @override
  _SubPageCollectionState createState() => _SubPageCollectionState();
}
class _SubPageCollectionState extends State<_SubPageCollection> {
  int tagIndex = 0;
  int subTagIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
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
            _layerMainCollection(
              context, 
              (int index) {
                tagIndex = index;
                setState(() {
                  tagIndex = index;
                  subTagIndex = 0;
                });
              },
              (int index) {
                subTagIndex = index;
                setState(() {
                  subTagIndex = index;
                });
              },
              tagIndex,
              subTagIndex,
              [
                ["家常菜", "小吃", "主食", "海鲜", "甜点", "汤品", "水果", "零食", "轻食", "烧烤", "面包", "蛋糕", "饮品"],
                ["立春", "雨水", "惊蛰", "春分", "清明", "谷雨", "立夏", "小满", "芒种", "夏至", "小暑", "大暑", "立秋", "处暑", "白露", "秋分", "寒露", "霜降", "立冬", "小雪", "大雪", "冬至", "小寒", "大寒"],
                ["面粉", "海鲜", "肉类", "蔬菜", "鸡蛋", "豆制品", "大米", "谷物", "糖", "水果", "牛奶", "香料", "调味料"],
                ["全部"]
              ],
              [
                [
                  ['炒面','火锅','玉米馄饨','拉面','串串','虾仁水饺','盖浇饭','烧烤','牛肉馄饨','蛋炒饭','麻辣烫','香菇馄饨','炒米粉'],
                  ['烤鱼','荠菜馄饨','炸酱面','烤肉','韭菜馄饨','热干面','涮羊肉'],
                  ['芹菜馄饨','担担面','香锅','白菜馄饨','刀削面','焖锅'],
                  ['菠菜馄饨','臊子面','石锅鱼','胡萝卜馄饨','油泼面'],
                  ['铁锅炖','玉米水饺','手擀面','羊蝎子','三鲜水饺','凉面'],
                  ['炖菜','炒河粉','炒年糕','炒河粉','炒米粉'],
                  ['炒面','火锅','玉米馄饨','拉面','串串','虾仁水饺','盖浇饭','烧烤','牛肉馄饨','蛋炒饭','麻辣烫','香菇馄饨','炒米粉'],
                  ['烤鱼','荠菜馄饨','炸酱面','烤肉','韭菜馄饨','热干面','涮羊肉'],
                  ['芹菜馄饨','担担面','香锅','白菜馄饨','刀削面','焖锅'],
                  ['菠菜馄饨','臊子面','石锅鱼','胡萝卜馄饨','油泼面'],
                  ['铁锅炖','玉米水饺','手擀面','羊蝎子','三鲜水饺','凉面'],
                  ['炖菜','炒河粉','炒年糕','炒河粉','炒米粉'],
                  ['炒面','火锅','玉米馄饨','拉面','串串','虾仁水饺','盖浇饭','烧烤','牛肉馄饨','蛋炒饭','麻辣烫','香菇馄饨','炒米粉'],
                ],
                [
                  ['油酥面','溜肉段','玉米馒头','龙须面','锅包肉','白面馒头','空心面'],
                  ['烤鱼','荠菜馄饨','炸酱面','烤肉','韭菜馄饨','热干面','涮羊肉'],
                  ['芹菜馄饨','担担面','香锅','白菜馄饨','刀削面','焖锅'],
                  ['菠菜馄饨','臊子面','石锅鱼','胡萝卜馄饨','油泼面'],
                  ['炒面','火锅','玉米馄饨','拉面','串串','虾仁水饺','盖浇饭','烧烤','牛肉馄饨','蛋炒饭','麻辣烫','香菇馄饨','炒米粉'],
                  ['烤鱼','荠菜馄饨','炸酱面','烤肉','韭菜馄饨','热干面','涮羊肉'],
                  ['芹菜馄饨','担担面','香锅','白菜馄饨','刀削面','焖锅'],
                  ['菠菜馄饨','臊子面','石锅鱼','胡萝卜馄饨','油泼面'],
                  ['铁锅炖','玉米水饺','手擀面','羊蝎子','三鲜水饺','凉面'],
                  ['黄瓜','炖菜','炒河粉','炒年糕','炒河粉','炒米粉'],
                  ['松鼠桂鱼','奶酥包','阳春面','梅菜扣肉','水晶包','旗花面','夫妻肺片'],
                  ['粘豆包','奥灶面','蒜泥白肉','米糕','锅盖面','口水鸡','发糕','片儿川面'],
                  ['盐水鸭','蛋糕','云吞面','汽锅鸡','面包','黄鱼面','腊味合蒸','饼干'],
                  ['虾子面','西湖醋鱼','桃酥','车仔面','剁椒皮蛋','蛋挞','竹升面'],
                  ['上汤娃娃菜','泡芙','沙茶面','白灼虾','肉松小贝','燃面','清蒸鲈鱼'],
                  ['麻薯','双椒拌面','红烧狮子头','绿豆糕','肉酱面','香煎带鱼','红豆饼'],
                  ['杂酱面','油焖大虾','枣糕','酸汤面','蒜蓉扇贝','牛舌饼','麻酱面'],
                  ['香辣螺狮','豌豆黄','鸡杂面','辣炒花蛤','驴打滚','泡椒面','葱姜蟹'],
                  ['桂花糕','酸菜面','干炸小黄鱼','鸡蛋糕','咖喱面','红烧排骨','肉松卷'],
                  ['海鲜面','可乐鸡翅','海苔肉松小贝','豚骨拉面','糖醋里脊','芒果蛋糕'],
                  ['意大利面','鱼香茄子','草莓蛋糕','冷面','地三鲜','抹茶蛋糕','朝鲜冷面'],
                  ['木须肉','蓝莓蛋糕','炸酱拌面','溜肝尖','虎皮蛋糕','西红柿牛肉面'],
                  ['熘三样','肉松面包','香菇鸡肉面','炒合菜','全麦面包','红烧牛肉面'],
                  ['松仁玉米','牛角面包','排骨面','西芹百合','手撕面包','鸡块面','拔丝地瓜']
                ],
                [
                  ['干炸小黄鱼','鸡蛋糕','咖喱面','红烧排骨','肉松卷','海鲜面','可乐鸡翅','海苔肉松小贝','豚骨拉面','糖醋里脊','芒果蛋糕','意大利面','鱼香茄子','草莓蛋糕','冷面','地三鲜','抹茶蛋糕'],
                  ['小龙虾','猪肉水饺','焖面','牛蛙煲','鲅鱼水饺','烩面','鸡公煲'],
                  ['虾仁蒸饺','炒河粉','猪肚鸡','牛肉蒸饺','过桥米线','梭边鱼','素蒸饺'],
                  ['酸辣粉','美蛙鱼头','羊肉蒸饺','螺蛳粉','柴火鸡','海鲜蒸饺','土豆粉'],
                  ['地锅鸡','蟹黄蒸饺','牛肉拉面','啤酒鸭','玉米煎饺','羊肉烩面','酸汤鱼'],
                  ['三鲜煎饺','重庆小面','香辣蟹','猪肉煎饺','宜宾燃面','剁椒鱼头','虾仁锅贴'],
                  ['砂锅面','鱼头泡饼','牛肉锅贴','热汤面','东坡肉','三鲜锅贴','打卤面'],
                  ['糖醋排骨','猪肉锅贴','鸡丝面','四喜丸子','虾仁烧麦','排骨面'],
                  ['回锅肉','牛肉烧麦','肥肠面','鱼香肉丝','三鲜烧麦','三鲜面','宫保鸡丁'],
                  ['猪肉烧麦','西红柿鸡蛋面','麻婆豆腐','虾仁包子','茄子面','水煮鱼'],
                  ['牛肉包子','豆角面','毛血旺','三鲜包子','菠菜面','京酱肉丝','猪肉包子'],
                  ['油酥面','溜肉段','玉米馒头','龙须面','锅包肉','白面馒头','空心面'],
                  ['糖醋鲤鱼','杂粮馒头','蝴蝶面','红烧肉','花卷馒头','荞麦面'],
                  ['香辣虾','糖三角','莜面','水煮牛肉','豆沙包','冷面','孜然羊肉','奶黄包'],
                  ['乌冬面','红焖羊肉','流沙包','手抓面','大盘鸡','叉烧包','担仔面'],
                ],
                [
                  ['炒面','火锅','玉米馄饨','拉面','串串','虾仁水饺','盖浇饭','烧烤','牛肉馄饨','蛋炒饭','麻辣烫','香菇馄饨','炒米粉','烤鱼','荠菜馄饨','炸酱面','烤肉','韭菜馄饨','热干面','涮羊肉','芹菜馄饨','担担面','香锅','白菜馄饨','刀削面','焖锅','菠菜馄饨','臊子面','石锅鱼','胡萝卜馄饨','油泼面','铁锅炖','玉米水饺','手擀面','羊蝎子','三鲜水饺','凉面','小龙虾','猪肉水饺','焖面','牛蛙煲','鲅鱼水饺','烩面','鸡公煲','虾仁蒸饺','炒河粉','猪肚鸡','牛肉蒸饺','过桥米线','梭边鱼','素蒸饺','酸辣粉','美蛙鱼头','羊肉蒸饺','螺蛳粉','柴火鸡','海鲜蒸饺','土豆粉','地锅鸡','蟹黄蒸饺','牛肉拉面','啤酒鸭','玉米煎饺','羊肉烩面','酸汤鱼','三鲜煎饺','重庆小面','香辣蟹','猪肉煎饺','宜宾燃面','剁椒鱼头','虾仁锅贴','砂锅面','鱼头泡饼','牛肉锅贴','热汤面','东坡肉','三鲜锅贴','打卤面','糖醋排骨','猪肉锅贴','鸡丝面','四喜丸子','虾仁烧麦','排骨面','回锅肉','牛肉烧麦','肥肠面','鱼香肉丝','三鲜烧麦','三鲜面','宫保鸡丁','猪肉烧麦','西红柿鸡蛋面','麻婆豆腐','虾仁包子','茄子面','水煮鱼','牛肉包子','豆角面','毛血旺','三鲜包子','菠菜面','京酱肉丝','猪肉包子','油酥面','溜肉段','玉米馒头','龙须面','锅包肉','白面馒头','空心面','糖醋鲤鱼','杂粮馒头','蝴蝶面','红烧肉','花卷馒头','荞麦面','香辣虾','糖三角','莜面','水煮牛肉','豆沙包','冷面','孜然羊肉','奶黄包','乌冬面','红焖羊肉','流沙包','手抓面','大盘鸡','叉烧包','担仔面','松鼠桂鱼','奶酥包','阳春面','梅菜扣肉','水晶包','旗花面','夫妻肺片','粘豆包','奥灶面','蒜泥白肉','米糕','锅盖面','口水鸡','发糕','片儿川面','盐水鸭','蛋糕','云吞面','汽锅鸡','面包','黄鱼面','腊味合蒸','饼干','虾子面','西湖醋鱼','桃酥','车仔面','剁椒皮蛋','蛋挞','竹升面','上汤娃娃菜','泡芙','沙茶面','白灼虾','肉松小贝','燃面','清蒸鲈鱼','麻薯','双椒拌面','红烧狮子头','绿豆糕','肉酱面','香煎带鱼','红豆饼','杂酱面','油焖大虾','枣糕','酸汤面','蒜蓉扇贝','牛舌饼','麻酱面','香辣螺狮','豌豆黄','鸡杂面','辣炒花蛤','驴打滚','泡椒面','葱姜蟹','桂花糕','酸菜面','干炸小黄鱼','鸡蛋糕','咖喱面','红烧排骨','肉松卷','海鲜面','可乐鸡翅','海苔肉松小贝','豚骨拉面','糖醋里脊','芒果蛋糕','意大利面','鱼香茄子','草莓蛋糕','冷面','地三鲜','抹茶蛋糕','朝鲜冷面','木须肉','蓝莓蛋糕','炸酱拌面','溜肝尖','虎皮蛋糕','西红柿牛肉面','熘三样','肉松面包','香菇鸡肉面','炒合菜','全麦面包','红烧牛肉面','松仁玉米','牛角面包','排骨面','西芹百合','手撕面包','鸡块面','拔丝地瓜']
                ]
              ],
              [
                [
                  ['炒面','火锅','玉米馄饨','拉面','串串','虾仁水饺','盖浇饭','烧烤','牛肉馄饨','蛋炒饭','麻辣烫','香菇馄饨','炒米粉'],
                  ['烤鱼','荠菜馄饨','炸酱面','烤肉','韭菜馄饨','热干面','涮羊肉'],
                  ['芹菜馄饨','担担面','香锅','白菜馄饨','刀削面','焖锅'],
                  ['菠菜馄饨','臊子面','石锅鱼','胡萝卜馄饨','油泼面'],
                  ['铁锅炖','玉米水饺','手擀面','羊蝎子','三鲜水饺','凉面'],
                  ['炖菜','炒河粉','炒年糕','炒河粉','炒米粉'],
                  ['炒面','火锅','玉米馄饨','拉面','串串','虾仁水饺','盖浇饭','烧烤','牛肉馄饨','蛋炒饭','麻辣烫','香菇馄饨','炒米粉'],
                  ['烤鱼','荠菜馄饨','炸酱面','烤肉','韭菜馄饨','热干面','涮羊肉'],
                  ['芹菜馄饨','担担面','香锅','白菜馄饨','刀削面','焖锅'],
                  ['菠菜馄饨','臊子面','石锅鱼','胡萝卜馄饨','油泼面'],
                  ['铁锅炖','玉米水饺','手擀面','羊蝎子','三鲜水饺','凉面'],
                  ['炖菜','炒河粉','炒年糕','炒河粉','炒米粉'],
                  ['炒面','火锅','玉米馄饨','拉面','串串','虾仁水饺','盖浇饭','烧烤','牛肉馄饨','蛋炒饭','麻辣烫','香菇馄饨','炒米粉'],
                ],
                [
                  ['油酥面','溜肉段','玉米馒头','龙须面','锅包肉','白面馒头','空心面'],
                  ['烤鱼','荠菜馄饨','炸酱面','烤肉','韭菜馄饨','热干面','涮羊肉'],
                  ['芹菜馄饨','担担面','香锅','白菜馄饨','刀削面','焖锅'],
                  ['菠菜馄饨','臊子面','石锅鱼','胡萝卜馄饨','油泼面'],
                  ['炒面','火锅','玉米馄饨','拉面','串串','虾仁水饺','盖浇饭','烧烤','牛肉馄饨','蛋炒饭','麻辣烫','香菇馄饨','炒米粉'],
                  ['烤鱼','荠菜馄饨','炸酱面','烤肉','韭菜馄饨','热干面','涮羊肉'],
                  ['芹菜馄饨','担担面','香锅','白菜馄饨','刀削面','焖锅'],
                  ['菠菜馄饨','臊子面','石锅鱼','胡萝卜馄饨','油泼面'],
                  ['铁锅炖','玉米水饺','手擀面','羊蝎子','三鲜水饺','凉面'],
                  ['黄瓜','炖菜','炒河粉','炒年糕','炒河粉','炒米粉'],
                  ['松鼠桂鱼','奶酥包','阳春面','梅菜扣肉','水晶包','旗花面','夫妻肺片'],
                  ['粘豆包','奥灶面','蒜泥白肉','米糕','锅盖面','口水鸡','发糕','片儿川面'],
                  ['盐水鸭','蛋糕','云吞面','汽锅鸡','面包','黄鱼面','腊味合蒸','饼干'],
                  ['虾子面','西湖醋鱼','桃酥','车仔面','剁椒皮蛋','蛋挞','竹升面'],
                  ['上汤娃娃菜','泡芙','沙茶面','白灼虾','肉松小贝','燃面','清蒸鲈鱼'],
                  ['麻薯','双椒拌面','红烧狮子头','绿豆糕','肉酱面','香煎带鱼','红豆饼'],
                  ['杂酱面','油焖大虾','枣糕','酸汤面','蒜蓉扇贝','牛舌饼','麻酱面'],
                  ['香辣螺狮','豌豆黄','鸡杂面','辣炒花蛤','驴打滚','泡椒面','葱姜蟹'],
                  ['桂花糕','酸菜面','干炸小黄鱼','鸡蛋糕','咖喱面','红烧排骨','肉松卷'],
                  ['海鲜面','可乐鸡翅','海苔肉松小贝','豚骨拉面','糖醋里脊','芒果蛋糕'],
                  ['意大利面','鱼香茄子','草莓蛋糕','冷面','地三鲜','抹茶蛋糕','朝鲜冷面'],
                  ['木须肉','蓝莓蛋糕','炸酱拌面','溜肝尖','虎皮蛋糕','西红柿牛肉面'],
                  ['熘三样','肉松面包','香菇鸡肉面','炒合菜','全麦面包','红烧牛肉面'],
                  ['松仁玉米','牛角面包','排骨面','西芹百合','手撕面包','鸡块面','拔丝地瓜']
                ],
                [
                  ['干炸小黄鱼','鸡蛋糕','咖喱面','红烧排骨','肉松卷','海鲜面','可乐鸡翅','海苔肉松小贝','豚骨拉面','糖醋里脊','芒果蛋糕','意大利面','鱼香茄子','草莓蛋糕','冷面','地三鲜','抹茶蛋糕'],
                  ['小龙虾','猪肉水饺','焖面','牛蛙煲','鲅鱼水饺','烩面','鸡公煲'],
                  ['虾仁蒸饺','炒河粉','猪肚鸡','牛肉蒸饺','过桥米线','梭边鱼','素蒸饺'],
                  ['酸辣粉','美蛙鱼头','羊肉蒸饺','螺蛳粉','柴火鸡','海鲜蒸饺','土豆粉'],
                  ['地锅鸡','蟹黄蒸饺','牛肉拉面','啤酒鸭','玉米煎饺','羊肉烩面','酸汤鱼'],
                  ['三鲜煎饺','重庆小面','香辣蟹','猪肉煎饺','宜宾燃面','剁椒鱼头','虾仁锅贴'],
                  ['砂锅面','鱼头泡饼','牛肉锅贴','热汤面','东坡肉','三鲜锅贴','打卤面'],
                  ['糖醋排骨','猪肉锅贴','鸡丝面','四喜丸子','虾仁烧麦','排骨面'],
                  ['回锅肉','牛肉烧麦','肥肠面','鱼香肉丝','三鲜烧麦','三鲜面','宫保鸡丁'],
                  ['猪肉烧麦','西红柿鸡蛋面','麻婆豆腐','虾仁包子','茄子面','水煮鱼'],
                  ['牛肉包子','豆角面','毛血旺','三鲜包子','菠菜面','京酱肉丝','猪肉包子'],
                  ['油酥面','溜肉段','玉米馒头','龙须面','锅包肉','白面馒头','空心面'],
                  ['糖醋鲤鱼','杂粮馒头','蝴蝶面','红烧肉','花卷馒头','荞麦面'],
                  ['香辣虾','糖三角','莜面','水煮牛肉','豆沙包','冷面','孜然羊肉','奶黄包'],
                  ['乌冬面','红焖羊肉','流沙包','手抓面','大盘鸡','叉烧包','担仔面'],
                ],
                [
                  ['炒面','火锅','玉米馄饨','拉面','串串','虾仁水饺','盖浇饭','烧烤','牛肉馄饨','蛋炒饭','麻辣烫','香菇馄饨','炒米粉','烤鱼','荠菜馄饨','炸酱面','烤肉','韭菜馄饨','热干面','涮羊肉','芹菜馄饨','担担面','香锅','白菜馄饨','刀削面','焖锅','菠菜馄饨','臊子面','石锅鱼','胡萝卜馄饨','油泼面','铁锅炖','玉米水饺','手擀面','羊蝎子','三鲜水饺','凉面','小龙虾','猪肉水饺','焖面','牛蛙煲','鲅鱼水饺','烩面','鸡公煲','虾仁蒸饺','炒河粉','猪肚鸡','牛肉蒸饺','过桥米线','梭边鱼','素蒸饺','酸辣粉','美蛙鱼头','羊肉蒸饺','螺蛳粉','柴火鸡','海鲜蒸饺','土豆粉','地锅鸡','蟹黄蒸饺','牛肉拉面','啤酒鸭','玉米煎饺','羊肉烩面','酸汤鱼','三鲜煎饺','重庆小面','香辣蟹','猪肉煎饺','宜宾燃面','剁椒鱼头','虾仁锅贴','砂锅面','鱼头泡饼','牛肉锅贴','热汤面','东坡肉','三鲜锅贴','打卤面','糖醋排骨','猪肉锅贴','鸡丝面','四喜丸子','虾仁烧麦','排骨面','回锅肉','牛肉烧麦','肥肠面','鱼香肉丝','三鲜烧麦','三鲜面','宫保鸡丁','猪肉烧麦','西红柿鸡蛋面','麻婆豆腐','虾仁包子','茄子面','水煮鱼','牛肉包子','豆角面','毛血旺','三鲜包子','菠菜面','京酱肉丝','猪肉包子','油酥面','溜肉段','玉米馒头','龙须面','锅包肉','白面馒头','空心面','糖醋鲤鱼','杂粮馒头','蝴蝶面','红烧肉','花卷馒头','荞麦面','香辣虾','糖三角','莜面','水煮牛肉','豆沙包','冷面','孜然羊肉','奶黄包','乌冬面','红焖羊肉','流沙包','手抓面','大盘鸡','叉烧包','担仔面','松鼠桂鱼','奶酥包','阳春面','梅菜扣肉','水晶包','旗花面','夫妻肺片','粘豆包','奥灶面','蒜泥白肉','米糕','锅盖面','口水鸡','发糕','片儿川面','盐水鸭','蛋糕','云吞面','汽锅鸡','面包','黄鱼面','腊味合蒸','饼干','虾子面','西湖醋鱼','桃酥','车仔面','剁椒皮蛋','蛋挞','竹升面','上汤娃娃菜','泡芙','沙茶面','白灼虾','肉松小贝','燃面','清蒸鲈鱼','麻薯','双椒拌面','红烧狮子头','绿豆糕','肉酱面','香煎带鱼','红豆饼','杂酱面','油焖大虾','枣糕','酸汤面','蒜蓉扇贝','牛舌饼','麻酱面','香辣螺狮','豌豆黄','鸡杂面','辣炒花蛤','驴打滚','泡椒面','葱姜蟹','桂花糕','酸菜面','干炸小黄鱼','鸡蛋糕','咖喱面','红烧排骨','肉松卷','海鲜面','可乐鸡翅','海苔肉松小贝','豚骨拉面','糖醋里脊','芒果蛋糕','意大利面','鱼香茄子','草莓蛋糕','冷面','地三鲜','抹茶蛋糕','朝鲜冷面','木须肉','蓝莓蛋糕','炸酱拌面','溜肝尖','虎皮蛋糕','西红柿牛肉面','熘三样','肉松面包','香菇鸡肉面','炒合菜','全麦面包','红烧牛肉面','松仁玉米','牛角面包','排骨面','西芹百合','手撕面包','鸡块面','拔丝地瓜']
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SubPageHistory extends StatelessWidget {
  const _SubPageHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      
      navigationBar: const CustomCupertinoNavigationBar(
        title: '时令食物推荐',
        subTitle: "应时知节寻美味，传统源流心底藏。",

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
            _layerMainHistory(context),
          ]
        ),
      ),
    );
  }
}

BottomNavigationBarItem _tabBarItem(String text) {
  return BottomNavigationBarItem(
    icon: Row(
      children: [
        const SizedBox(
          height: 16,
          width: 10,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF4A5568),
            fontSize: 16,
            fontFamily: "WYMingChao",
          ),
        ),
      ],
    ),
    activeIcon: Row(
      children: [
        Container(
          height: 16,
          width: 8,
          decoration: const BoxDecoration(
            color: Color(0xFF791414),
            borderRadius: BorderRadius.all(Radius.circular(2))
          ),
        ),
        const SizedBox(
          height: 18,
          width: 2,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF4A5568),
            fontSize: 16,
            fontFamily: "WYMingChao",
          ),
        ),
      ],
    ),
  );
  
}

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  int subPageIndex = 2;
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      //TODO
      // controller: CupertinoTabController(),
      tabBar: SfssTabBar(
        border: const Border(
          top: BorderSide(
            color: Color(0xFF000000),
            width: 1,
          ),
        ),
        backgroundColor: Colors.white,
        itemSpacing: 50,
        currentIndex: subPageIndex,
        items: <BottomNavigationBarItem>[
          // 3 <-- SEE HERE
          _tabBarItem('推荐'),
          _tabBarItem('图鉴'),
          _tabBarItem('今日'),
          _tabBarItem('历史'),
        // items: const <BottomNavigationBarItem>[
        //   // 3 <-- SEE HERE
        //   BottomNavigationBarItem(
        //     icon: Icon(CupertinoIcons.star), 
        //     label: '推荐'
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(CupertinoIcons.collections), 
        //     // label: '图鉴'
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(CupertinoIcons.today), 
        //     // label: '今天'
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(CupertinoIcons.calendar), 
        //     // label: '历史'
        //   ),
        ],
      ), 
      tabBuilder: (context, index) {
        late final CupertinoTabView returnValue;
        switch (index) {
          case 0:
            // 4 <-- SEE HERE
            returnValue = CupertinoTabView(
              builder: (context) {
              return const _SubPageRecommend();
            });
            break;
          case 1:
            returnValue = CupertinoTabView(
              builder: (context) {
                return const _SubPageCollection();
              },
            );
            break;
          case 2:
            returnValue = CupertinoTabView(
              builder: (context) {
                return const _SubPageToday();
              },
            );
            break;
          case 3:
            returnValue = CupertinoTabView(
              builder: (context) {
                return const _SubPageHistory();
              },
            );
            break;
        }
        return returnValue;
      },
    );
  }
}