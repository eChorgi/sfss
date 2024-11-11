import 'package:flutter/cupertino.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/__old/collectionHeader.dart';
import 'package:sfss/__old/smallCardItem.dart';

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
  return smallCardItem(
    name: name, //name.substring(0,min(5,name.length))+(name.length>5?'···':''), 
    // describe: dishesDescribe[tagIndex][subTagIndex][index],
    describe: '已品鉴${(100-index/3).toInt()}次',
    padding: const EdgeInsets.only(left: 2.0, right: 2.0, top: 12.0, bottom: 12.0),
    showDetailButton: false,
    describeOffset: 54,
    context: context
  );
}

Widget layerMain(BuildContext context, Function(int) onPressTag, Function(int) onPressSubTag, int tagIndex, int subTagIndex, List<List<String>> tagName, List<List<List<String>>> dishes, List<List<List<String>>> dishesDescribe) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 66.0),
        child: CupertinoButton(
          padding: const EdgeInsets.only(left: 11, right:11),
          child: Text(
            '回到顶部',
            style: TextStyle(
              color: const Color(0xFF4A5568),
              fontSize: 18,
              fontFamily: SfssStyle.mainFont,
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
                      fontFamily: SfssStyle.mainFont,
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


class SubPageCollection extends StatefulWidget {
  const SubPageCollection({super.key});
  @override
  _SubPageCollectionState createState() => _SubPageCollectionState();
}
class _SubPageCollectionState extends State<SubPageCollection> {
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
            layerMain(
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

