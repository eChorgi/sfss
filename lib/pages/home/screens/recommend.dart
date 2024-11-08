import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfss/pages/detail/pageDetail.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/navigationBar.dart';
import 'package:sfss/widgets/smallCardItem.dart';


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
                      style: TextStyle(
                        color: const Color(0xFF791414),
                        fontSize: 26,
                        fontFamily: SfssStyle.mainFont,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      discribe,
                      style: TextStyle(
                        color: const Color(0xFF687281),
                        fontSize: 12,
                        fontFamily: SfssStyle.mainFont,
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
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          '查看详情',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: SfssStyle.mainFont,
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
                                      style: TextStyle(
                                        color: const Color(0xFF4A5568),
                                        fontSize: 15,
                                        fontFamily: SfssStyle.mainFont,
                                      ),
                                    ),
                                  const SizedBox(height: 8),
                                  Text(
                                      dishes_desc[index],
                                      style: TextStyle(
                                        color: const Color(0xFF4A5568),
                                        fontSize: 10,
                                        fontFamily: SfssStyle.mainFont,
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
        Padding(
          padding: const EdgeInsets.only(top: 34.0),
          child: Text(
            '蔬菜类',
            style: TextStyle(
              color: const Color(0xFF4A5568),
              fontSize: 22,
              fontFamily: SfssStyle.mainFont,
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

Widget _fruitList(BuildContext context) {
  return Center(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 34.0),
          child: Text(
            '水果类',
            style: TextStyle(
              color: const Color(0xFF4A5568),
              fontSize: 22,
              fontFamily: SfssStyle.mainFont,
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
            smallCardItem(name: '西瓜', describe: '清热解暑，甘甜多汁', context: context),
            smallCardItem(name: '杨梅', describe: '生津止渴，消食开胃', context: context),
            smallCardItem(name: '芒果', describe: '热带果王，营养丰富', context: context),
            smallCardItem(name: '樱桃', describe: '色泽鲜艳，酸甜可口', context: context),
            smallCardItem(name: '西瓜', describe: '清热解暑，甘甜多汁', context: context),
            smallCardItem(name: '杨梅', describe: '生津止渴，消食开胃', context: context),
            smallCardItem(name: '芒果', describe: '热带果王，营养丰富', context: context),
            smallCardItem(name: '樱桃', describe: '色泽鲜艳，酸甜可口', context: context),
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
class SubPageRecommend extends StatelessWidget {
  const SubPageRecommend({super.key});
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