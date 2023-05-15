import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vehicle/userdetails/LoginPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
    int _selectedIndex = 0;
  final user = FirebaseAuth.instance.currentUser!;
  final GlobalKey<ScaffoldState> _key=GlobalKey();
  static const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
     static const List<Widget> _widgetOptions = <Widget>[
      home(),
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
      endDrawer: ClipRRect(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(75),),
        child:Drawer(
          width: 250,
        child: Padding(
        padding: EdgeInsets.all(20),
        child:Column(
          children: [
            SizedBox(height: 100,),
            Text('PROFILE',style: TextStyle(fontSize:18,fontFamily: 'Arimo', color: Color.fromRGBO(0,45, 50, 0.50),fontWeight: FontWeight.bold),),
            Divider(color: Colors.black12,indent: 10,endIndent: 10),
            Text('LANGUAGE',style: TextStyle(fontSize:18,fontFamily: 'Arimo',color: Color.fromRGBO(0,45, 50, 0.50),fontWeight: FontWeight.bold),),
            Divider(color: Colors.black12,indent: 10,endIndent: 10),
            Text('ABOUT US',style: TextStyle(fontSize:18,fontFamily: 'Arimo',color: Color.fromRGBO(0,45, 50, 0.50),fontWeight: FontWeight.bold),),
            Divider(color: Colors.black12,indent: 10,endIndent: 10),
            Text('RATE US',style: TextStyle(fontSize:18,fontFamily: 'Arimo',color: Color.fromRGBO(0,45, 50, 0.50),fontWeight: FontWeight.bold),),
            Divider(color: Colors.black12,indent: 10,endIndent: 10),
            Text('USER GUIDE',style: TextStyle(fontSize:18,fontFamily: 'Arimo',color: Color.fromRGBO(0,45, 50, 0.50),fontWeight: FontWeight.bold),),
            Divider(color: Colors.black12,indent: 10,endIndent: 10),
            InkWell(child:
            Text('LOG OUT',style: TextStyle(fontSize:18,fontFamily: 'Arimo',color: Colors.red,fontWeight: FontWeight.bold),),
              onTap: () async {
                await GoogleSignIn().signOut();
                FirebaseAuth.instance.signOut();
              },
            )
          ],
        ),
      ),
        )
      ),
      appBar: AppBar(
        actions:<Widget> [Container()],
        title:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            SizedBox(height: 5,),
            Row(
              children: [
                Text('${user.displayName}',style: TextStyle(fontSize: 14,fontFamily: 'Arimo',fontWeight: FontWeight.bold,color: Colors.black),),
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
          InkWell(
              child:CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(user.photoURL!),
          ),
            onTap: (){
                _key.currentState?.openEndDrawer();
            },
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
      key: _key,
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
            icon: Icon(Icons.chat_outlined,color:Colors.black,),
            label: 'ChatBot',
            backgroundColor: Color.fromRGBO(219, 223, 244, 1.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined,color:Colors.black,),
            label: 'Sevices',
            backgroundColor: Color.fromRGBO(219, 223, 244, 1.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu,color:Colors.black,),
            label: 'More',
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

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Container(
      child: Column(
        children:[

        SizedBox(height: 8,),
        Text('Name'+user.displayName!),
        SizedBox(height: 8,),
        Text('Email:'+user.email!),

        IconButton(
        onPressed: () async{
          await GoogleSignIn().signOut();
          FirebaseAuth.instance.signOut();
        },
        icon: Icon(Icons.power_settings_new),
      ),
    ]
      )
    );
  }
}


