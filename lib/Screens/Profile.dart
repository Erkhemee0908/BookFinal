import 'package:book_rent_5_3/Constants.dart';
import 'package:book_rent_5_3/Welcome/Onboard.dart';
import 'package:book_rent_5_3/src/authentication.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPaleBlue,
      appBar: AppBar(
          backgroundColor: kBlue,
          elevation: 0,
          title: Text(
            "Хувийн мэдээлэл",
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.settings), onPressed: ()async{
            await signOutGoogle().then((result){
              print(result);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>Onboard())
              );
            });
          }),
      ),
      body:
          Container(
            height: size.height*0.3,
            decoration: BoxDecoration(
              color: kBlue,
            ),
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: Center(
          child:CircleAvatar(
              backgroundImage: NetworkImage(imageUrl!),
              radius: 60,
          ),
        ),
            ),
            Spacer(),
            Flexible(
              flex: 3,
              child: Center(
                child: Text(
                  name!,
                  style: TextStyle(
                    color: kPaleBlue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    }

}