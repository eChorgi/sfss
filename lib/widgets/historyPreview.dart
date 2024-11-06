import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sfss/styles/mainStyle.dart';

class historyPreview extends StatefulWidget {

  late int year;
  late int month;
  late double process;

  @override
  State<historyPreview> createState() => _historyPreviewState();

}

class _historyPreviewState extends State<historyPreview> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 58.0),
            child: Text(
              '历史食览',
              style: TextStyle(
                color: const Color(0xFF4A5568),
                fontSize: 22,
                fontFamily: SfssStyle.mainFont,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Container(
              height: 270,
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
                    //TODO
                    _dateShower(2024, 7),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
List<String> dishes = ['南京灌汤包','牛肉面','手抓饼','麻辣烫','日式拉面','玉米馄饨','炒饭','炒面','炒河粉','炒粉丝','炒米粉','炒年糕','炒土豆丝','炒青菜','炒豆芽','炒豆腐','炒豆腐皮','炒面','火锅','玉米馄饨','拉面','串串','虾仁水饺','盖浇饭','烧烤','牛肉馄饨','蛋炒饭','麻辣烫','香菇馄饨','炒米粉','烤鱼','荠菜馄饨','炸酱面','烤肉','韭菜馄饨','热干面','涮羊肉','芹菜馄饨','担担面','香锅','白菜馄饨','刀削面','焖锅','菠菜馄饨','臊子面','石锅鱼','胡萝卜馄饨','油泼面','铁锅炖','玉米水饺','手擀面','羊蝎子','三鲜水饺','凉面','小龙虾','猪肉水饺','焖面','牛蛙煲','鲅鱼水饺','烩面','鸡公煲','虾仁蒸饺','炒河粉','猪肚鸡','牛肉蒸饺','过桥米线','梭边鱼','素蒸饺','酸辣粉','美蛙鱼头','羊肉蒸饺','螺蛳粉','柴火鸡','海鲜蒸饺','土豆粉','地锅鸡','蟹黄蒸饺','牛肉拉面','啤酒鸭','玉米煎饺','羊肉烩面','酸汤鱼','三鲜煎饺','重庆小面','香辣蟹','猪肉煎饺','宜宾燃面','剁椒鱼头','虾仁锅贴','砂锅面','鱼头泡饼','牛肉锅贴','热汤面','东坡肉','三鲜锅贴','打卤面','糖醋排骨','猪肉锅贴','鸡丝面','四喜丸子','虾仁烧麦','排骨面','回锅肉','牛肉烧麦','肥肠面','鱼香肉丝','三鲜烧麦','三鲜面','宫保鸡丁','猪肉烧麦','西红柿鸡蛋面','麻婆豆腐','虾仁包子','茄子面','水煮鱼','牛肉包子','豆角面','毛血旺','三鲜包子','菠菜面','京酱肉丝','猪肉包子','油酥面','溜肉段','玉米馒头','龙须面','锅包肉','白面馒头','空心面','糖醋鲤鱼','杂粮馒头','蝴蝶面','红烧肉','花卷馒头','荞麦面','香辣虾','糖三角','莜面','水煮牛肉','豆沙包','冷面','孜然羊肉','奶黄包','乌冬面','红焖羊肉','流沙包','手抓面','大盘鸡','叉烧包','担仔面','松鼠桂鱼','奶酥包','阳春面','梅菜扣肉','水晶包','旗花面','夫妻肺片','粘豆包','奥灶面','蒜泥白肉','米糕','锅盖面','口水鸡','发糕','片儿川面','盐水鸭','蛋糕','云吞面','汽锅鸡','面包','黄鱼面','腊味合蒸','饼干','虾子面','西湖醋鱼','桃酥','车仔面','剁椒皮蛋','蛋挞','竹升面','上汤娃娃菜','泡芙','沙茶面','白灼虾','肉松小贝','燃面','清蒸鲈鱼','麻薯','双椒拌面','红烧狮子头','绿豆糕','肉酱面','香煎带鱼','红豆饼','杂酱面','油焖大虾','枣糕','酸汤面','蒜蓉扇贝','牛舌饼','麻酱面','香辣螺狮','豌豆黄','鸡杂面','辣炒花蛤','驴打滚','泡椒面','葱姜蟹','桂花糕','酸菜面','干炸小黄鱼','鸡蛋糕','咖喱面','红烧排骨','肉松卷','海鲜面','可乐鸡翅','海苔肉松小贝','豚骨拉面','糖醋里脊','芒果蛋糕','意大利面','鱼香茄子','草莓蛋糕','冷面','地三鲜','抹茶蛋糕','朝鲜冷面','木须肉','蓝莓蛋糕','炸酱拌面','溜肝尖','虎皮蛋糕','西红柿牛肉面','熘三样','肉松面包','香菇鸡肉面','炒合菜','全麦面包','红烧牛肉面','松仁玉米','牛角面包','排骨面','西芹百合','手撕面包','鸡块面','拔丝地瓜'];
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
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Container(
                height: 2.5,
                width: 360,
                color: Color(0xFF616A7B),
              ),
            )
          ],
        )
      ),
      Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: SizedBox(
          height: 230,
          width: 360,
          child: ListView.separated(
            padding: const EdgeInsets.only(left: 42.0),
            scrollDirection: Axis.horizontal,
            itemCount: 147,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 16.0, top: 86.0),
                    child: SizedBox(
                      width: 20,
                      child: Text(
                        dishes[index],
                        strutStyle: const StrutStyle(height: 1.9),
                        style: TextStyle(
                          color: const Color(0xFF4A5568),
                          fontSize: 22,
                          fontFamily: SfssStyle.mainFont,
                        )
                      ),
                    ),
                  ),
                  if(index%3 == 0)Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Container(
                      height: 30,
                      width: 60,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0, right: 5.0),
                              child: Container(
                                height: 20,
                                width: 14,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF791414),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),
                            Text(
                              (index/3%31+1).toInt().toString(),
                              style: TextStyle(
                                color: const Color(0xFF791414),
                                fontSize: 28,
                                fontFamily: SfssStyle.mainFont,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 86.0),
                child: Container(
                  width: 0.1,
                  height: 100,
                  color: Color(0xFF616A7B),
                ),
              );
            },
          ),
        ),
      )
    ],
  );
}