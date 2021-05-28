// import 'package:book_rent_5_3/Screens/read_book.dart';
// import 'package:book_rent_5_3/Widgets/PopUp.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../Constants.dart';
//
// class Store extends StatefulWidget {
//   @override
//   _StoreState createState() => _StoreState();
// }
//
// class _StoreState extends State<Store> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:AppBar(
//         backgroundColor: kBlue,
//         elevation: 0,
//         title: InkWell(
//           onTap: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>ReadBook()));
//           },
//           child: Text(
//             "Дэлгүүр",
//             textAlign: TextAlign.center,
//           ),
//         ),
//         centerTitle: true,
//         leading: Text(" "),
//       ),
//       body: Container(
//           child:
//           StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance.collection("books").snapshots(),
//             builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if(!snapshot.hasData) {
//                 Text("There is no book");
//               }
//               if(snapshot.hasData){
//                 return new ListView(children: getExpenseItems(snapshot));
//               }else {
//                 return Center(
//                   child: Text("Loading..."),
//                 );
//               }
//             },
//           )
//       ),
//     );
//   }
//   getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
//     var size = MediaQuery.of(context).size;
//     return snapshot.data!.docs
//         .map((doc) {
//       return ListTile(
//         onTap: (){
//           Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => PopUp(
//                 bookName: doc['name'],
//                 bookDesc: doc['desc'],
//                 bookImg: doc['img'],
//                 bookLink: doc['link'],
//                 bookAuth: doc['author'],
//               )));
//         },
//         subtitle:
//           Container(
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
//           )
//       );
//     })
//         .toList();
//   }
// }



import 'package:book_rent_5_3/Screens/rent_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../Constants.dart';
class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
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
        child: Column(
          children: [
            SizedBox(height: 10,),
            Expanded(child:
            StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: imagesList.length,
              itemBuilder: (BuildContext context, int index) => Card(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>
                        RentScreen(
                      name: nmaeList[index],
                      imageUrl: imagesList[index],
                          bookUrl: bookList[index],
                    )));
                  },
                  child: new Container(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("${imagesList[index]}"), fit: BoxFit.fill
                                )
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text("${nmaeList[index]}",
                            style: TextStyle(
                              fontSize: 16,
                              color: kBlue,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text("${nmaeList[index]}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ),
              staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 2.5 : 2),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            )),
            SizedBox(height: 10,),

          ],
        ),

      ),
    );
  }
}
