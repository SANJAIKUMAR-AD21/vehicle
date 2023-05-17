import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:vehicle/mainpage/HomeScreen.dart';
import 'package:vehicle/userdetails/SignUp.dart';
import 'package:vehicle/userdetails/passwordreset/PasswordReset.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey= GlobalKey<FormState>();
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();
  bool _isHidden=true;
  @override
  Widget build(BuildContext context) {

    final emailField = Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(219, 223, 244, 1.0),
        child:TextFormField(
      autofocus: false,
      controller: emailcontroller,
      style: TextStyle(fontFamily: 'Arimo'),
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value!.isEmpty){
          return("Please Enter your email");
        }
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[bitsathy]+.[a-z]").hasMatch(value)){
          return("Please enter a valid email!");
        }
        return null;
      },
      onSaved: (value)
      {
        emailcontroller.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon:Icon(Icons.person_outline,color: Color.fromRGBO(0, 0, 0, 1.0),),
          contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
          hintText: "Username",
          hintStyle: TextStyle(fontFamily: 'Arimo'),
          border:  InputBorder.none,

      ),
    )
    );
    final passwordField = Material(
      elevation: 2,
        borderRadius: BorderRadius.circular(20),
      color: Color.fromRGBO(219, 223, 244, 1.0),
      child:TextFormField(
      autofocus: false,
      controller: passwordcontroller,

      style: TextStyle(fontFamily: 'Arimo'),
      obscureText: _isHidden,
      validator: (value){
        RegExp regex=new RegExp(r'^.{6,}$');
        if(value!.isEmpty){
          return("Password required");
        }
        if(!regex.hasMatch(value)){
          return("Please enter valid password(Min. 6 character");
        }
      },
      onSaved: (value)
      {
        passwordcontroller.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline_rounded,color: Color.fromRGBO(
              0, 0, 0, 1.0),),
          contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
          hintText: "Password",
          hintStyle: TextStyle(fontFamily: 'Arimo'),
          suffixIcon: InkWell(
            onTap: _toggleview,
            child: Icon(
              _isHidden
                  ?Icons.visibility_off_outlined
                  :Icons.visibility_outlined,
              color: Color.fromRGBO(0, 0, 0, 1.0),
            ),
          ),
          border: InputBorder.none,

      ),
      )
    );
    final loginButton = Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(25),
      color: Color.fromRGBO(249, 177, 122, 1.0),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(10,15,10,15),
        minWidth: MediaQuery.of(context).size.width,
        splashColor: Colors.black.withOpacity(0.2),
        onPressed:(){


            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

        } ,
        child: Text("Login",textAlign: TextAlign.center,
          style:TextStyle(fontSize: 15,fontFamily:'Arimo',color: Colors.black,fontWeight: FontWeight.bold) ,
        ),
      ),

    );
    return  Scaffold(
      appBar: AppBar(title:
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            SizedBox(height: 5,),
            Row(
              children: [
                Text('Login',style: TextStyle(fontSize: 16,fontFamily: 'Arimo',fontWeight: FontWeight.bold,color: Colors.black),),
                SizedBox(width: 2,),
                Icon(Icons.person_outline,color: Colors.black,)
              ],
            ),
            SizedBox(height: 2,),
            Text('Welcome to MyVec',style: TextStyle(fontSize: 12,fontFamily: 'Arimo',fontWeight: FontWeight.w100,color: Colors.black45),textAlign: TextAlign.left,)
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
      body:  SingleChildScrollView(
          child:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formkey ,
              child: Column(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset("assets/loginpagecar.jpg",
                        fit: BoxFit.fill,
                        height: 200,
                        width: 500,
                      )),
                  SizedBox(height: 15),
                  emailField,
                  SizedBox(height: 25),
                  passwordField,
                  SizedBox(height: 8,),
                  Row(
                    children:[
                      SizedBox(width: 195,),
                      InkWell(child:Text('Forgot password?',style: TextStyle(fontFamily:'Arimo',color: Color.fromRGBO(249, 177, 122, 1.0),fontWeight: FontWeight.bold),),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PasswordReset()));
                      },
                      ),
        ]
                  ),
                  SizedBox(height: 15),
                  loginButton,
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child:
                      Divider(color: Colors.black38,indent: 10,endIndent: 10,),),
                      Text('Or',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black38,fontFamily: 'Arimo'),),
                      Expanded(child:
                      Divider(color: Colors.black38,indent: 10,endIndent: 10))
                    ],
                  ),
                  SizedBox(height: 12),
                  Material(
                    elevation: 2,
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(237, 237, 235, 1.0),
                      child: MaterialButton(
                        padding: EdgeInsets.fromLTRB(10,15,10,15),
                        splashColor: Colors.black.withOpacity(0.2),
                        onPressed:(){
                            SignInWithGoogle();
                        } ,
                        child: Row(

                            children:[
                              SizedBox(width: 15,),
                              Image.asset("assets/google.png",
                                height: 27,
                              ) ,
                              SizedBox(width: 35,),
                              Text("Continue with Google",textAlign: TextAlign.center,
                                style:TextStyle(fontSize: 15,fontFamily:'Arimo',color: Color.fromRGBO(0, 0, 0, 0.60),fontWeight: FontWeight.bold) ,
                              ),
                            ]
                        ),
                      )
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account?",style: TextStyle(fontFamily:'Arimo',fontWeight:FontWeight.w900)),
                      GestureDetector(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                      },
                        child: Text(" SignUp",

                            style: TextStyle(color:Color.fromRGBO(249, 177, 122, 1.0),fontFamily:'Arimo',fontWeight: FontWeight.bold,fontSize: 14)),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),

        ),

      );

  }
  void _toggleview(){
    setState(() {
      _isHidden=!_isHidden;
    });
  }
  SignInWithGoogle() async{
    GoogleSignInAccount? googleUser= await GoogleSignIn().signIn();
     GoogleSignInAuthentication? googleAuth= await googleUser?.authentication;
    AuthCredential credential=GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential= await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);
  }
}

