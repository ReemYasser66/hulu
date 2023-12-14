import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Download extends StatefulWidget {
   Download({super.key});

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
Map <int,List>data ={
  1:['OPPENHEIMER', 'images/Poster (7).png', ' Movie', '2023',' Total of 4.28GB',3],
  2:['The Witcher', 'images/Poster (6).png', ' Serie',' Downloaded EP 8','S1',2],
  3:['HIJACK', 'images/Poster (8).png', ' Serie', 'Downloaded EP 3 ',' S1',33],
  4:['OPPENHEIMER', 'images/Poster (7).png', ' Movie', '2023',' Total of 4.28GB',23]

};
calculateSize(){
  num sum=0;
  for(int i =0 ; i<data.length;i++){
    sum =sum+data.values.elementAt(i).last;
  }
  return sum;
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              decoration:const InputDecoration(
                fillColor: Colors.white10,
                filled: true,
                hintText: 'Search in downloads',
                prefixIcon: Icon(Icons.search, color: Colors.white,)
              ) ,
            ),
            const Row(
              children: [
                SizedBox(width: 20,),
                Text('Download',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white),),
                SizedBox(width: 10,),
                Icon(Icons.arrow_downward, color: Colors.white,size: 40,)
              ],
            ),
            Text('${data.length} Videos .${calculateSize()}GB',style:
              const TextStyle(color: Colors.white54),),
            Flexible(
              child: ListView.builder(itemBuilder: (context, i){
                return Container(
                  height: 200,
                  child:Row(
                    children: [
                      Image.asset(data.values.elementAt(i)[1])
                    ],
                  )
                  ,
                );
              },
                itemCount: data.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
