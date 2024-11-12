import 'package:flutter/material.dart';

class SfssStyle{
  static String mainFont = "又又意宋";
  static Color mainRed = const Color(0xFF791414);
  static Color mainGrey = const Color(0xFF4A5568);
  static Color weakRed = const Color(0xFF882F2F);
  static Color weakGrey = const Color(0xFFA4AAB3);
  static Color mainWhite = const Color(0xFFFBFAFA);

  //颜色数组
  static List<List<Color>> badgeLevelColors = [
  [const Color(0xFFD3D3D3),const Color(0xFFD3D3D3),const Color(0xFFD3D3D3)],
  [Color(0xFF8FA9C8), Color(0xFFA6B9D9), Color(0xFFBFD3E1)],
  [Color(0xFFD1C6A4), Color(0xFFDCD4BA), Color(0xFFE9E3D3)]
  ];
  
  static List<List<Color>> solarTermColors = const [
    [Color(0xFF85A193), Color(0xFF9DBBAC), Color(0xFFB7D3C8)],//立春
    [Color(0xFF576F4B), Color(0xFF7C9253), Color(0xFFABBC81)],//雨水
    [Color(0xFF3B58A1), Color(0xFF6075B4), Color(0xFF7691C9)],//惊蛰
    [Color(0xFF91695A), Color(0xFFA77061), Color(0xFFB4836E)],//春分
    [Color(0xFF7A836F), Color(0xFF909079), Color(0xFF9C9B84)],//清明
    [Color(0xFF755580), Color(0xFFA17EB3), Color(0xFFB6A0C8)],//谷雨
    
    [Color(0xFFD1312B), Color(0xFFD65539), Color(0xFFDC744C)],//立夏
    [Color(0xFFB5BBA8), Color(0xFFBFC9B7), Color(0xFFCCD6C5)],//小满
    [Color(0xFF918F61), Color(0xFFAAA689), Color(0xFFBEBF99)],//芒种
    [Color(0xFF782F2E), Color(0xFF883A35), Color(0xFFA24539)],//夏至
    [Color(0xFF19365D), Color(0xFF21446B), Color(0xFF2A4F77)],//小暑
    [Color(0xFF6F8D6D), Color(0xFF86A182), Color(0xFF9EB296)],//大暑
    
    [Color(0xFFBB7C34), Color(0xFFD09D4A), Color(0xFFF2C35A)],//立秋
    [Color(0xFFAE7CAC), Color(0xFFC594B9), Color(0xFFDEB8D2)],//处暑
    [Color(0xFFD1C6A4), Color(0xFFDCD4BA), Color(0xFFE9E3D3)],//白露
    [Color(0xFF966336), Color(0xFFC58847), Color(0xFFCAA34D)],//秋分
    [Color(0xFF222B46), Color(0xFF25355D), Color(0xFF1D3E70)],//寒露
    [Color(0xFF937E6D), Color(0xFFB8A78D), Color(0xFFD0C0A7)],//霜降
    
    [Color(0xFF602F31), Color(0xFF7B4C50), Color(0xFF966B6E)],//立冬
    [Color(0xFF8FA9C8), Color(0xFFA6B9D9), Color(0xFFBFD3E1)],//小雪
    [Color(0xFFA44D55), Color(0xFFB5626A), Color(0xFFC28A91)],//大雪
    [Color(0xFF343531), Color(0xFF484640), Color(0xFF58544A)],//冬至
    [Color(0xFF1D212B), Color(0xFF414754), Color(0xFF59636D)],//小寒
    [Color(0xFF70585C), Color(0xFF97868E), Color(0xFF978C9A)],//大寒
  ];
}