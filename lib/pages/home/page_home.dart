import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfss/tabBar.dart';
import 'package:sfss/widgets.dart';
import 'package:sfss/navigationBar.dart';
import 'history_preview.dart';

Widget _layerMainToday(BuildContext context) {
  return Center(
    child: Column(
      children: [
        _poemCard(),
        historyPreview(),
        _todayRecord()
      ],
    ),
  );
}

Widget _vegetableItem(String name, String discribe, List<String> dishes, List<String> dishes_desc) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 18.0),
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
  );

}

Widget _vegetableList() {
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
        _vegetableItem("苦瓜", "清热消暑、养血益气。", ["苦瓜炒蛋", "苦瓜炒肉", "苦瓜酿肉","苦瓜炒牛肉","苦瓜拌木耳","苦瓜炒虾仁","苦瓜煎蛋饼"],["翠衣裹金珠，苦尽甘来香", "苦中带甘味，清心又养生","翠玉藏金蕊，苦尽甘来美","碧叶卷红丝，苦香牛肉宜","翠裙舞黑耳，苦甘凉意生","玉片托红珠，苦中藏鲜美","金波托翠台，苦香蛋中来"]),
        _vegetableItem("黄瓜", "清热利尿、美容养颜。", ["黄瓜凉拌", "黄瓜炒虾仁", "黄瓜蘸酱", "黄瓜鸡蛋卷", "黄瓜汁"], ["翠丝凉意绕，夏日长悠悠", "玉珠伴翠影，清淡味更足", "青翠蘸香韵，简单见风雅", "翠被裹金辉，春意口中回", "碧波荡心间，清新自然还"]),
        _vegetableItem("西红柿", "生津止渴、降火解毒。", ["西红柿炒鸡蛋", "西红柿炖牛肉", "西红柿炒虾仁", "西红柿炒鸡蛋", "西红柿炒鸡蛋"], ["红翠舞金丝，酸甜口中留", "红翠托金辉，鲜美味中生", "红翠托白玉，清香鲜美味", "红翠托金辉，鲜美味中生", "红翠托金辉，鲜美味中生"]),
        
      ]
    )
  );
}

Widget _fruitItem(String name, String discribe) {
  return Padding(
    padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 12.0, bottom: 12.0),
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
                  style: const TextStyle(
                    color: Color(0xFF791414),
                    fontSize: 21,
                    fontFamily: "WYMingChao",
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Text(
                discribe,
                style: const TextStyle(
                  color: Color(0xFF687281),
                  fontSize: 13,
                  fontFamily: "WYMingChao",
                ),
              ),
            ),
          ),
          Padding(
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
      )
    ),
  );
}

Widget _fruitList() {
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
            _fruitItem('西瓜', '清热解暑，甘甜多汁'),
            _fruitItem('杨梅', '生津止渴，消食开胃'),
            _fruitItem('芒果', '热带果王，营养丰富'),
            _fruitItem('樱桃', '色泽鲜艳，酸甜可口'),
            _fruitItem('西瓜', '清热解暑，甘甜多汁'),
            _fruitItem('杨梅', '生津止渴，消食开胃'),
            _fruitItem('芒果', '热带果王，营养丰富'),
            _fruitItem('樱桃', '色泽鲜艳，酸甜可口'),
            
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
        _vegetableList(),
        _fruitList(),
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

Widget _todayRecord() {
  return Padding(
    padding: const EdgeInsets.only(top: 50.0),
    child: SizedBox(
        width: 260,
        height: 50,
        child: Sfss.button(
          text: '今日记录', 
          onPressed: ()=>{},//TODO
          padding: const EdgeInsets.all(0),
          )
      ),
  );
}

class _SubPageToday extends StatelessWidget {
  const _SubPageToday({super.key});
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      
      navigationBar: const CustomCupertinoNavigationBar(
        title: '中午好',
        subTitle: "夏时饶温和，避暑就清凉。",

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
            _layerMainToday(context),
          ],
        ),
      ),
    );
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
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: SfssTabBar(
        border: const Border(
          top: BorderSide(
            color: Color(0xFF000000),
            width: 1,
          ),
        ),
        backgroundColor: Colors.white,
        itemSpacing: 50,
        currentIndex: _currentIndex,
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
                return const _SubPageToday();
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
                return const _SubPageToday();
              },
            );
            break;
        }
        return returnValue;
      },
    );
  }
}