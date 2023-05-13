import 'package:flutter/material.dart';

class newpassword extends StatefulWidget {
  const newpassword({Key? key}) : super(key: key);

  @override
  State<newpassword> createState() => _newpasswordState();
}

class _newpasswordState extends State<newpassword> {
  final passwordEditingController= new TextEditingController();
  final confirmpasswordEditingController= new TextEditingController();
  final _formkey= GlobalKey<FormState>();

  bool _isHidden=true;
  bool _isHidden2=true;
  @override
  Widget build(BuildContext context) {
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
    final submitButton = Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(25),
      color: Color.fromRGBO(249, 177, 122, 1.0),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20,15,20,15),
        minWidth: MediaQuery.of(context).size.width,

        onPressed:() async{
          showDialog(context: context, builder: (context)
          {
            return AlertDialog(
              content: Container(
                height: 200,
                child:Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Text(''),
                        InkWell(
                          child:
                          Icon(Icons.close,color: Colors.redAccent,),
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                        ),

                      ]
                  ),
                  SizedBox(height: 15,),
                  Text("New password is created",style: TextStyle(fontSize: 18,fontFamily: 'Arimo',color:Color.fromRGBO(
                      0, 0, 0, 1.0), ),textAlign: TextAlign.center,),
                  SizedBox(height: 3,),
                  Text("successfully",style: TextStyle(fontSize: 19,fontFamily: 'Arimo',color:Color.fromRGBO(
                      0, 0, 0, 1.0), ),textAlign: TextAlign.center,),
                  SizedBox(height: 20,),
                  Image.asset('assets/reseticon.png',
                    height: 65,
                    width: 65,
                  )
                ],
              ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
            );
          }
          );
        } ,
        child: Text("Submit",textAlign: TextAlign.center,
          style:TextStyle(fontSize: 15,fontFamily:'Arimo',color: Colors.black,fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            child:Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formkey ,
                child: Column(
                  children: [
                    SizedBox(height: 30,),

                    Image.asset("assets/reset.png",
                      height: 300,
                      width: 500,
                    ),
                    Text("Reset Password",style: TextStyle(fontSize: 20,fontFamily: 'Arimo',fontWeight: FontWeight.bold,color:Color.fromRGBO(
                        0, 0, 0, 1.0), ),textAlign: TextAlign.center,),
                    SizedBox(height: 12,),
                    Divider(color: Colors.black,indent: 10,endIndent: 10,),
                    SizedBox(height: 12,),
                    passwordField,
                    SizedBox(height: 20,),
                    confirmpasswordField,
                    SizedBox(height: 118),

                    submitButton,
                  ],
                ),
              ),
            )
        )
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
}
