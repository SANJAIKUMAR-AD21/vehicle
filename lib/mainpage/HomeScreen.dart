import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
    int _selectedIndex = 0;
     static const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
     static const List<Widget> _widgetOptions = <Widget>[
      secondpage(),
      Text(
        'Index 1: Business',
        style: optionStyle,
      ),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
       Text(
         'Index 3: School',
         style: optionStyle,
       ),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            SizedBox(height: 5,),
            Row(
              children: [
                Text(' Full Name',style: TextStyle(fontSize: 14,fontFamily: 'Arimo',fontWeight: FontWeight.bold,color: Colors.black),),
                SizedBox(width: 2,),

              ],
            ),
            SizedBox(height: 2,),
            Row(
              children:[
                Icon(Icons.location_on_outlined,color: Colors.black45,size: 12,),
            Text('Sathyamangalam',style: TextStyle(fontSize: 11,fontFamily: 'Arimo',fontWeight: FontWeight.w100,color: Colors.black38),textAlign: TextAlign.left,)
          ]
            )
          ]
      ),
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        shadowColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color:Colors.black,),
            label: 'Home',
            backgroundColor: Color.fromRGBO(219, 223, 244, 1.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business,color:Colors.black,),
            label: 'Business',
            backgroundColor: Color.fromRGBO(219, 223, 244, 1.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school,color:Colors.black,),
            label: 'School',
            backgroundColor: Color.fromRGBO(219, 223, 244, 1.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school,color:Colors.black,),
            label: 'School',
            backgroundColor: Color.fromRGBO(219, 223, 244, 1.0),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

class secondpage extends StatelessWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('hi'),
    );
  }
}

