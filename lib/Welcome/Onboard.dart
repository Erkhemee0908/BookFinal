import 'package:book_rent_5_3/Widgets/Signup_button.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';
import './Signin.dart';

class Onboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kPaleBlue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Spacer(),
            Flexible(
              child: Center(
                child: Icon(
                  Icons.account_circle_sharp,
                  size: size.width * 0.15,
                  color: kBlue,
                ),
              ),
            ),
            Spacer(),
            Flexible(
              child: Text(
                "Тавтай морил",
                style: TextStyle(
                  color: kDarkBlue,
                  fontSize: 20.0,
                ),
              ),
            ),
            Flexible(
              child: Text(
                "Уншиж эхлэх",
                style: TextStyle(
                  color: kTBlue,
                  fontSize: 17.0,
                ),
              ),
            ),
            Flexible(
              flex: 6,
              child: SignupButton()

              ),
            Flexible(
              flex: 1,
              child: TextButton(
                onPressed: () async {
                  var navagationResult = await Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => Signin()));                },
                child: Text(
                  "Нэвтрэх",
                  style: TextStyle(
                    color: kTBlue,
                  ),
                ),
              ),
            ),
          ],
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

