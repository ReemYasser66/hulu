import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/login.dart';
import 'package:movies/profiles.dart';
import 'package:movies/welcome.dart';
import 'package:movies/onboarding.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body:
        Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.5,
              child:Image.asset('images/WhatsApp Image 2023-09-27 at 21.51.14.jpg', fit: BoxFit.fill,)
              ,
            ),
            Image.asset('images/Hulu-Logo 1.png', width: 150,),
            Text('Enjoy The Best  Movies and TV shows Out there', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Watch full seasons of exclusive streaming series,episodes,hitmovies, Hulu Originals, kids shows, and more...', style: TextStyle(color: Colors.grey),),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Onboarding ();
                }));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container( alignment: Alignment.center,
                  height: 55,
                  width: 300,
                  decoration:BoxDecoration(
                    color: Color(0xff00CF71),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text('Get Started', style: TextStyle(color: Colors.white, fontSize: 22),)
                  ,
                ),
              ),
            ),
            InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Profiles ();
                }));
              } ,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container( alignment: Alignment.center,
                  height: 55,
                  width: 280,
                  decoration:BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 22),)
                  ,
                ),
              ),
            ),
          ],
        )
        ,
      ),
    );
  }
}
