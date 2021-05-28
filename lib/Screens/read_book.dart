import 'dart:convert';
import 'dart:io';

import 'package:book_rent_5_3/Constants.dart';
import 'package:book_rent_5_3/Screens/readbook.dart';
import 'package:dio/dio.dart';
import 'package:epub_viewer/epub_viewer.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ReadBook extends StatefulWidget {
 final String imageUrl,name,bookUrl;
  ReadBook({required this.name,required this.imageUrl,required this.bookUrl});
  @override
  _ReadBookState createState() => _ReadBookState();
}

class _ReadBookState extends State<ReadBook> {
  late Response response;
  var dio = Dio();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlue,
        centerTitle: true,
        title:  Text(
          "${widget.name}",
          textAlign: TextAlign.center,
        ),
        // leading: Icon(Icons.settings),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              width: 200,
              height: size.height*0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("${widget.imageUrl}"))
              ),
            ),
            SizedBox(height: 30,),
            MaterialButton(
              onPressed: ()async{
//                 var tempDir = await getTemporaryDirectory();
//                 String fullPath = tempDir.path + "/boo2.pdf'";
//                 response = await dio.download('https://firebasestorage.googleapis.com/v0/b/bookrental106-b5a05.appspot.com/o/books%2FThe%20Magicians.epub?alt=media&token=9a461917-e2e1-4da9-a2b7-6ca8d9bba0bc', fullPath);
// print(response.data);
//                 print(response.headers);
//                 File file = File(fullPath);
//                 var raf = file.openSync(mode: FileMode.write);
//                 // response.data is List<int> type
//                 raf.writeFromSync(response.data);
//                 await raf.close();
                EpubViewer.setConfig(
                  themeColor: Theme.of(context).primaryColor,
                  identifier: "iosBook",
                  scrollDirection: EpubScrollDirection.VERTICAL,
                  allowSharing: true,
                  enableTts: true,
                );
                await EpubViewer.openAsset(
                  '${widget.bookUrl}',
                  lastLocation: EpubLocator.fromJson({
                    "bookId": "2239",
                    "href": "/OEBPS/ch06.xhtml",
                    "created": 1539934158390,
                    "locations": {
                      "cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"
                    }
                  }), // first page will open up if the value is null
                );

// Get locator which you can save in your database
                EpubViewer.locatorStream.listen((locator) {
                  print('LOCATOR: ${EpubLocator.fromJson(jsonDecode(locator))}');
                  // convert locator from string to json and save to your database to be retrieved later
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: size.width*0.9,
                height: size.height*0.08,
                decoration: BoxDecoration(
                    color: kBlue,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text("Tatax",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white70,
                    fontSize: 18
                  ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25,),
            Container(
              alignment: Alignment.center,
              width: size.width*0.7,
              height: 0.8,
              decoration: BoxDecoration(
                  color: Colors.grey,
              ),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("the main body of a book or other piece of writing, as distinct from other material such as notes, appendices, and illustrations.",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color:kBlue,
                    fontSize: 14
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              alignment: Alignment.center,
              width: size.width*0.7,
              height: 0.8,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 36,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("3oxnonu",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color:kBlue,
                        fontSize: 14
                    ),
                  ),
                  Text("Patrick Rothfuss",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color:kBlue,
                        fontSize: 14
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
