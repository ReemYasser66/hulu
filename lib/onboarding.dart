import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:movies/profiles.dart';

import 'login.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(totalPage: 3,
        headerBackgroundColor: Colors.black,
        background: [
          Column(
            children: [
              Image.asset('images/Hulu-Logo 1.png',width: 90,),   //logo
              Image.asset('images/Group 39556 (1).png',width: 360,height: 270,),

              const Text('Unlimited',style: TextStyle(color: Color(0xff00CF71),fontSize: 40, fontWeight: FontWeight.bold),),
              const Text('movies ,TV shows & More...',style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),),
              const SizedBox(height: 15,),
              const Text('Watch anywhere , cancel anytime.',style: TextStyle(color: Colors.white),)
            ],
          ),   //p1
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 55,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Download',style: TextStyle( color: Color(0xff00CF71), fontSize: 55,fontWeight: FontWeight.bold),),
                  Text('SHOWS ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 50),),
                  Text('& MOVIES ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 50),),
                ],
              ),
            ],
          ),   //page2
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Party Mode',style: TextStyle(color: Color(0xff00CF71), fontSize: 35,fontWeight: FontWeight.bold),),
                Text('Is now live',style: TextStyle(color: Colors.white, fontSize: 35,fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                Image.asset('images/1.png'),
                SizedBox(height: 15,),
                Row(
                  children: [
                    SizedBox(width: 40,),
                    Image.asset('images/2.png'),
                  ],
                ),
                SizedBox(height: 10,),
                Text('Enjoy watching your Favorite movies & shows\n  with your friends using Party Mode party holds up to 20', style: TextStyle(color: Colors.white54 ,fontSize: 10),)


              ],
            ),
          ),      //page3
        ],
        onFinish: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return Profiles ();
          }));
        },
        finishButtonStyle:  FinishButtonStyle(
          backgroundColor: Color(0xff00CF71),
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(44))
        ),
        finishButtonText: 'Login',
        finishButtonTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 22),
        pageBackgroundColor: Colors.black,
        speed: 3,
        pageBodies: [
          Container(),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Image.asset('images/iPhone 13 Pro (1).png'),
          ),
          Container(),
        ]);
  }
}
