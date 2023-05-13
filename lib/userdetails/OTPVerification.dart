import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final first= new TextEditingController();
  final second= new TextEditingController();
  final third= new TextEditingController();
  final fourth= new TextEditingController();
  final _formkey= GlobalKey<FormState>();
  late FocusNode firstNode;
  late FocusNode secondNode;
  late FocusNode thirdNode;
  late FocusNode fourthNode;
  @override
  void initState() {
    super.initState();

    firstNode = FocusNode();
    secondNode = FocusNode();
    thirdNode = FocusNode();
    fourthNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    final firstfield= Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(227, 230, 243, 1.0),
        child: TextFormField(
          textAlign: TextAlign.center,
          maxLength: 1,
          autofocus: false,
          focusNode: firstNode,
          controller: first,
          style: TextStyle(fontFamily: 'Arimo'),
          keyboardType: TextInputType.phone,
          validator: (value){
            if(value!.isEmpty){
              return("Enter your mobile.no");
            }
            if(value.length>10){
              return("Please enter a number less than 10 characters");
            }
            return null;
          },
          onChanged: ((value) {
            if (value.length >= 1) {
              firstNode.unfocus();
              FocusScope.of(context).requestFocus(secondNode);
            }
          }),
          onSaved: (value)

          {
            first.text=value!;

          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
              border: InputBorder.none,
              counterText: ''
          ),
        )
    );
    final secondfield= Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(227, 230, 243, 1.0),
        child: TextFormField(
          focusNode: secondNode,
          textAlign: TextAlign.center,
          maxLength: 1,
          autofocus: false,
          controller: second,
          style: TextStyle(fontFamily: 'Arimo'),
          keyboardType: TextInputType.phone,
          validator: (value){
            if(value!.isEmpty){
              return("Enter your mobile.no");
            }
            if(value.length>10){
              return("Please enter a number less than 10 characters");
            }
            return null;
          },
          onChanged: ((value) {
            if (value.length >= 1) {
              secondNode.unfocus();
              FocusScope.of(context).requestFocus(thirdNode);}
              if (value.length ==0) {
                secondNode.unfocus();
                FocusScope.of(context).requestFocus(firstNode);
              }

          }),
          onSaved: (value)

          {
            second.text=value!;

          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
              border: InputBorder.none,
              counterText: ''
          ),
        )
    );
    final thirdfield= Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(227, 230, 243, 1.0),
        child: TextFormField(
          textAlign: TextAlign.center,
          maxLength: 1,
          autofocus: false,
          focusNode: thirdNode,
          controller: third,
          style: TextStyle(fontFamily: 'Arimo'),
          keyboardType: TextInputType.phone,
          validator: (value){
            if(value!.isEmpty){
              return("Enter your mobile.no");
            }
            if(value.length>10){
              return("Please enter a number less than 10 characters");
            }
            return null;
          },
          onChanged: ((value) {
            if (value.length >= 1) {
              thirdNode.unfocus();
              FocusScope.of(context).requestFocus(fourthNode);}
              if (value.length ==0) {
                thirdNode.unfocus();
                FocusScope.of(context).requestFocus(secondNode);
              }
          }),
          onSaved: (value)

          {
            third.text=value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
              border: InputBorder.none,
              counterText: ''
          ),
        )
    );
    final fourthfield= Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(227, 230, 243, 1.0),
        child: TextFormField(
          textAlign: TextAlign.center,
          maxLength: 1,
          autofocus: false,
          focusNode: fourthNode,
          controller: fourth,
          style: TextStyle(fontFamily: 'Arimo'),
          keyboardType: TextInputType.phone,
          validator: (value){
            if(value!.isEmpty){
              return("Enter your mobile.no");
            }
            if(value.length>10){
              return("Please enter a number less than 10 characters");
            }
            return null;
          },
          onChanged: ((value) {
            if (value.length ==0) {
              fourthNode.unfocus();
              FocusScope.of(context).requestFocus(thirdNode);
            }
          }),
          onSaved: (value)

          {
            fourth.text=value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
              border: InputBorder.none,
              counterText: ''
          ),
        )
    );
    final signupButton = Padding(padding: const EdgeInsets.all(20.0), child:Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(25),
      color: Color.fromRGBO(249, 177, 122, 1.0),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20,15,20,15),
        minWidth: MediaQuery.of(context).size.width,

        onPressed:() {
    (otpmerge(first.text,second.text,third.text,fourth.text).compareTo('1234')==0)?
    Fluttertoast.showToast(msg: 'OTP Verified Successfully',):Fluttertoast.showToast(msg: 'Invalid OTP ! !');

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

              SizedBox(height: 15),
              Image.asset('assets/tick.png',
                height: 80,
                width: 80,
              ),
              SizedBox(height: 15,),
              Text("Account created",style: TextStyle(fontSize: 18,fontFamily: 'Arimo',color:Color.fromRGBO(
                  0, 0, 0, 1.0), ),textAlign: TextAlign.center,),
              SizedBox(height: 3,),
              Text("successfully",style: TextStyle(fontSize: 19,fontFamily: 'Arimo',color:Color.fromRGBO(
                  0, 0, 0, 1.0), ),textAlign: TextAlign.center,),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
      );
    }
    );
    },
        child: Text("Verify",textAlign: TextAlign.center,
          style:TextStyle(fontSize: 15,fontFamily:'Arimo',color: Colors.black,fontWeight: FontWeight.bold) ,

        ),
      ),
    )
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body:  Container(
          child:Padding(
          padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formkey ,
        child:Column(
          children: [
            SizedBox(height: 40,),
          Image.asset("assets/otpscreen.png",
          height: 300,
          width: 500,
        ),
            SizedBox(height: 10,),
            Text("Verification Code",style: TextStyle(fontSize: 20,fontFamily: 'Arimo',fontWeight: FontWeight.bold,color:Color.fromRGBO(8,47,72,1), ),textAlign: TextAlign.center,),
            SizedBox(height: 12,),
            Text("We have sent the verification code",style: TextStyle(fontSize: 15,fontFamily: 'Arimo',color:Color.fromRGBO(
                180, 172, 172, 1.0), ),textAlign: TextAlign.center,),
            SizedBox(height: 3,),
            Text("to your mobile",style: TextStyle(fontSize: 15,fontFamily: 'Arimo',color:Color.fromRGBO(
                180, 172, 172, 1.0), ),textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
            SizedBox(
              width:60,
            child:firstfield,),
                SizedBox(width: 10,),
                SizedBox(
                  width:60,
                  child:secondfield,),
                SizedBox(width: 10,),
                SizedBox(
                  width:60,
                  child:thirdfield,),
                SizedBox(width: 10,),
                SizedBox(
                  width:60,
                  child:fourthfield,)
                ]
            ),
            SizedBox(height: 50,),
            signupButton
           ]
        ),
      ),
    )
    )

    );
  }
  String otpmerge (String firstNum,String secondNum,String thirdNum,String fourthNum){
    String otp=firstNum+secondNum+thirdNum+fourthNum;
    return otp;
  }
}
