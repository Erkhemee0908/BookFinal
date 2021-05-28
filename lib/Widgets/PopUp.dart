import 'dart:io';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_core/firebase_core.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class PopUp extends StatefulWidget {
  final bookName;
  final bookAuth;
  final bookDesc;
  final bookImg;
  final bookLink;

  PopUp(
      {this.bookName,
      this.bookDesc,
      this.bookImg,
      this.bookLink,
      this.bookAuth});

  @override
  _PopUpState createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlue,
        elevation: 0,
        title: Text(
          widget.bookName,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Image.network(
                widget.bookImg,
                height: 300,
              ),
            ),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: kBlue,
                    primary: kPaleBlue,
                    padding:
                    EdgeInsets.symmetric(horizontal: 100, vertical: 20)),
                child: Text(
                  "Татах",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {

                    downloadFile(context);

                },),
            Divider(),
            Container(
              child: ReadMoreText(
                widget.bookDesc,
                style: TextStyle(color: kBlue),
                trimLines: 2,
                colorClickableText: kBlue,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Илүү',
                trimExpandedText: 'Хаах',
                moreStyle: TextStyle(fontWeight: FontWeight.bold, color: kBlue),
                lessStyle: TextStyle(fontWeight: FontWeight.bold, color: kBlue),
              ),
            ),
            Divider(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Зохиолч:",
                    style: TextStyle(
                      color: kBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.bookAuth,
                    style: TextStyle(
                      color: kBlue,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 0,
              color: kPaleBlue,
            ),
          ],
        ),
      ),
    );
  }

  Future downloadFile(BuildContext context) async {
    PermissionStatus permission = await Permission.storage.status;
    await Firebase.initializeApp();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool authSignedIn = prefs.getBool('auth') ?? false;

    final User? user = _auth.currentUser;


    if (permission != PermissionStatus.granted && authSignedIn == true && user != null) {
      await Permission.storage
          .request()
          .isGranted;
      startDownload(context);
    } else {
      startDownload(context);
    }
  }

  Future<void> startDownload(BuildContext context) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    var downloadToFile = new File('${appDocDir.path}/${widget.bookName}.epub');

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('assets/books/${widget.bookLink}')
          .writeToFile(downloadToFile);
    } on firebase_storage.FirebaseException catch (e) {

      if (e.code == 'permission-denied') {
        print('User does not have permission to upload to this reference.');
      }
    }
  }
}