import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/register.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'login.dart';
class Confirmation extends StatelessWidget {
var controller1=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Register ();
                }));
              } ,
              child: Container(
                child: const Icon(Icons.arrow_back_ios_new_sharp, color: Colors.white54, ),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: Colors.white54
                    )
                ),
              ),
            ),
          ),  //buttonback
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Confirm Account',style: TextStyle(color: Color(0xff00CF71),fontSize: 30,fontWeight: FontWeight.bold ),),
          ),
          const Padding(
            padding: EdgeInsets.all(6.0),
            child: Text('A registration confirmation code Will be sent to your phone number',style: TextStyle(color: Colors.white54 , fontSize: 11)),
          ),
          const SizedBox(height: 40,),
          Form(
            autovalidateMode: AutovalidateMode.always,
            child: OtpTextField(
              autoFocus: true,
              numberOfFields: 5,
              borderColor: Colors.white10,
              fillColor: Colors.white,
              borderRadius: BorderRadius.circular(3),
              showFieldAsBox: true,
              fieldWidth: 55,
              cursorColor: Colors.white10,
            ),
          ), //اللون مش بيتغير
          const SizedBox(height: 20,),
          Center(
            child: InkWell(
              onTap:(){
                controller1==null?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("requried"))):
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Login ();
                }));
              } ,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container( alignment: Alignment.center,
                  height: 48,
                  width: 290,
                  decoration:BoxDecoration(
                    color: const Color(0xff00CF71),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Text('Confirm', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),)
                  ,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Text('Resend code',style: TextStyle(color: Colors.white , fontSize: 13),)),
          ),
          Spacer(),
          Text('By clicking “ CONFIRM “ you accepted our Terms & Conditions of the User Agreement',style: TextStyle(color: Colors.white54, fontSize: 12),)
        ],
      ),
    );
  }
}
