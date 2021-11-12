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
