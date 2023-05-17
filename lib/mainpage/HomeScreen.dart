import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vehicle/maps/NearbyPlaces.dart';
import 'package:vehicle/maps/simplemap.dart';
import 'package:vehicle/userdetails/LoginPage.dart';

import '../maps/CurrentLocation.dart';
import '../models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final user = FirebaseAuth.instance.currentUser!;
  final GlobalKey<ScaffoldState> _key=GlobalKey();
  static const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
     static const List<Widget> _widgetOptions = <Widget>[
      Home(),
       SimpleMapScreen(),
      NearByPlacesScreen(),
       CurrentLocationScreen(),
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
          (user.photoURL?.isNotEmpty==true)?InkWell(
            child:CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            onTap: (){
              _key.currentState?.openEndDrawer();
            },
          ):InkWell(
              child:CircleAvatar(
            radius: 20,
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
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      child:BottomNavigationBar(
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
      )
    );
  }
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final searchcontroller= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final searchField = Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(219, 223, 244, 1.0),
        child:TextFormField(
          autofocus: false,
          controller: searchcontroller,
          style: TextStyle(fontFamily: 'Arimo'),
          keyboardType: TextInputType.text,
          validator: (value){
            if(value!.isEmpty){
              return("First name cannot be empty");
            }

            return null;
          },
          onSaved: (value)
          {
            searchcontroller.text=value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              prefixIcon:Icon(Icons.search,color: Color.fromRGBO(
                  0, 0, 0, 1.0),),
              contentPadding: EdgeInsets.fromLTRB(10,10,10,10),
              hintText: "Search",
              hintStyle: TextStyle(fontFamily: 'Arimo'),
              border: InputBorder.none

          ),
        )
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child:Center(
        child:Padding(
        padding: EdgeInsets.all(15),
        child:Column(
            children:[
              searchField,
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children:[
              Text("Services",style: TextStyle(fontSize: 20,fontFamily: 'Arimo',color:Color.fromRGBO(
                  0, 0, 0, 1.0),fontWeight: FontWeight.bold ),textAlign: TextAlign.center,),
      Text('')
    ]
              ),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
              child:Row(
                children: [
                  Material(
                      elevation: 1,
                      color:Color.fromRGBO(219, 223, 244, 1.0) ,
                      borderRadius: BorderRadius.circular(20),
                    child:MaterialButton(
                      onPressed: () {  },
                      height: 130,
                      minWidth: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                        Image.asset('assets/vehicleinfo.png',
                        height: 70,
                        width: 70,
                      ),
                          Column(
                            children: [
                              Text('My',style: TextStyle(fontFamily: 'Arimo',fontWeight: FontWeight.w900),textAlign: TextAlign.center,),
                              Text('vehicle',style: TextStyle(fontFamily: 'Arimo',fontWeight: FontWeight.w900),textAlign: TextAlign.center)
                            ],
                          )
                      ]
                      )
                    )
                  ),
                  SizedBox(width: 8,),
                  Material(
                      elevation: 1,
                      color:Color.fromRGBO(219, 223, 244, 1.0) ,
                      borderRadius: BorderRadius.circular(20),
                      child:MaterialButton(
                          onPressed: () {  },
                          height: 130,
                          minWidth: 100,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Image.asset('assets/docs.png',
                                  height: 80,
                                  width: 70,
                                ),

                                    Text('Docs',style: TextStyle(fontFamily: 'Arimo',fontWeight: FontWeight.w900),textAlign: TextAlign.center,),

                              ]
                          )
                      )
                  ),
                  SizedBox(width: 8,),
                  Material(
                      elevation: 1,
                      color:Color.fromRGBO(219, 223, 244, 1.0) ,
                      borderRadius: BorderRadius.circular(20),
                      child:MaterialButton(
                          onPressed: () {  },
                          height: 130,
                          minWidth: 100,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Image.asset('assets/mech.png',
                                  height: 70,
                                  width: 70,
                                ),
                                Column(
                                  children: [
                                    Text('Mech',style: TextStyle(fontFamily: 'Arimo',fontWeight: FontWeight.w900),textAlign: TextAlign.center,),
                                    Text('Services',style: TextStyle(fontFamily: 'Arimo',fontWeight: FontWeight.w900),textAlign: TextAlign.center)
                                  ],
                                )
                              ]
                          )
                      )
                  ),
                  SizedBox(width: 8,),
                  Material(
                      elevation: 1,
                      color:Color.fromRGBO(219, 223, 244, 1.0) ,
                      borderRadius: BorderRadius.circular(20),
                      child:MaterialButton(
                          onPressed: () {  },
                          height: 130,
                          minWidth: 100,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Image.asset('assets/payments.png',
                                  height: 80,
                                  width: 70,
                                ),
                                    Text('Payments',style: TextStyle(fontFamily: 'Arimo',fontWeight: FontWeight.w900),textAlign: TextAlign.center)

                              ]
                          )
                      )
                  ),
                  SizedBox(width: 8,),
                  Material(
                      elevation: 1,
                      color:Color.fromRGBO(219, 223, 244, 1.0) ,
                      borderRadius: BorderRadius.circular(20),
                      child:MaterialButton(
                          onPressed: () {  },
                          height: 130,
                          minWidth: 100,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Image.asset('assets/map.png',
                                  height: 80,
                                  width: 70,
                                ),

                                    Text('Map',style: TextStyle(fontFamily: 'Arimo',fontWeight: FontWeight.w900),textAlign: TextAlign.center,),

                              ]
                          )
                      )
                  ),
                  SizedBox(width: 8,),
                  Material(
                      elevation: 1,
                      color:Color.fromRGBO(219, 223, 244, 1.0) ,
                      borderRadius: BorderRadius.circular(20),
                      child:MaterialButton(
                          onPressed: () {  },
                          height: 130,
                          minWidth: 100,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Image.asset('assets/sos.png',
                                  height: 80,
                                  width: 70,
                                ),

                                    Text('Emergency',style: TextStyle(fontFamily: 'Arimo',fontWeight: FontWeight.w900),textAlign: TextAlign.center)

                              ]
                          )
                      )
                  ),
                  SizedBox(width: 8,),
                  Material(
                    elevation: 1,
                      color:Color.fromRGBO(219, 223, 244, 1.0) ,
                      borderRadius: BorderRadius.circular(20),
                      child:MaterialButton(
                          onPressed: () {  },
                          height: 130,
                          minWidth: 100,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Image.asset('assets/onroadassist.png',
                                  height: 70,
                                  width: 70,
                                ),
                                Column(
                                  children: [
                                    Text('On-road',style: TextStyle(fontFamily: 'Arimo',fontWeight: FontWeight.w900),textAlign: TextAlign.center,),
                                    Text('Assist',style: TextStyle(fontFamily: 'Arimo',fontWeight: FontWeight.w900),textAlign: TextAlign.center)
                                  ],
                                )
                              ]
                          )
                      )
                  ),
                ],
              ),
              ),
              SizedBox(height: 8,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Text("Our 24/7 Friend",style: TextStyle(fontSize: 20,fontFamily: 'Arimo',color:Color.fromRGBO(
                        0, 0, 0, 1.0),fontWeight: FontWeight.bold ),textAlign: TextAlign.center,),
                    Text('')
                  ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Image.asset('assets/chat.png',
                      height: 195,
                    width: 195,),

                  Column(
                    children: [
                      Text("Hi! I'm Vechy",style: TextStyle(fontSize: 20,fontFamily: 'Arimo',color:Color.fromRGBO(
                          203, 90, 69, 1.0),fontWeight: FontWeight.bold ),textAlign: TextAlign.center,),
                      Text("Your AI Friend",style: TextStyle(fontSize: 20,fontFamily: 'Arimo',color:Color.fromRGBO(
                          203, 90, 69, 1.0),fontWeight: FontWeight.bold ),textAlign: TextAlign.center,),
          SizedBox(height: 10,),
          Material(
            elevation: 2.0,
            borderRadius: BorderRadius.circular(20),
            color: Color.fromRGBO(249, 177, 122, 1.0),
            child: MaterialButton(
              padding: EdgeInsets.fromLTRB(10,5,10,5),
              splashColor: Colors.black.withOpacity(0.2),
              onPressed:(){


                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

              } ,
              child: Text("Start a chat!",textAlign: TextAlign.center,
                style:TextStyle(fontSize: 15,fontFamily:'Arimo',color: Colors.black,fontWeight: FontWeight.bold) ,
              ),
            ),

          )
                    ],
                  )
                ],
              ),
            ]
        )
    )
      )
      )
    );
  }
}

class chatbot extends StatefulWidget {
  const chatbot({Key? key}) : super(key: key);

  @override
  State<chatbot> createState() => _chatbotState();
}

class _chatbotState extends State<chatbot> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



