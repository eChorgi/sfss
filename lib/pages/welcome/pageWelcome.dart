import 'package:flutter/cupertino.dart';
import 'package:sfss/plugins/adapt.dart';
import 'package:sfss/styles/mainStyle.dart';
import 'package:sfss/widgets.dart';


Widget _loginButton(BuildContext context) {
  return SizedBox(
    width: px(606),
    height: px(118),
    child: SfssWidget.button(
      text: '登录',
      onPressed: () {
        Navigator.pushNamed(
          context,
          "/login",
        );
      },
      padding: const EdgeInsets.all(0),
    ),
  );
}
Widget _registerButton(BuildContext context) {
  return SizedBox(
    width: px(606),
    height: px(118),
    child: SfssWidget.button(
      text: '注册',
      borderColor: const Color(0xFF791414),
      borderWidth: px(6),
      textStyle: TextStyle(
        color: const Color(0xFF791414),
        fontFamily: SfssStyle.mainFont,
        fontSize: px(64)
      ),
      color: const Color(0xFFFFFFFF),
      onPressed: () {
        Navigator.pushNamed(
          context,
          "/register",
        );
      },
      padding: const EdgeInsets.all(0),
    ),
  );
}
Widget _title() {
  return Column(
    children: [
      Text(
        '四方食事',
        style: TextStyle(
          color: SfssStyle.mainGrey,
          fontFamily: SfssStyle.mainFont,
          fontSize: px(90),
        ),
      ),
      SizedBox(height: px(80)),
      Text(
        '四方食事，不过一碗人间烟火',
        style: TextStyle(
          color: SfssStyle.mainGrey,
          fontFamily: SfssStyle.mainFont,
          fontSize: px(36),
        ),
      ),
    ],
  );
}
Widget _layerMain(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 14),
        _title(),
        SizedBox(height: px(609)),
        const Spacer(flex: 4),
        _loginButton(context),
        SizedBox(height: px(45)),
        _registerButton(context),
        const Spacer(flex: 2,),
      ],
    ),
  );
}
class PageWelcome extends StatelessWidget {
  const PageWelcome({super.key});
  @override
  Widget build(BuildContext context) {
    Adapt(context: context);
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          _layerMain(context),
        ],
      ),
    );
  }
}