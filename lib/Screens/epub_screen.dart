import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:epub_viewer/epub_viewer.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


class MyApp1 extends StatefulWidget {
  @override
  _MyApp1State createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  bool loading = false;
  Dio dio = new Dio();

  @override
  void initState() {
    super.initState();
   download();
  }

  download() async {
    if (Platform.isAndroid) {
      print('download');
      await downloadFile(img: "https://firebasestorage.googleapis.com/v0/b/bookrental106-b5a05.appspot.com/o/books%2FThe%20Magicians.epub?alt=media&token=9a461917-e2e1-4da9-a2b7-6ca8d9bba0bc");
    } else {
      // await downloadFile(img: "");

      loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: loading
              ? CircularProgressIndicator()
              : FlatButton(
            onPressed: () async {
              // Directory appDocDir =
              // await getApplicationDocumentsDirectory();
              // print('$appDocDir');
              //
              // String iosBookPath = '${appDocDir.path}.epub';
              // print(iosBookPath);
              // String androidBookPath = 'file:///android_asset/3.epub';
              // EpubViewer.setConfig(
              //     themeColor: Theme.of(context).primaryColor,
              //     identifier: "iosBook",
              //     scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
              //     allowSharing: true,
              //     enableTts: true,
              //     nightMode: true);
              //      EpubViewer.open(
              //        Platform.isAndroid ? "https://firebasestorage.googleapis.com/v0/b/bookrental106-b5a05.appspot.com/o/books%2FThe%20Magicians.epub?alt=media&token=9a461917-e2e1-4da9-a2b7-6ca8d9bba0bc" : iosBookPath,
              //        lastLocation: EpubLocator.fromJson({
              //          "bookId": "2239",
              //          "href": "/OEBPS/ch06.xhtml",
              //          "created": 1539934158390,
              //          "locations": {
              //            "cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"
              //          }
              //        }),
              //      );
              //
              // // await EpubViewer.openAsset(
              // //   'assets/magicians.epub',
              // //   lastLocation: EpubLocator.fromJson({
              // //     "bookId": "2239",
              // //     "href": "/OEBPS/ch06.xhtml",
              // //     "created": 1539934158390,
              // //     "locations": {
              // //       "cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"
              // //     }
              // //   }),
              // // );
              // // get current locator
              // EpubViewer.locatorStream.listen((locator) {
              //   print(
              //       'LOCATOR: ${EpubLocator.fromJson(jsonDecode(locator))}');
              // });
            },
            child: Container(
              child: Text('open epub'),
            ),
          ),
        ),
      ),
    );
  }

  Future downloadFile({required String img}) async {
    print('download1');

    if (await Permission.storage.isGranted) {
      await Permission.storage.request();
      await startDownload(imgUrl: img);
    } else {
      await startDownload(imgUrl: img);
    }
  }

  startDownload({required String imgUrl}) async {
    Directory? appDocDir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();

    String path = appDocDir!.path + '.epub';
    File file = File(path);
//    await file.delete();

    if (!File(path).existsSync()) {
      await file.create();
      await dio.download(
        '$imgUrl',
        path,
        deleteOnError: true,
        onReceiveProgress: (receivedBytes, totalBytes) {
          print((receivedBytes / totalBytes * 100).toStringAsFixed(0));
          if (receivedBytes == totalBytes) {
            loading = false;
            setState(() {});
          }
        },
      ).then((value)
      {
        print(value.data.toString());
      });
    } else {
      loading = false;
      setState((){});
    }
  }
}