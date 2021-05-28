import 'package:book_rent_5_3/Constants.dart';
import 'package:flutter/material.dart';

class ReadBook1 extends StatefulWidget {
  @override
  _ReadBook1State createState() => _ReadBook1State();
}
class _ReadBook1State extends State<ReadBook1> {
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
        leading: Icon(Icons.arrow_back),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context,index){
                    return Container(
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

                          Text("The Wise Man's Fair",
                          style: TextStyle(
                            fontSize: 20,
                            
                          ),),
                          SizedBox(height: 10,),

                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Expanded(flex: 2,child: Image.network("https://d1csarkz8obe9u.cloudfront.net/posterpreviews/contemporary-fiction-night-time-book-cover-design-template-1be47835c3058eb42211574e0c4ed8bf_screen.jpg?ts=1594616847")),
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
                    );
                  }),
            ),
          ],
        ),

      ),
    );
  }
}
