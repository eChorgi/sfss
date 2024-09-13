import 'package:flutter/cupertino.dart';
import 'package:sfss/widgets.dart';
// import 'package:card_swiper/card_swiper.dart';


// Widget _displayArea() {
//   return SizedBox(
//     height: 288,
//     child: Swiper(
//       itemBuilder: (BuildContext context, int index) {
//         return Image.asset(
//           "assets/images/season/$index.png",
//           fit: BoxFit.fitHeight,
//         );
//       },
      
//       itemCount: 3,
//       viewportFraction: 0.8,
//       scale: 0.9,
//       autoplay: true,
//     )
//   );
// }

Widget _loginButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(9.0),
    child: SizedBox(
      width: 245,
      height: 47,
      child: Sfss.button(
        text: '登录',
        onPressed: () {
          Navigator.pushNamed(
            context,
            "/login",
          );
        },
        padding: const EdgeInsets.all(0),
      ),
    ),
  );
}
Widget _registerButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(9.0),
    child: SizedBox(
      width: 245,
      height: 47,
      child: Sfss.button(
        text: '注册',
        borderColor: const Color(0xFF791414),
        borderWidth: 2.3,
        textStyle: const TextStyle(
          color: Color(0xFF791414),
          fontFamily: "WYMingChao",
          fontSize: 25
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
    ),
  );
}
Widget _title() {
  return const Column(
    children: [
      Text(
        '四方食事',
        style: TextStyle(
          color: Color(0xFF4A5568),
          fontFamily: "WYMingChao",
          fontSize: 37,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top:36.0),
        child: Text(
          '四方食事，不过一碗人间烟火',
          style: TextStyle(
            color: Color(0xFF4A5568),
            fontFamily: "WYFangSong",
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
        ),
      ),
    ],
  );
}
Widget _layerMain(BuildContext context) {
  return Center(
    child: Column(
      children: [
        // displayArea(),
        const SizedBox(height: 330.0),
        const Spacer(),
        _title(),
        const SizedBox(height: 240.0),
        _loginButton(context),
        _registerButton(context),
        const Spacer(),
      ],
    ),
  );
}
class PageWelcome extends StatelessWidget {
  const PageWelcome({super.key});
  @override
  Widget build(BuildContext context) {
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