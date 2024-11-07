import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfss/plugins/adapt.dart';
import 'package:sfss/styles/mainStyle.dart';
import 'package:sfss/widgets/sfssWidget.dart';

class PageWelcomeLogin extends StatefulWidget {
  const PageWelcomeLogin({super.key});
  @override
  State<PageWelcomeLogin> createState() => _PageWelcomeLoginState();
}

class _PageWelcomeLoginState extends State<PageWelcomeLogin> with SingleTickerProviderStateMixin {
  bool isLoginShow = false;
  late AnimationController _controller;
  late List<Animation<double>> opacities;
  late Animation<double> offsetUp;
  late Animation<double> bgOpacity;
  late Animation<double> Function(double, double) f;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    
    f = (double begin, double end) => Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          begin,
          end,
          curve: Curves.ease,
        ),
      ),
    );

    int intvNum = 5;
    opacities = [];
    for(int i = 0; i < intvNum; i++) {
      double interval = 0.6/intvNum;
      var begin = 0.1*interval * i;
      var end = interval * (i + 1);

      if (begin < 0.0) begin = 0.0;
      if (end > 0.4) end = 1.0;
      opacities.add(f(begin, end));
    }
    offsetUp = f(0.36, 0.76);
    bgOpacity = f(0.5, 1);
  }
  Widget title() {
    return Column(
      children: [
        Opacity(
          opacity: opacities[4].value,
          child: Text(
            '四方食事',
            style: TextStyle(
              color: Colors.white,
              fontFamily: SfssStyle.mainFont,
              fontSize: pxmin(36, maxScale: 2.0, hscale: 2),
            ),
          ),
        ),
        SizedBox(height: pxh(24)+px(12)),
        Opacity(
          opacity: opacities[3].value,
          child: Text(
            '不过一碗人间烟火',
            style: TextStyle(
              color: Colors.white,
              fontFamily: SfssStyle.mainFont,
              fontSize: pxmin(14, maxScale: 2.0, hscale: 2),
              letterSpacing: px(9, maxScale: 2.0)
            ),
          ),
        ),
      ],
    );
  }
  Widget wxLoginButton() {
    return Opacity(
      opacity: opacities[2].value,
      child: Center(
        child: SizedBox(
          width: pxmin(269, maxScale: 1.4, hscale: 2),
          height: pxmin(51, maxScale: 1.4, hscale: 2),
          child: SfssWidget.button(
            text: "微信登录",
            fontSize: pxmin(20, maxScale: 1.5, hscale: 2),
            onPressed: (){
              _controller.forward();
            // Navigator.pushNamed(context, '/login');
          }),
        ),
      ),
    );
  }
  Widget mobileLoginButton() {
    return Opacity(
      opacity: opacities[1].value,
      child: Center(
        child: SizedBox(
          width: px(114, maxScale: 1.5),
          height: px(19, maxScale: 1.5),
          child: SfssWidget.button(
            color: Colors.transparent,
            text: "手机号注册 / 登录",
            fontSize: pxmin(14, maxScale: 1.5, hscale: 2),
            onPressed: (){
            // Navigator.pushNamed(context, '/login');
            _controller.forward();
          }),
        ),
      ),
    );
  }
  Widget layerTitle() {
    return Center(
      child: Column(
        children: [
          SizedBox(height: pxh(284)-px(20)),
          title(),
        ],
      ),
    );
  }
  Widget privacyPolicy() {
    return Opacity(
      opacity: opacities[0].value,
      child: RichText(
        text: TextSpan(
          text: '登录即代表您已阅读并同意',
          style: TextStyle(
            color: const Color(0xBFFFFFFF),
            fontSize: px(11, maxScale: 1),
            fontFamily: SfssStyle.mainFont,
          ),
          children: <TextSpan>[
            TextSpan(
              text: '《隐私政策》',
              style: TextStyle(
                color: Colors.white,
                fontSize: px(11, maxScale: 1),
                fontFamily: SfssStyle.mainFont,
              ),
            ),
            TextSpan(
              text: '和',
              style: TextStyle(
                color: const Color(0xBFFFFFFF),
                fontSize: px(11, maxScale: 1),
                fontFamily: SfssStyle.mainFont,
              ),
            ),
            TextSpan(
              text: '《用户协议》',
              style: TextStyle(
                color: Colors.white,
                fontSize: px(11, maxScale: 1),
                fontFamily: SfssStyle.mainFont,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget layerLogin() {
    return Transform(
      //向下平移
      transform: Matrix4.translationValues(0, pxh(625) * (offsetUp.value), 0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: pxh(625),
          decoration: const BoxDecoration(
            color: Colors.white,  
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22),
              topRight: Radius.circular(22),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: pxh(25),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: pxh(8.7),
                    height: pxh(18.5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF882F2F),
                      borderRadius: BorderRadius.circular(pxh(1.55)),
                    ),
                  ),
                  const SizedBox(width: 5),
                  SfssWidget.text(
                    '欢迎来到四方食事',
                    fontSize: pxmin(19)
                  ),
                ],
              ),
              SizedBox(height: pxh(20),),
              Container(
                width: px(250),
                height: 0.5,
                decoration: BoxDecoration(
                  color: const Color(0xFFC4C6CB),
                  borderRadius: BorderRadius.circular(pxh(2)),
                ),
              ),
              SizedBox(height: pxh(99),),
              SfssWidget.text(
                '登录',
                fontSize: pxmin(36),
              ),
              SizedBox(height: pxh(43),),
              Container(
                width: px(247, maxScale: 1.2),
                height: pxh(37),
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Colors.white,  
                  borderRadius: BorderRadius.circular(pxh(10)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A000000),
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: CupertinoTextField(
                  placeholder: '请输入手机号',
                  placeholderStyle: TextStyle(
                    color: const Color(0xFFA4AAB3),
                    fontFamily: SfssStyle.mainFont,
                    fontSize: pxmin(14),
                  ),
                  style: TextStyle(
                    color: SfssStyle.mainGrey,
                    fontFamily: SfssStyle.mainFont,
                    fontSize: pxmin(14),
                    letterSpacing: px(0.5)
                  ),
                  padding: EdgeInsets.only(left: px(26, maxScale: 1.2)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(pxh(10))),
                  ),
                ),
              ),
              SizedBox(height: pxh(17),),
              Container(
                width: px(247, maxScale: 1.2),
                height: pxh(37),
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Colors.white,  
                  borderRadius: BorderRadius.circular(pxh(10)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A000000),
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: px(160, maxScale: 1.2),
                      child: CupertinoTextField(
                        placeholder: '请输入验证码',
                        placeholderStyle: TextStyle(
                          color: const Color(0xFFA4AAB3),
                          fontFamily: SfssStyle.mainFont,
                          fontSize: pxmin(14),
                        ),
                        style: TextStyle(
                          color: SfssStyle.mainGrey,
                          fontFamily: SfssStyle.mainFont,
                          fontSize: pxmin(14),
                          letterSpacing: px(0.5)
                        ),
                        padding: EdgeInsets.only(left: px(26, maxScale: 1.2)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(pxh(10))),
                        ),
                      ),
                    ),
                    Container(
                      width: 0.3,
                      height: pxh(11),
                      color: const Color(0xFFA4AAB3),
                    ),
                    Expanded( 
                      child: Center(
                        child: SfssWidget.text(
                          '获取验证码',
                          fontSize: pxmin(14),
                          color: Color(0xFF858A92),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: pxh(17),),
              SizedBox(
                width: px(246, maxScale: 1.2),
                height: pxh(37),
                child: SfssWidget.button(
                  text: '登录',
                  fontSize: pxmin(15),
                  borderRadius: BorderRadius.circular(pxh(10)),
                  onPressed: (){
                    _controller.reverse();
                  },
                ),
              ),
              SizedBox(height: pxh(10),),
              SfssWidget.text(
                '去逛逛',
                fontSize: pxmin(12),
                color: const Color(0xFFA0A2A8)
              ),
              SizedBox(height: pxh(70),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: px(78),
                    height: 0.3,
                    color: const Color(0xFFA4AAB3),
                  ),
                  const SizedBox(width: 9),
                  SfssWidget.text(
                    '其他登录方式',
                    fontSize: pxmin(12),
                    color: const Color(0xFFA0A2A8)
                  ),
                  const SizedBox(width: 9),
                  Container(
                    width: px(78),
                    height: 0.3,
                    color: const Color(0xFFA4AAB3),
                  ),
                ],
              ),
              SizedBox(height: pxh(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: pxh(40),
                    height: pxh(40),
                    child: SvgPicture.asset('assets/images/welcome/wechat.svg'),
                  ),
                  // const SizedBox(width: 20),
                  // Container(
                  //   width: px(40),
                  //   height: px(40),
                  //   decoration: BoxDecoration(
                  //     color: const Color(0xFFE5E5E5),
                  //     borderRadius: BorderRadius.circular(px(20)),
                  //   ),
                  // ),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget layerButtom() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          wxLoginButton(),
          SizedBox(height: pxmin(9)-px(1)),
          mobileLoginButton(),
          SizedBox(height: pxmin(179)-px(10)),
          privacyPolicy(),
          SizedBox(height: pxmin(19)-px(1))
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    Adapt(context: context);
    return CupertinoPageScaffold(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              Opacity(
                opacity: bgOpacity.value,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/welcome/background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: 1-bgOpacity.value,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: pxh(348),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/welcome/backgroundLogin.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              layerTitle(),
              layerButtom(),
              layerLogin(),
            ],
          );
        },
      ),
    );
  }
}