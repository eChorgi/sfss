import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/__old/navigationBar.dart';

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
                  style: TextStyle(
                    color: const Color(0xFF791414),
                    fontSize: 26,
                    fontFamily: SfssStyle.mainFont,
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
      Padding(
        padding: const EdgeInsets.only(top: 22.0),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Text(
              '甲辰',
              style: TextStyle(
                color: const Color(0xFFF4F5F6),
                fontSize: 38,
                fontFamily: SfssStyle.mainFont,
              ),
            ),
            const Spacer(),
            Text(
              '癸酉',
              style: TextStyle(
                color: const Color(0xFFF4F5F6),
                fontSize: 38,
                fontFamily: SfssStyle.mainFont,
              ),
            ),
            const SizedBox(width: 20),
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
                  style: TextStyle(
                    color: const Color(0xFF4A5568),
                    fontSize: 34,
                    fontFamily: SfssStyle.mainFont,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  '/',
                  style: TextStyle(
                    color: const Color(0xFF4A5568),
                    fontSize: 34,
                    fontFamily: SfssStyle.mainFont,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  month<10?'0$month':'$month',
                  style: TextStyle(
                    color: const Color(0xFF4A5568),
                    fontSize: 34,
                    fontFamily: SfssStyle.mainFont,
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
                        style: TextStyle(
                          color: const Color(0xFF4A5568),
                          fontSize: 16,
                          fontFamily: SfssStyle.mainFont,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    content,
                    style: TextStyle(
                      color: const Color(0xFF4A5568),
                      fontSize: 13,
                      fontFamily: SfssStyle.mainFont,
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
Widget _layerMain(BuildContext context) {
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

class SubPageHistory extends StatelessWidget {
  const SubPageHistory({Key? key}) : super(key: key);

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
            _layerMain(context),
          ]
        ),
      ),
    );
  }
}