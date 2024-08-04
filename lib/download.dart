import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/vedio.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class Download extends StatefulWidget {
  Download({super.key});

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  Map<int, List> data = {
    1: ['OPPENHEIMER', 'images/Poster (7).png', 'Movie', '2023', 'Total of 4.28GB', 3],
    2: ['The Witcher', 'images/Poster (6).png', 'Serie', 'Downloaded EP 8', 'S1', 2],
    3: ['HIJACK', 'images/Poster (8).png', 'Serie', 'Downloaded EP 3', 'S1', 33],
    4: ['OPPENHEIMER', 'images/Poster (7).png', 'Movie', '2023', 'Total of 4.28GB', 23]
  };

  calculateSize() {
    num sum = 0;
    for (int i = 0; i < data.length; i++) {
      sum = sum + data.values.elementAt(i).last;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  fillColor: Colors.white10,
                  filled: true,
                  hintText: 'Search in downloads',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Download',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                  size: 40,
                )
              ],
            ),
            Text(
              '${data.length} Videos .${calculateSize()}GB',
              style: const TextStyle(color: Colors.white54),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 10),
                separatorBuilder: (context,index){
                  return SizedBox(height:index==0? 0:10,);
                },
                itemBuilder: (context, i) {
                  int key = data.keys.elementAt(i);
                  return Container(
                    height: 200,
                    child: Row(
                      children: [
                        Image.asset(

                          data[key]![1],
                          fit: BoxFit.contain,
                          height: 180,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30,),
                            Text(

                              '${data[key]![0]}',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '${data[key]![2]}',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '${data[key]![3]}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Spacer(),

                        Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return const VideoApp();
                              }));
                            },
                              child: Container(

                                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(9)),
                                height: 50,width: 50,

                                child: Icon(
                                  Icons.play_arrow, color: Colors.red,size: 30,
                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(19.0),
                              child: Container(
                                decoration: BoxDecoration(color: Colors.red[900],borderRadius: BorderRadius.circular(9)),
                                height: 50,width: 50,
                                child: IconButton(
                                  icon: Icon(Icons.delete, color: Colors.white,size: 27,),

                                  onPressed: () {
                                    Alert(
                                      context: context,
                                      type: AlertType.warning,
                                      title: "Delete ALERT",
                                      desc: "Are You Sure ?",
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "Yes",
                                            style: TextStyle(color: Colors.white, fontSize: 20),
                                          ),
                                          onPressed: () {Navigator.pop(context);
                                          setState(() {
                                            data.remove(key);
                                          });
                                            },
                                          color: Color.fromRGBO(0, 179, 134, 1.0),
                                        ),
                                        DialogButton(
                                          child: Text(
                                            "No",
                                            style: TextStyle(color: Colors.white, fontSize: 20),
                                          ),
                                          onPressed: () {Navigator.pop(context);
                                           // Perform the action

                                          },

                                          gradient: LinearGradient(colors: [
                                            Color.fromRGBO(116, 116, 191, 1.0),
                                            Color.fromRGBO(52, 138, 199, 1.0)
                                          ]),
                                        )
                                      ],
                                    ).show();

                                  },
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
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
