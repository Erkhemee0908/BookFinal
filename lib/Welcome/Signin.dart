import 'package:book_rent_5_3/Widgets/Signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Constants.dart';

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPaleBlue,
      appBar: AppBar(
          backgroundColor: kBlue,
          elevation: 0,
          title: Text(
            "Нэвтрэх",
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Text(
                "Эргэн тавтай морил!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height*0.025,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                width: size.width*0.95,
                child: Text(
                  '\"Чин үнэн сэтгэлээсээ хүсч, ухаангүй сонирхон уншаад хязгааргүй их баярлах шиг сайхан юм хаа байх вэ. Гэвч хамгийн чухал нь яах гэж гэдэгт оршино. Хамгийн эрхэм нь зорилго. Зорилгогүй уншина гэдэг бол булаг шанд, шалбааг балчигийг ялгахгүй амсахаар юуны өөр гэж.\"',
                  style: TextStyle(
                    color: kTBlue,

                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                "Төрийн соёрхолт зохиолч, Дарма Батбаяр",
                style: TextStyle(
                  color: kTBlue,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(
              flex: 7,
              child: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  return SigninButton();
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildLoading() => Stack(
    fit: StackFit.expand,
    children: [
      Center(child: CircularProgressIndicator()),
    ],
  );
}
