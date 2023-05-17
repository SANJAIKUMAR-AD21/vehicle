import 'package:flutter/material.dart';
import 'package:vehicle/mainpage/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';
import 'OTPVerification.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth=FirebaseAuth.instance;
  final _formkey= GlobalKey<FormState>();
  final firstnameEditingController= new TextEditingController();
  final lastnameEditingController= new TextEditingController();
  final emailEditingController= new TextEditingController();
  final phoneEditingController= new TextEditingController();
  final passwordEditingController= new TextEditingController();
  final confirmpasswordEditingController= new TextEditingController();
  bool _isHidden=true;
  bool _isHidden2=true;
  @override
  Widget build(BuildContext context) {
    final firstnameField = Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(20),
      color: Color.fromRGBO(219, 223, 244, 1.0),
      child:TextFormField(
      autofocus: false,
      controller: firstnameEditingController,
      style: TextStyle(fontFamily: 'Arimo'),
      keyboardType: TextInputType.name,
      validator: (value){
        if(value!.isEmpty){
          return("First name cannot be empty");
        }

        return null;
      },
      onSaved: (value)
      {
        firstnameEditingController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon:Icon(Icons.person_outline,color: Color.fromRGBO(
              0, 0, 0, 1.0),),
          contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
          hintText: "First Name",
          hintStyle: TextStyle(fontFamily: 'Arimo'),
          border: InputBorder.none

      ),
      )
    );
    final lastnameField = Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(20),
      color: Color.fromRGBO(219, 223, 244, 1.0),
      child:TextFormField(
      autofocus: false,
      controller: lastnameEditingController,
      style: TextStyle(fontFamily: 'Arimo'),
      keyboardType: TextInputType.name,
      validator: (value){
        if(value!.isEmpty){
          return("last name cannot be empty");
        }
        return null;
      },
      onSaved: (value)
      {
        lastnameEditingController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon:Icon(Icons.person_outline,color: Color.fromRGBO(
              0, 0, 0, 1.0),),
          contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
          hintText: "Last Name",
          hintStyle: TextStyle(fontFamily: 'Arimo'),
          border: InputBorder.none
      ),
      )
    );
    final emailField = Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(20),
      color: Color.fromRGBO(219, 223, 244, 1.0),
      child:TextFormField(
      autofocus: false,
      controller: emailEditingController,
      style: TextStyle(fontFamily: 'Arimo'),
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value!.isEmpty){
          return("Enter your email");
        }
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[bitsathy]+.[a-z]").hasMatch(value)){
          return("Please enter a valid email!");
        }
        return null;
      },
      onSaved: (value)

      {
        emailEditingController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon:Icon(Icons.mail_outline,color: Color.fromRGBO(0, 0, 0, 1.0),),
          contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
          hintText: "Email",
          hintStyle: TextStyle(fontFamily: 'Arimo'),
          border: InputBorder.none

      ),
      )
    );
    final phoneField = Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(219, 223, 244, 1.0),
        child:TextFormField(
      autofocus: false,
      controller: phoneEditingController,
      style: TextStyle(fontFamily: 'Arimo'),
      keyboardType: TextInputType.text,
      validator: (value){
        if(value!.isEmpty){
          return("Enter your mobile.no");
        }
        if(value.length>10){
          return("Please enter a number less than 10 characters");
        }
        return null;
      },
      onSaved: (value)

      {
        phoneEditingController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon:Icon(Icons.phone_android_outlined,color: Color.fromRGBO(0, 0, 0, 1.0),),
          contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
          hintText: "Phone Number",
          hintStyle: TextStyle(fontFamily: 'Arimo'),
          border: InputBorder.none

      ),
        )
    );
    final passwordField = Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(20),
      color: Color.fromRGBO(219, 223, 244, 1.0),
      child:TextFormField(
      autofocus: false,
      controller: passwordEditingController,
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
        passwordEditingController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon:Icon(Icons.lock_outline_rounded,color: Color.fromRGBO(
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
          border: InputBorder.none

      ),
      )
    );
    final confirmpasswordField = Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(20),
      color: Color.fromRGBO(219, 223, 244, 1.0),
      child:TextFormField(
      autofocus: false,
      controller: confirmpasswordEditingController,
      style: TextStyle(fontFamily: 'Arimo'),
      obscureText: _isHidden2,
      validator: (value){
        if(confirmpasswordEditingController.text!= passwordEditingController.text){
          return "Password doesn't match";
        }
        return null;
      },
      onSaved: (value)
      {
        confirmpasswordEditingController.text=value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon:Icon(Icons.lock_outline_rounded,color: Color.fromRGBO(
              0, 0, 0, 1.0),),
          contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
          hintText: "Confirm Password",
          hintStyle: TextStyle(fontFamily: 'Arimo'),
          suffixIcon: InkWell(
            onTap: _toggleview2,
            child: Icon(
              _isHidden2
                  ?Icons.visibility_off_outlined
                  :Icons.visibility_outlined,
              color: Color.fromRGBO(0, 0, 0, 1.0),
            ),
          ),
          border: InputBorder.none

      ),
      )
    );
    final signupButton = Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(25),
      color: Color.fromRGBO(249, 177, 122, 1.0),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20,15,20,15),
        minWidth: MediaQuery.of(context).size.width,

        onPressed:() async{
          signUp(emailEditingController.text, passwordEditingController.text,);
        } ,
        child: Text("SignUp",textAlign: TextAlign.center,
          style:TextStyle(fontSize: 15,fontFamily:'Arimo',color: Colors.black,fontWeight: FontWeight.bold) ,

        ),
      ),

    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title:
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            SizedBox(height: 5,),
            Row(
              children: [
                Text('Sign Up',style: TextStyle(fontSize: 16,fontFamily: 'Arimo',fontWeight: FontWeight.bold,color: Colors.black),),
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
        toolbarHeight: 60,
        shadowColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child:Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formkey ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    firstnameField,
                    SizedBox(height: 20),
                    lastnameField,
                    SizedBox(height: 20),
                    emailField,
                    SizedBox(height: 20),
                    phoneField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmpasswordField,
                    SizedBox(height: 20),
                    signupButton,

                    SizedBox(height: 8),
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
                    SizedBox(height: 8),
                    Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(237, 237, 235, 1.0),
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10,15,10,15),
                          splashColor: Colors.black.withOpacity(0.2),
                          onPressed:(){

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
                        Text("Already have an account?",style: TextStyle(fontFamily:'Arimo',fontWeight:FontWeight.w900)),
                        GestureDetector(onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                        },
                          child: Text(" Login",

                              style: TextStyle(color:Color.fromRGBO(249, 177, 122, 1.0),fontFamily:'Arimo',fontWeight: FontWeight.bold,fontSize: 14)),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
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
  void _toggleview2(){
    setState(() {
      _isHidden2=!_isHidden2;
    });
  }
  void signUp(String email,String password) async
  {
    if(_formkey.currentState!.validate())
    {
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
        passDetailsToFirestore()
      }).catchError((e)
      {
        Fluttertoast.showToast(msg: e.message);
      });
    }
  }
  passDetailsToFirestore() async{
    //calling firestore
    //calling user model
    //calling values
    FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
    User? user=_auth.currentUser;
    UserModel userModel=UserModel();
    userModel.email=user!.email;
    userModel.uid=user.uid;
    userModel.firstname=firstnameEditingController.text.trim();
    userModel.lastname=lastnameEditingController.text.trim();
    userModel.phoneno=phoneEditingController.text.trim();

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully !!");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OTPVerification()));

  }
}
