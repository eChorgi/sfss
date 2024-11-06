class FoodData {
  int index;
  String name;
  String describe;
  String history;
  DateTime lastTasted;
  int tasteCount;
  double myRank;
  double globalRank;
  String ?assetPath;
  int globalRankNum = 1003;
  FoodData({
    required this.index,
    required this.name,
    required this.describe,
    required this.history,
    required this.lastTasted,
    required this.tasteCount,
    required this.myRank,
    required this.globalRank,
  }){
    assetPath = 'assets/images/food/food_$index.png';
  }
}

List<FoodData> foodDatas = [
  FoodData(index:0, name:'苦瓜', describe:'苦瓜富含维生素C和维生素B1、B2等B族维生素，具有抗氧化作用，能增强免疫力，促进胶原蛋白的合成，维持神经系统的正常功能和新陈代谢的稳定。', history:'苦瓜，古名锦荔枝，也称癞瓜。其性喜温，耐湿不耐寒，原产于印度，后传入中国。《救荒本草》记载其为明代朱所录，距今已六百余年。苦瓜不传己苦与他物，故有“君子菜”之称。其味虽苦，却有清心明目之效，古人亦有诗赞之：“口苦能写偈，心清志方操。”', lastTasted:DateTime.now(), tasteCount:1, myRank:4, globalRank:4.2),
  FoodData(index:1, name:'黄瓜', describe:'黄瓜富含多种维生素与矿物质，如维生素B1、B2、C，以及钙、磷、铁等，对改善大脑和神经系统功能有利，能安神定志，辅助治疗失眠症。其含有的丙醇二酸，可抑制糖类转化为脂肪，助减肥强体。', history:'黄瓜，古名胡瓜，其名始于汉代，张骞通西域，携种而归，初植于中原。《本草纲目》载：“张骞出使西域得种故名。” 然其名之由来，亦有异说。一说为避石勒之讳，改胡为黄，故称黄瓜。《拾遗记》云：“大业四年，避讳改为黄瓜，俗又称胡瓜。” 其色青绿，何谓黄瓜？盖因熟时皮黄，故有是称。”', lastTasted:DateTime.now(), tasteCount:1, myRank:5, globalRank:4.8),
];