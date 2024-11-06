import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfss/styles/mainStyle.dart';
import 'package:sfss/widgets.dart';



Widget _loginButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: 285,
      height: 47,
      child: SfssWidget.button(
        text: '下一步',
        onPressed: () {
          Navigator.pushNamed(
            context,
            "/home",
          );
        },
        textStyle: TextStyle(
          color: Colors.white,
          fontFamily: SfssStyle.mainFont,
          fontSize: 21
        ),
        padding: const EdgeInsets.all(0),
      ),
    ),
  );
}

Widget _usernameInputBox(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: 285,
      height: 47,
      child: CupertinoTextField(
        placeholderStyle: TextStyle(
          color: const Color(0xFF4A5568),
          fontFamily: SfssStyle.mainFont,
          fontSize: 20,
        ),
        style: TextStyle(
          color: const Color(0xFF4A5568),
          fontFamily: SfssStyle.mainFont,
          fontSize: 20,
        ),
        placeholder: '手机号',
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFF791414), width: 2.3),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}

Widget _title() {
  return Column(
    children: [
      Text(
        '注册',
        style: TextStyle(
          color: const Color(0xFF4A5568),
          fontFamily: SfssStyle.mainFont,
          fontSize: 37,
        ),
      )
    ],
  );
}

Widget _loginTip(BuildContext context){
  return SizedBox(
    width: 285,
    height: 47,
    child: SfssWidget.button(
      text: '已有账号，去登录', 
      onPressed: () {
      Navigator.pushNamed(
        context,
        "/login",
      );},
      padding: const EdgeInsets.all(0),
      color: Colors.transparent,
      textStyle: const TextStyle(
        color: Color(0xFF4A5568),
        fontFamily: "WYFangSong",
        fontSize: 15,
      ),
    )
  );
}

Widget _layerMain(BuildContext context) {
  return Center(
    child: Column(
      children: [
        const Spacer(),
        _title(),
        const SizedBox(height: 110.0),
        _usernameInputBox(),
        _loginButton(context),
        _loginTip(context),
        const Spacer()
      ],
    ),
  );
}

class PageRegister extends StatelessWidget {
  const PageRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: const CupertinoNavigationBar(
      //   middle: Text('登录'),
      // ),
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
      )
    );
  }
}
