import 'package:flutter/material.dart';
class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final emailEditingController= new TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              hintText: "Enter your email-ID",
              hintStyle: TextStyle(fontFamily: 'Arimo'),
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

        } ,
        child: Text("Continue",textAlign: TextAlign.center,
          style:TextStyle(fontSize: 15,fontFamily:'Arimo',color: Colors.black,fontWeight: FontWeight.bold) ,

        ),
      ),

    );
    return Scaffold(
      body: Container(
        child:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 40,),
            Image.asset("assets/emailreset.png",
              height: 300,
              width: 500,
            ),
            Text("Forgot Password",style: TextStyle(fontSize: 20,fontFamily: 'Arimo',fontWeight: FontWeight.bold,color:Color.fromRGBO(
                0, 0, 0, 1.0), ),textAlign: TextAlign.center,),
            SizedBox(height: 12,),
            emailField,
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
            const Text("Try another way",style: TextStyle(decoration:TextDecoration.underline,fontSize: 15,fontFamily: 'Arimo',fontWeight: FontWeight.bold,color:Color.fromRGBO(10, 101, 209, 1.0), ),textAlign: TextAlign.start,),
                Text('')
            ]
            ),
            SizedBox(height: 130),
            signupButton,
          ],
        ),
      ),
      )
    );
  }
}
