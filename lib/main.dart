import 'package:book_rent_5_3/Constants.dart';
import 'package:book_rent_5_3/src/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './Welcome/Onboard.dart';
import 'package:firebase_app_check/firebase_app_check.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(webRecaptchaSiteKey: '6LdbZOUaAAAAACRTVvSIDoqF2RFcZyHWlyPX0dQS');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  static final String title = 'Book Rental';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future getUserInfo() async {
    await getUser();
    setState(() {});
    print(uid);
  }
  @override
  void initState() {
    getUserInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: MyApp.title,
      theme: ThemeData(
        dividerTheme: DividerThemeData(
          color: kTBlue,
          indent: 40,
          endIndent: 40,
          space: 40,
        )
      ),

      home: Onboard()
    );
  }
}