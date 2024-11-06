import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfss/plugins/adapt.dart';
import 'package:sfss/styles/mainStyle.dart';
import 'package:sfss/widgets.dart';

class PageWelcome extends StatefulWidget {
  const PageWelcome({super.key});
  @override
  _PageWelcomeState createState() => _PageWelcomeState();
}

class _PageWelcomeState extends State<PageWelcome> {
  
  Widget title() {
    return Column(
      children: [
        Text(
          '四方食事',
          style: TextStyle(
            color: Colors.white,
            fontFamily: SfssStyle.mainFont,
            fontSize: px(36, maxScale: 2.0),
          ),
        ),
        SizedBox(height: pxh(28)),
        Text(
          '不过一碗人间烟火',
          style: TextStyle(
            color: Colors.white,
            fontFamily: SfssStyle.mainFont,
            fontSize: px(14, maxScale: 2.0),
            letterSpacing: px(9, maxScale: 2.0)
          ),
        ),
      ],
    );
  }
  
  Widget wxLoginButton() {
    return Center(
      child: SizedBox(
        width: px(269, maxScale: 1.5),
        height: px(51, maxScale: 1.5),
        child: SfssWidget.button(
          text: "微信登陆",
          fontSize: px(20, maxScale: 1.5),
          onPressed: (){
          Navigator.pushNamed(context, '/login');
        }),
      ),
    );
  }
  Widget mobileLoginButton() {
    return Center(
      child: SizedBox(
        width: px(114, maxScale: 1.5),
        height: px(19, maxScale: 1.5),
        child: SfssWidget.button(
          color: Colors.transparent,
          text: "手机号注册 / 登陆",
          fontSize: px(14, maxScale: 1.5),
          onPressed: (){
          Navigator.pushNamed(context, '/login');
        }),
      ),
    );
  }
  Widget layerTitle() {
    return Center(
      child: Column(
        children: [
          SizedBox(height: pxh(274)),
          title(),
        ],
      ),
    );
  }

  Widget privacyPolicy() {
    return RichText(
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
    );
  }
  Widget layerButtom() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          wxLoginButton(),
          SizedBox(height: pxh(9)),
          mobileLoginButton(),
          SizedBox(height: pxh(179)),
          privacyPolicy(),
          SizedBox(height: pxh(19))
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    Adapt(context: context);
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/welcome/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          layerTitle(),
          layerButtom()
        ],
      ),
    );
  }
}