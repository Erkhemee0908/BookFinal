import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants.dart';
class RentScreen extends StatefulWidget {
  final String imageUrl,name,bookUrl;
  RentScreen({required this.name,required this.imageUrl,required this.bookUrl});
  @override
  _RentScreenState createState() => _RentScreenState();
}

class _RentScreenState extends State<RentScreen> {
  String valueDay='1';

  var dropdownvalue;
  var _userId;
  bool loading=false;
  @override
  void initState() {
    super.initState();
    getData();
  }
  getData()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    _userId=sharedPreferences.getString("userId");
  }

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
        ),),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(height: 25,),
            Row(
              children: [
                SizedBox(width: 10,),
                Expanded(flex: 3,child: Image.asset("${widget.imageUrl}")),
                SizedBox(width: 10),
                Expanded(flex:5,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("""A paragraph is a section of text containing one or more sentences, which together express a single idea or unit of information. ... In modern typesetting, a paragraph is usually delimited by a visual separator or paragraph break, A paragraph is a section of text containing one or more sentences, which together express a single idea or unit of information. ... In modern typesetting, a paragraph is usually delimited by a visual separator or paragraph break.      
                                  """,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12,

                    ),),
                ),),


              ],
            ),
            SizedBox(height: 10,),

            Container(margin: EdgeInsets.all(8),
              height: 50,
              width: size.width,
              child:

              DropdownButton<String>(
              value: dropdownvalue,
              hint: Text("Days"),
              isExpanded: true,
              iconSize: 28,
              elevation: 20,

              onChanged: (newval){
                setState((){
                  dropdownvalue = newval;
                });
              },
              items: <int>[1,2,3,4,5,6,7,8,9,10]
                  .map<DropdownMenuItem<String>>((int value){
                return DropdownMenuItem<String>(
                  value: "$value",
                  child: Text("  $value"),
                );
              }).toList(),
            ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(flex:1,child: Text("Price",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: kTBlue,fontSize: 16
                  ),)),
                  Expanded(flex:2,child: SizedBox(width: 4,)),
                  Spacer(),
                  Expanded(flex:1,child:
                  Text(
                    dropdownvalue==null?
                        "200 MNT":
                    "${int.parse(dropdownvalue)*200}MNT",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: kTBlue,fontSize: 16
                    ),)),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Spacer(),
            Container(
              height: 50,
              margin: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(flex:1,child: MaterialButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    color: kBlue,
                    child: Text('Cancel',
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ),
                  )),
                  Expanded(flex:1,child: SizedBox(width: 4,)),
                  Expanded(flex:1,child:  MaterialButton(
                    onPressed: (){
                      setState(() {
                        loading=true;
                      });
                      print("pakistan");
                      FirebaseFirestore.instance.collection("library_collection").
                      doc(_userId).collection("myLibrary").doc().set({
                        "book_name":"${widget.name}",
                        "book_url":"${widget.imageUrl}",
                        "book_price": dropdownvalue==null?
                      "200 MNT":
                      "${int.parse(dropdownvalue)*200}MNT",
                        "book_days":"$dropdownvalue",
                        "user_id":"$_userId",
                        "bookUrl":"${widget.bookUrl}",
                      }).then((value) {
                        Navigator.pop(context);
                        setState(() {
                          loading=false;
                        });
                      });
                    },
                    color: kBlue,
                    child:
                    loading?Container(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(backgroundColor: Colors.white,)):
                    Text('Rent',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),

      ),
    );
  }
}
class Example extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
//  List<String> _locations = ['Please choose a location', 'A', 'B', 'C', 'D']; // Option 1
//  String _selectedLocation = 'Please choose a location'; // Option 1
  List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  String _selectedLocation='d'; // Option 2

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: DropdownButton(
            hint: Text('Please choose a location'), // Not necessary for Option 1
            value: _selectedLocation,
            onChanged: (newValue) {
              setState(() {
                _selectedLocation = newValue.toString();
              });
            },
            items: _locations.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}