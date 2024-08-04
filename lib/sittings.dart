import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/home.dart';
import 'login.dart';

class Sittings extends StatefulWidget {
  Color dark=Colors.black;

  @override
  State<Sittings> createState() => _SittingsState();
}

class _SittingsState extends State<Sittings> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body:
      Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.all(22.0),
                child: InkWell(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Home ();
                    }));
                  } ,
                  child: Container(
                    child: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.white54, ),
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
              ),
              Text('Settings',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),),

            ],
          ),
          SizedBox(height: 5,),
          Row(
          children: [
            SizedBox(width: 9,),
            SizedBox(
                height: 170,
                width: 110,
                child: Image.asset('images/Frame 3.png')),  //profile pic
            SizedBox(
              width: 10,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text('Profile' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold,color: Colors.white),),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Container(
                  height: 27,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.circle,color: Colors.green,size: 10,),
                      Text('Helmi', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                SizedBox(width: 5,),
                Text('Status - Active',style: TextStyle(color: Colors.white54,fontSize: 10),)
              ],
            ), //active status
              SizedBox(height: 20,),
                Text('App Language',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                SizedBox(height: 10,),
                Container(
                  height: 40,
                  width: 220,
                  decoration: BoxDecoration(color: Colors.white30,borderRadius: BorderRadius.circular(7)),
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Text('English',style: TextStyle(color: Colors.white),),
                      SizedBox(width: 120,),
                      Icon(Icons.arrow_drop_down_sharp,color: Colors.white,)
                    ],
                  ),
                )
              ],
            )
          ],
          ),  //Accountdetails
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Streaming Settings', style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
              ],
            ),
          ), //streaming setting
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height:45 ,
            width: 340,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white12
            ),
            child: Row(
              children: [
                SizedBox(width: 13,),
                Text('Only By Wifi',style: TextStyle(color: Colors.white,fontSize: 13),),
                Spacer(),
                Icon(Icons.swap_horiz ,color: Colors.white,),
                SizedBox(width: 5,)
              ],
            ),
          ),
        ),  //container1
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height:45 ,
            width: 340,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white12
            ),
            child: Row(
              children: [
                SizedBox(width: 13,),
                Text('Light and Dark mode',style: TextStyle(color: Colors.white,fontSize: 13),),
                Spacer(),
                Icon(Icons.swap_horiz,color: Colors.white,),
                SizedBox(width: 5,)
              ],
            ),
          ),
        ), //container2
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height:35 ,
            width: 340,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white12
            ),
            child: const Row(
              children: [
                SizedBox(width: 13,),
                Text('Tv Connect',style: TextStyle(color: Colors.white,fontSize: 13),),
                Spacer(),
                Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,size: 15,),
                SizedBox(width: 6,)
              ],
            ),
          ),
        ), //container3
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height:35 ,
            width: 340,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white12
            ),
            child: const Row(
              children: [
                SizedBox(width: 13,),
                Text('Default Quality',style: TextStyle(color: Colors.white,fontSize: 13),),
                Spacer(),
                Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,size: 15,),
                SizedBox(width: 6,)
              ],
            ),
          ),
        ), //container4
        Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Notification', style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
              ],
            ),
          ),    //notification
        Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              height:45 ,
              width: 340,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white12
              ),
              child: Row(
                children: [
                  SizedBox(width: 13,),
                  Text('Allow Notifications ',style: TextStyle(color: Colors.white,fontSize: 13),),
                  Spacer(),
                  Icon(Icons.swap_horiz ,color: Colors.white,),
                  SizedBox(width: 5,)
                ],
              ),
            ),
          ),  //container5
        SizedBox(height: 40,),
          Container(
          width: 180,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            color: Color(0xff00CF71),
          ),
            child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Login ();
                  }));
                },
                child: Center(child: Text('Log out',style: TextStyle(fontWeight: FontWeight.bold),))),
        )
        ],
      ),
    );
  }
}
