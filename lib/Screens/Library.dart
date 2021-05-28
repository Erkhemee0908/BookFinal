// import 'package:book_rent_5_3/Constants.dart';
// import 'package:book_rent_5_3/Widgets/PopUp.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/rendering.dart';
//
//
// class Library extends StatefulWidget {
//   @override
//   _LibraryState createState() => _LibraryState();
// }
//
// class _LibraryState extends State<Library> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kBlue,
//         elevation: 0,
//         title: Text(
//           "Номын сан",
//           textAlign: TextAlign.center,
//         ),
//         centerTitle: true,
//         leading: Text(" "),
//       ),
//       body: Container(
//           child: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection("books").snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             Text("There is no book");
//           }
//           if (snapshot.hasData) {
//             return new ListView(children: getExpenseItems(snapshot));
//           } else {
//             return Center(
//               child: Text("Loading..."),
//             );
//           }
//         },
//       )),
//     );
//   }
//
//   getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
//     var size = MediaQuery.of(context).size;
//     return snapshot.data!.docs.map((doc) {
//       return ListTile(
//           onTap: () {
//             Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => PopUp(
//                       bookName: doc['name'],
//                       bookDesc: doc['desc'],
//                       bookImg: doc['img'],
//                       bookLink: doc['link'],
//                       bookAuth: doc['author'],
//                     )));
//           },
//           subtitle: Container(
//             decoration: BoxDecoration(border: Border.all(color: kBlue)),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Image.network(
//                     doc['img'],
//                     height: size.height*0.22,
//                   ),
//                 ),
//                 Container(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: size.width*0.55,
//                         child: new Text(
//                           doc['name'],
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                       Container(
//                           width: size.width*0.63 ,
//                           height: 190,
//                           child: new Text(
//                             doc['desc'],
//                             overflow: TextOverflow.fade,
//                             textAlign: TextAlign.justify,
//                           ))
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ));
//     }).toList();
//   }
// }












import 'package:book_rent_5_3/Constants.dart';
import 'package:book_rent_5_3/Screens/epub_screen.dart';
import 'package:book_rent_5_3/Screens/read_book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  final String user;
  Library({required this.user});

  @override
  _LibraryState createState() => _LibraryState();
}
class _LibraryState extends State<Library> {
  List<String> imagesList=[
    "assets/images/hp1.jpg",
    "assets/images/dragonmage.jpg",
    "assets/images/12morerules.jpg",
    "assets/images/meditations.jpg",
    "assets/images/thenameofthewind.jpg",
    "assets/images/ooathbringer.jpg",
    "assets/images/themagicians.jpg",
    "assets/images/thewayofkings.jpg",
    "assets/images/thewisemanfear.jpg"
  ];
  List<String> bookList=[
    "assets/books/hp.epub",
    "assets/books/hp.epub",
    "assets/books/hp.epub",
    "assets/books/hp.epub",
    "assets/books/hp.epub",
    "assets/books/hp.epub",
    "assets/books/hp.epub",
    "assets/books/hp.epub"
  ];
  List<String> nmaeList=[
    "Harry Potter",
    "Dragon Mage",
    "12 More Rules",
    "Meditaion",
    "Name Of The Wind",
    "Oath Bringer",
    "The Megicians",
    "The Way Of King",
    "Wise Man Fear"
  ];
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlue,
        centerTitle: true,
        title:  Text(
          "The Wise Man's Fair",
          textAlign: TextAlign.center,
        ),
        leading: Text(""),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child:StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("library_collection").

          doc(widget.user)
          .collection("myLibrary").where("book_days" ,isNotEqualTo: "0")
          .snapshots(),
          builder: (context,snapshot){

            if(snapshot.connectionState==ConnectionState.waiting && !snapshot.hasData){
              return Center(child: CircularProgressIndicator(),);
            }
            print(snapshot.data!.docs.length);
            return  ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp1()));
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          ReadBook(
                            name: snapshot.data!.docs[index]['book_name'],
                            imageUrl: snapshot.data!.docs[index]['book_url'],
                            bookUrl: snapshot.data!.docs[index]['bookUrl'],
                          )));
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: size.width*0.9,
                      height: size.height*0.3,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: kBlue
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10,),

                          Text("${snapshot.data!.docs[index]['book_name']}",
                            style: TextStyle(
                              fontSize: 20,

                            ),),
                          SizedBox(height: 10,),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Expanded(flex: 2,child: Image.asset("${snapshot.data!.docs[index]['book_url']}")),
                              SizedBox(width: 10,),
                              Expanded(flex:5,child: Text("""A paragraph is a section of text containing one or more sentences, which together express a single idea or unit of information. ... In modern typesetting, a paragraph is usually delimited by a visual separator or paragraph break, A paragraph is a section of text containing one or more sentences, which together express a single idea or unit of information. ... In modern typesetting, a paragraph is usually delimited by a visual separator or paragraph break.
                              
                              
                              """,
                                style: TextStyle(
                                  fontSize: 12,

                                ),),),


                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
        ),

      ),
    );
  }
}
