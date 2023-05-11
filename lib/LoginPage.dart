import 'package:flutter/material.dart';

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
                  ?Icons.visibility_off
                  :Icons.visibility,
              color: Color.fromRGBO(0, 0, 0, 1.0),
            ),
          ),
          border: InputBorder.none,

      ),
      )
    );
    final loginButton = Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(10),
      color: Color.fromRGBO(249, 177, 122, 1.0),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(10,15,10,15),
        minWidth: MediaQuery.of(context).size.width,
        splashColor: Colors.black.withOpacity(0.2),
        onPressed:(){

          if((emailcontroller.text=='jashwanthkumar.ad21@bitsathy.ac.in') && (passwordcontroller.text=='123456')){


          }
          else {

          }
        } ,
        child: Text("Login",textAlign: TextAlign.center,
          style:TextStyle(fontSize: 15,fontFamily:'Arimo',color: Colors.black,fontWeight: FontWeight.bold) ,
        ),
      ),

    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
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
                  SizedBox(height: 35),
                  loginButton,
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(237, 237, 235, 1.0),
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10,15,10,15),
                          splashColor: Colors.black.withOpacity(0.2),
                          onPressed:(){

                          } ,
                          child: Image.asset("assets/img.png",
                            height: 27,
                            width: 120,
                          ) ,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(237, 237, 235, 1.0),
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10,15,10,15),
                          splashColor: Colors.black.withOpacity(0.2),
                          onPressed:(){

                          } ,
                          child: Image.asset("assets/img_2.png",
                            height: 27,
                            width: 120,
                          ) ,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account?",style: TextStyle(fontFamily:'Arimo',fontWeight:FontWeight.w900)),
                      GestureDetector(onTap: (){
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
      ),


    );
  }
  void _toggleview(){
    setState(() {
      _isHidden=!_isHidden;
    });
  }
}
