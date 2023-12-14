import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/login.dart';

import 'home.dart';

class Profiles extends StatelessWidget {
List pics=[
  'images/Group 39583.png',
'images/Frame 1.png',
  'images/Frame 3.png',
  'images/Frame 4.png',
  'images/Frame 5.png',
  'images/Frame 6.png',

];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body:
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: MediaQuery.of(context).size.height*0.08,
                  child: Image.asset('images/Hulu-Logo 1.png')),
            ), //logo
            Text('Who is', style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text('Watching ?', style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(height: MediaQuery.of(context).size.height*0.6,
                child: GridView.builder(
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    mainAxisSpacing: 20,
                      crossAxisSpacing: 0,
                      mainAxisExtent: 180
                ), itemBuilder: (context, index){
                      return InkWell(
                        onTap: (){
                          index==0?Navigator.push(context, MaterialPageRoute(builder: (context){return Login();}))
                              :Navigator.push(context, MaterialPageRoute(builder: (context){return Home();}));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Colors.black,image: DecorationImage(image: AssetImage("${pics[index]}"))),
                        ),
                      );
                }),
              ),
            ),   //gridview
          ],
        )
        ,
      ),
    );
  }
}
