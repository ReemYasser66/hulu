import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/download.dart';
import 'package:movies/sittings.dart';
import 'package:movies/vedio.dart';
import 'package:flutter/rendering.dart';
class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(  // Added SingleChildScrollView
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(image: AssetImage('images/edited.png'), fit: BoxFit.fill),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return Sittings();
                            }));
                          },
                          child: Image.asset('images/sitting.png'),
                        ),
                      ],
                    ),
                  ), // sitting icon
                  const SizedBox(height: 350,),
                  Container(
                    height: 50,
                    width: 140,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(27)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const VideoApp();
                        }));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.play_arrow, color: Colors.black,),
                          Text('Play', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ), // play button
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      const Text('Trending Now', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                      const Icon(Icons.arrow_drop_down, color: Colors.white, size: 30,),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return Download();
                          }));
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white54
                          ),
                          child: const Icon(Icons.download, color: Colors.white,),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 200,  // Added height to contain the horizontal ListView
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      height: 170,
                      width: 170,
                      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('images/Movie (1).png'))),
                    );
                  }
              ),
            ),
            const Row(
              children: [
                Text('Latest Movies', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                Spacer(),
                Text('see all', style: TextStyle(color: Colors.white54),)
              ],
            ),
            SizedBox(
              height: 200,  // Added height to contain the horizontal ListView
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      height: 170,
                      width: 170,
                      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('images/Movie (1).png'), fit: BoxFit.cover)),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );


  }
}
