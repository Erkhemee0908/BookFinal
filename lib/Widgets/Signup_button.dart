import 'package:book_rent_5_3/Screens/Current.dart';
import 'package:book_rent_5_3/src/authentication.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants.dart';

class SignupButton extends StatefulWidget {
  @override
  _SignupButtonState createState() => _SignupButtonState();
}

class _SignupButtonState extends State<SignupButton> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      color: kPaleBlue,
      borderRadius: BorderRadius.circular(size.height * 0.05),
      child: Column(children: <Widget>[
        SizedBox(
          height: size.height * 0.2,
        ),
        TextButton(
            onPressed: () async {
              SharedPreferences sharePerefences=await SharedPreferences.getInstance();

              await signInWithGoogle().then((result) {
                print(result);
                if (result != null) {
                  sharePerefences.setString("userId", result.uid);
                  String uid=sharePerefences.getString("userId")!;
                  print("Data : $uid");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Current(
                      userId: uid,
                    )),
                  );
                }
              }).catchError((error) {
                print('Registration Error: $error');
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              width: size.width * 0.8,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                  color: kBlue,
                  borderRadius:
                  BorderRadius.circular(size.height * 0.05)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                      size: size.height * 0.035,
                    ),
                    Text(
                      "Google-р Бүртгүүлэх",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: size.height * 0.04,
                    )
                  ]
              ),
            )
        ),
      ]),
    );
  }
}
