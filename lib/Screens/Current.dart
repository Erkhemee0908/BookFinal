import 'package:book_rent_5_3/Screens/Profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants.dart';
import 'Library.dart';
import 'Store.dart';

class Current extends StatefulWidget {
  final String userId;
  Current({required this.userId});  @override
  _CurrentState createState() => _CurrentState();
}

class _CurrentState extends State<Current> {
  int _selectedIndex = 0;



 String userId='';

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  @override
  void initState() {
    super.initState();
    getData();
  }
  getData()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    userId=sharedPreferences.getString("userId")!;
    print("user idddd  $userId");
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> _options = <Widget>[
      Library(user: widget.userId,),
      Store(),
      Profile()
    ];

    return new Scaffold(

      key: _scaffoldKey,




      body: Center(
        child: _options.elementAt(_selectedIndex),
      ),

      bottomNavigationBar:BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: 'Library',
              backgroundColor: Colors.teal
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Store',
            backgroundColor: Colors.lightBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.lightBlue,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: kBlue,
        unselectedItemColor: kTBlue,
        iconSize: 35,
        onTap: _onItemTap,
        elevation: 5,
        selectedLabelStyle: TextStyle(
          fontSize: 15,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}
